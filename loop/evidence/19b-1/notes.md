# 19b-1: homepage (docs/) truth fixes

Three evidence-backed, version-independent findings on `docs/index.html`, fixed and verified 2026-07-18. The version badge (line 48, `v2.8`) is out of scope here and carried to 19b-2, where the v3.0 shipping-story decision owns it.

## Finding (a): unattributed founder quote (13j-dogfood finding 4)

- Before (`docs/index.html` line 89): `You end up where a founder I know landed: "I'm tired of every page looking like the same ai-generated bullshit."`
- After: `You end up tired of shipping the same AI-generated page every other tool spits out.`
- Why: an anonymous quote attributed to "a founder I know", used as a pain device, on a page whose own integrity gate refuses invented testimony (line 119) and whose gate report claims `Integrity` `0 invented`. Unverifiable, so it reads as fabricated exactly to the skeptical developer audience the page targets.
- The fix removes the unverifiable secondhand attribution while preserving the load-bearing claim: that AI pages look the same, and that this fatigue is what motivates the tool. The claim is unchanged, so the meaning-preservation guardrail holds; the line now states the reader's likely state in the page's own "you"-voice rather than quoting an unnamed source.
- OWNER-REVIEW: this rewrites live homepage marketing copy. If a real, attributable founder quote (name + link) exists, the owner can restore it under the integrity rule; the reframe is the honest default while it cannot be verified. Recorded in the overnight report.

## Finding (b): Measurement gate-report cell (13j-dogfood finding 5)

- Before (line 129): `<td class="pass">GitHub · skills.sh</td>`
- After: `<td class="pass">installs · skills.sh</td>`
- Why: Gate 7 (measurement) requires a measurement plan naming the conversion event, where it is recorded, and the UTM convention (SKILL.md line 252). The old cell named two destinations, not the tracked conversion, and read as an unverifiable self-report. For an oss-project homepage the conversion is an install, recorded via skills.sh install telemetry (the distribution model relies on it; runbook step 9/11). No UTM: organic only. The new cell names the conversion event honestly and claims no on-page analytics the static page does not wire. The `PASS` verdict is defensible on the real plan; the defect was the wording.

## Finding (c): meta description length + three-verb pattern (21a walk + #19 audit-f1b comment)

The meta description was 174 chars (over the ~160 search-result truncation point, so "does not read or look AI-made" was the part cut) and carried the three-verb-clause pattern (`runs ... gates ... and ships ...`) that postdates the shipped copy under the 13f rules. One rewrite settles both, and the og/twitter/JSON-LD siblings are aligned so the fix is not left half-applied.

| field | before | after | note |
|---|---|---|---|
| meta description | 174 | 134 | outcome-focused, under the truncation point |
| og:description | 168 | 165 | orchestration claim kept; og has no 160 snippet limit |
| twitter:description | 110 | 85 | short, pattern-free |
| JSON-LD description | ~170 | 169 | structured data, no truncation concern |

The three-verb pattern is broken everywhere: the length-capped meta drops the parallel list entirely; og/JSON-LD keep the orchestration claim as a two-verb sequence (`runs ... in order, then gates the result into ...`), which does not fire the pattern. Confirmed by running all four strings as `.md` prose through the scanner (the audit-f1b method, since HTML attribute text is stripped before the pattern regexes when scanning `docs/index.html` directly): PASS, 0 FAIL, 0 WARN.

## Verification

- `python3 skills/page-foundry/scripts/voice_scan.py docs/index.html` -> PASS, exit 0 (0 FAIL, 0 WARN).
- Candidate prose scan (`/tmp/pf-cand.md`, all four descriptions + the callout as prose) -> PASS, exit 0. Proves the three-verb pattern no longer fires on the description content itself.
- `node ~/projects/impeccable/skill/scripts/detect.mjs --json docs/index.html docs/theme.css` (from repo root, unpiped) -> `[]`, exit 0 (`detect-after.json`). The `numbered-section-markers` acceptance in `.impeccable/config.json` holds; no new design findings from the edits.
- Render: `interceptor open file://.../docs/index.html` (real Chrome) confirmed the new callout and `Measurement  installs · skills.sh` render in place, and the old founder quote / profanity are gone. Interceptor `screenshot` remained down tonight (`dom render failed: undefined` on a trivial probe, per lesson 30 / iter 48); the edits are text-only with no layout change, so `open` + text extraction is the load-bearing render check and no capture was owed.
- `bash loop/verify.sh` -> GREEN, exit 0.

Not in scope (carried to 19b-2): the homepage version badge, README/skill-README/CHANGELOG/orientation/llms.txt claims audit, plans/v3.0.md status flip, #19 closure.
