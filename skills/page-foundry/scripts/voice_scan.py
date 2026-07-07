#!/usr/bin/env python3
"""voice_scan.py: mechanical voice gate for page-foundry.

Rules live in references/voice.md, NOT in this script. The script parses:
  <!-- voice-config ... -->                key: value lines (em_dash, en_dash,
                                           max_exclamations; values fail/warn/off
                                           or an integer)
  <!-- scan:banned-phrases --> ... <!-- /scan:banned-phrases -->   one per line, FAIL
  <!-- scan:judgment-words --> ... <!-- /scan:judgment-words -->   one per line, WARN
  <!-- scan:patterns --> ... <!-- /scan:patterns -->               NAME|||REGEX per line, WARN
                                           (AI language patterns: negative parallelism,
                                           copula avoidance, tailing negation, etc.)

Edit voice.md (or run the Voice wizard) and the scanner follows automatically.
A minimal built-in fallback applies only if voice.md cannot be found.

Scans .html/.md/.txt copy. Strips tags, script/style, and code blocks first so
code samples and class names don't false-positive.

Usage:
    python3 voice_scan.py file1.html pages/myproduct/ ...
    python3 voice_scan.py --rules /path/to/voice.md <targets>

Exit code 0 = clean, 1 = FAIL violations found, 2 = usage error.
"""

import re
import sys
from pathlib import Path

EM_DASH, EN_DASH = "\u2014", "\u2013"
EXTS = {".html", ".htm", ".md", ".txt"}

FALLBACK = {
    "banned": ["delve", "robust", "seamless", "game-changer", "cutting-edge",
               "unlock", "elevate", "streamline", "in today's"],
    "judgment": ["leverage", "navigate", "journey"],
    "config": {"em_dash": "fail", "en_dash": "fail", "max_exclamations": 1},
}


def find_rules_file(cli_path):
    if cli_path:
        return Path(cli_path)
    here = Path(__file__).resolve().parent
    for candidate in (here.parent / "references" / "voice.md",
                      here / "voice.md",
                      Path.cwd() / "references" / "voice.md"):
        if candidate.is_file():
            return candidate
    return None


def parse_block(text, name):
    m = re.search(r"<!--\s*scan:" + name + r"\s*-->(.*?)<!--\s*/scan:" + name + r"\s*-->",
                  text, flags=re.S)
    if not m:
        return []
    items = []
    for line in m.group(1).splitlines():
        line = line.strip()
        if line and not line.startswith("#"):
            items.append(line.lower())
    return items


def parse_patterns(text):
    """Parse the scan:patterns block. Each line is NAME|||REGEX (case-insensitive).
    Emits WARN, not FAIL: language patterns are heuristic and need a human read, but
    the scanner surfaces them so 'not X, it's Y', copula-dodging, and the like cannot
    slip past a word-only gate. Lines starting with # are comments."""
    m = re.search(r"<!--\s*scan:patterns\s*-->(.*?)<!--\s*/scan:patterns\s*-->",
                  text, flags=re.S)
    if not m:
        return []
    pats = []
    for line in m.group(1).splitlines():
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        name, sep, rx = line.partition("|||")
        if not sep:
            name, rx = "ai pattern", name
        try:
            pats.append((name.strip(), re.compile(rx.strip(), re.I)))
        except re.error:
            pass
    return pats


def parse_config(text):
    cfg = dict(FALLBACK["config"])
    m = re.search(r"<!--\s*voice-config(.*?)-->", text, flags=re.S)
    if m:
        for line in m.group(1).splitlines():
            if ":" in line:
                k, v = line.split(":", 1)
                k, v = k.strip().lower(), v.strip().lower()
                if k == "max_exclamations":
                    try:
                        cfg[k] = int(v)
                    except ValueError:
                        pass
                elif k in ("em_dash", "en_dash") and v in ("fail", "warn", "off"):
                    cfg[k] = v
    return cfg


