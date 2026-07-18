#!/usr/bin/env bash
# pf-v3-overnight mechanical gate. Exit 0 = green. Operator-owned; the loop may not edit.
set -u
cd "$(dirname "$0")/.." || exit 2
FAIL=0
note(){ echo "verify: $*"; }
bad(){ echo "verify FAIL: $*"; FAIL=1; }

SCAN=skills/page-foundry/scripts/voice_scan.py
RULES=skills/page-foundry/references/voice.md

# 1. Scanner self-test: banned word + em dash must FAIL (exit 1)
printf 'This robust platform is great\xe2\x80\x94truly.\n' > /tmp/pfv3-fail.md
python3 "$SCAN" --rules "$RULES" /tmp/pfv3-fail.md >/dev/null 2>&1
[ $? -eq 1 ] && note "scanner FAIL-case ok" || bad "scanner did not fail on banned+dash"

# 2. Scanner clean-case must PASS (exit 0)
printf 'One scan maps your footprint in 20 minutes.\n' > /tmp/pfv3-ok.md
python3 "$SCAN" --rules "$RULES" /tmp/pfv3-ok.md >/dev/null 2>&1
[ $? -eq 0 ] && note "scanner clean-case ok" || bad "scanner failed clean copy"

# 3. Pattern detection alive (three-verb + a lexical pattern)
printf 'It builds fast, ships clean, and scales well. The tool serves as a base.\n' > /tmp/pfv3-pat.md
P=$(python3 "$SCAN" --rules "$RULES" /tmp/pfv3-pat.md 2>&1 | grep -c 'AI language pattern')
[ "${P:-0}" -ge 2 ] && note "pattern detection ok ($P)" || bad "pattern detection lost (got ${P:-0}, want >=2)"

# 4. Repo skill files scan clean (FAILs only; WARNs reviewed by iterations)
python3 "$SCAN" --rules "$RULES" README.md skills/page-foundry/SKILL.md 2>&1 | grep -q '^FAIL' \
  && bad "FAILs in README.md or SKILL.md" || note "README+SKILL scan ok"

# 5. Installer lifecycle in a temp dir (version, install, blocked reinstall, overlay-preserving update, uninstall)
T=$(mktemp -d)
V=$(node bin/page-foundry.js --version 2>/dev/null)
[ -n "$V" ] && note "bin version ok ($V)" || bad "bin --version failed"
node bin/page-foundry.js install --dir "$T" >/dev/null 2>&1
[ -f "$T/page-foundry/SKILL.md" ] && note "install ok" || bad "install did not land SKILL.md"
node bin/page-foundry.js install --dir "$T" >/dev/null 2>&1 && bad "reinstall not blocked" || note "reinstall blocked ok"
python3 - "$T/page-foundry/references/voice.md" <<'PY' 2>/dev/null
import sys
p=sys.argv[1]; t=open(p).read()
open(p,'w').write(t.replace('owner: default','owner: Taylor Banks',1))
PY
node bin/page-foundry.js update --dir "$T" >/dev/null 2>&1
grep -q '^owner: Taylor Banks' "$T/page-foundry/references/voice.md" && note "overlay preserved on update" || bad "update clobbered voice overlay"
node bin/page-foundry.js uninstall --dir "$T" >/dev/null 2>&1
[ ! -d "$T/page-foundry" ] && note "uninstall ok" || bad "uninstall left directory"
rm -rf "$T"

# 6. npm pack leak check: private/dev files must not ship
TB=$(npm pack --silent 2>/dev/null | tail -1)
if [ -n "$TB" ] && [ -f "$TB" ]; then
  L=$(tar -tzf "$TB" | grep -cE 'taylor-voice|docs/|\.skill$|\.agents|loop/|plans/')
  [ "$L" -eq 0 ] && note "pack leak check ok" || bad "pack leaks $L private/dev paths"
  rm -f "$TB"
else
  bad "npm pack failed"
fi

# 7. Forbidden files never staged/committed
git ls-files | grep -qE 'taylor-voice\.md|^loop/logs/' && bad "forbidden file tracked in git" || note "no forbidden files tracked"

[ $FAIL -eq 0 ] && echo "VERIFY GREEN" || echo "VERIFY RED"
exit $FAIL