def load_rules(cli_path):
    path = find_rules_file(cli_path)
    if not path or not path.is_file():
        print("note: voice.md not found; using minimal built-in fallback rules", file=sys.stderr)
        return FALLBACK["banned"], FALLBACK["judgment"], [], dict(FALLBACK["config"]), None
    text = path.read_text(encoding="utf-8", errors="replace")
    banned = parse_block(text, "banned-phrases") or FALLBACK["banned"]
    judgment = parse_block(text, "judgment-words")
    patterns = parse_patterns(text)
    return banned, judgment, patterns, parse_config(text), path


def strip_to_copy(text, suffix):
    """Remove non-copy regions so only reader-facing prose is scanned."""
    if suffix in (".html", ".htm"):
        text = re.sub(r"<script\b.*?</script>", " ", text, flags=re.S | re.I)
        text = re.sub(r"<style\b.*?</style>", " ", text, flags=re.S | re.I)
        text = re.sub(r"<!--.*?-->", " ", text, flags=re.S)
        text = re.sub(r"<[^>]+>", " ", text)
    if suffix == ".md":
        text = re.sub(r"```.*?```", " ", text, flags=re.S)
        text = re.sub(r"`[^`]*`", " ", text)
        text = re.sub(r"<!--.*?-->", " ", text, flags=re.S)
    return text


def word_hit(phrase, lowline):
    return re.search(r"(?<![\w-])" + re.escape(phrase) + r"(?![\w-])", lowline)


def scan_file(path, banned, judgment, patterns, cfg):
    fails, warns = [], []
    raw = path.read_text(encoding="utf-8", errors="replace")
    copy = strip_to_copy(raw, path.suffix.lower())
    for i, line in enumerate(copy.splitlines(), 1):
        low = line.lower()
        ctx = line.strip()[:90]
        for phrase in banned:
            if word_hit(phrase, low):
                fails.append((i, f"banned phrase: '{phrase}'", ctx))
        for word in judgment:
            if word_hit(word, low):
                warns.append((i, f"judgment word (figurative use is banned): '{word}'", ctx))
        for name, rx in patterns:
            if rx.search(line):
                warns.append((i, f"AI language pattern ({name})", ctx))
        for dash, key, label in ((EM_DASH, "em_dash", "em dash in prose"),
                                 (EN_DASH, "en_dash", "en dash in prose (use 'to' for ranges)")):
            if dash in line and cfg.get(key) != "off":
                (fails if cfg.get(key) == "fail" else warns).append((i, label, ctx))
    bangs = copy.count("!")
    if bangs > cfg.get("max_exclamations", 1):
        fails.append((0, f"{bangs} exclamation points (max {cfg.get('max_exclamations', 1)} per page)", ""))
    return fails, warns


def collect(targets):
    for t in targets:
        p = Path(t)
        if p.is_dir():
            for f in sorted(p.rglob("*")):
                if f.suffix.lower() in EXTS:
                    yield f
        elif p.is_file():
            yield p
        else:
            print(f"  ?  not found: {t}")


def main(argv):
    args = argv[1:]
    rules_path = None
    if "--rules" in args:
        i = args.index("--rules")
        try:
            rules_path = args[i + 1]
        except IndexError:
            print("--rules requires a path", file=sys.stderr)
            return 2
        del args[i:i + 2]
    if not args:
        print(__doc__)
        return 2
    banned, judgment, patterns, cfg, src = load_rules(rules_path)
    print(f"rules: {src if src else 'built-in fallback'} "
          f"({len(banned)} banned, {len(judgment)} judgment, {len(patterns)} patterns)")
    total_fail = 0
    for f in collect(args):
        fails, warns = scan_file(f, banned, judgment, patterns, cfg)
        if not fails and not warns:
            print(f"PASS  {f}")
            continue
        for line_no, why, ctx in fails:
            loc = f"{f}:{line_no}" if line_no else f"{f}"
            print(f"FAIL  {loc}  {why}" + (f"  | {ctx}" if ctx else ""))
        for line_no, why, ctx in warns:
            print(f"WARN  {f}:{line_no}  {why}" + (f"  | {ctx}" if ctx else ""))
        total_fail += len(fails)
    if total_fail:
        print(f"\n{total_fail} violation(s). Restructure around concrete facts; do not synonym-swap.")
        return 1
    print("\nClean. Voice gate passed (review any WARN lines by hand).")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
