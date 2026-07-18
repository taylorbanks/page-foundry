# 13f: voice_scan absorbs impeccable's two text rules (dedup decision, issue #13)

The capability-ownership decision on #13 assigns voice_scan the mechanical text scan, absorbing impeccable's `aphoristic-cadence` and `repeated-section-kickers` rules. REVIEW-2 found the absorption never shipped and reopened the issue. This record covers what shipped and how each acceptance line was proven.

## Source of truth

Rules read from the pinned source, not paraphrased from research: local clone of pbakaus/impeccable at commit `8967edc988ee146823bca3c51fcf51296e9dec18` (package version 3.2.1), cloned to `~/projects/impeccable` (also pre-stages WS3 items 15b and 16, which need the clone for `detect.mjs` and craft-rule spot-checks).

- `aphoristic-cadence`: registry entry in `scripts/detector/registry/antipatterns.mjs` (category slop, section Copy); implementation in `engines/regex/detect-text.mjs`: two case-sensitive regexes (manufactured contrast `Not an? [a-z]... [A-Z]...` and short rebuttal `[A-Z]... (No|Just) [a-z]...`) counted page-wide, finding fires at 3 or more. Doctrine string: once is fine; the pattern is the tell.
- `repeated-section-kickers`: registry entry (category slop, severity advisory); DOM implementation in `rules/checks.mjs` (`isRepeatedKickerCandidate` + `collectRepeatedSectionKickerCandidates`): heading h2/h3/h4, kicker = previous element sibling among p/span/div/small, text 2 to 34 chars, `step N` and bare digits excluded, uppercase transform or all-caps text, font-size at most 14px with tracked letter-spacing, threshold 3 per page.

## What shipped, and the adaptation decisions

**Aphoristic patterns went into `references/voice.md` `scan:patterns` as two WARN lines** (the item's preferred home; no script change needed for them). voice_scan compiles patterns with `re.I`, which would erase the sentence-casing signal both source regexes depend on, so each pattern wraps in Python's scoped `(?-i:...)` group: the file-level convention stays case-insensitive, these two lines opt out. Verified against nine fixtures including lowercase negative controls before editing.

**The page-wide threshold became doctrine instead of code.** Impeccable fires one finding at 3+ instances; voice_scan patterns WARN per instance and a human reviews each. Rather than add counting logic to the script for a WARN-level rule, the voice.md prose bullets carry the threshold: the scanner surfaces every instance, Phase 3 applies the three-per-page line when deciding rewrite versus accept-with-reason. Strictly more surface than the source rule, same judgment.

**The kicker rule went into `scripts/voice_scan.py` as `scan_html_kickers()`** because it is cross-element structure over raw HTML; no line regex over tag-stripped copy can see element adjacency (the item text anticipated exactly this). Fidelity kept: h2/h3/h4 headings, p/span/div/small kicker tags, 2-to-34-char labels, `step N` and bare-digit exclusions, threshold 3, WARN severity matching the source's advisory. Adapted honestly: a stdlib scanner has no computed styles, so the font-size/letter-spacing gates became source-level tells (all-caps text, `uppercase` utility class or inline transform, eyebrow/kicker class names); the function docstring names the limit and defers styled-but-mixed-case kickers to the design detect gate. One bug caught pre-test in the sibling regex: a lazy body group could backtrack across a long paragraph and swallow the true kicker; the body group now refuses to cross block-element boundaries or its own closing tag.

## Micro-dogfood (all six behaviors from the shipped text)

```
rules: /Users/taylor/projects/page-foundry/skills/page-foundry/references/voice.md (103 banned, 8 judgment, 10 patterns)
WARN  loop/evidence/13f-absorbed-rules/fixture-aphorisms.md:3  AI language pattern (aphoristic contrast)  | Not a feature. A platform.
WARN  loop/evidence/13f-absorbed-rules/fixture-aphorisms.md:5  AI language pattern (aphoristic rebuttal)  | The gate reads the diff. No excuses.
WARN  loop/evidence/13f-absorbed-rules/fixture-aphorisms.md:7  AI language pattern (aphoristic rebuttal)  | It compiles the contract. Just facts.
WARN  loop/evidence/13f-absorbed-rules/fixture-kickers-3.html:4  repeated section kickers ('How it works' before h2, 3 on page)  | The pipeline
WARN  loop/evidence/13f-absorbed-rules/fixture-kickers-3.html:7  repeated section kickers ('FEATURES' before h2, 3 on page)  | What ships
WARN  loop/evidence/13f-absorbed-rules/fixture-kickers-3.html:10  repeated section kickers ('Pricing' before h3, 3 on page)  | Plans
PASS  loop/evidence/13f-absorbed-rules/fixture-kickers-negative.html

Clean. Voice gate passed (review any WARN lines by hand).
EXIT=0
```

Positive: both aphoristic shapes fire with names and line numbers; three kicker forms fire (eyebrow class with mixed-case text, literal ALL-CAPS, uppercase utility class) each naming its label, heading tag, and page count. Negative: lowercase aphorism shapes stay silent (case sensitivity survived `re.I`); two kickers stay under threshold; `STEP 1` and `07` are excluded; the long paragraph before the FEATURES label did not merge into it.

## Shipped-file delta from the new rules

Swept README.md, SECURITY.md, docs/, and the whole skill tree. Zero hits in shipped page copy (docs/) and zero kicker hits anywhere. Three `aphoristic rebuttal` WARNs surfaced in reference doctrine prose (archetypes.md lines 85 and 101, ship-gates.md line 18), each a real sentence-then-`No ...` construction, 1 to 2 per file, below the three-per-page line the rule itself draws. Left standing under the WARN-by-design pattern policy REVIEW-1 and REVIEW-2 applied to doctrine prose; rewriting doctrine to dodge the new WARN would be gaming the gate. voice.md self-scan FAIL count unchanged from baseline (113, all structural: the banned-word list is its own trigger corpus); TESTS.md 0 FAIL.

## Mechanical state

`bash loop/verify.sh` VERIFY GREEN after the change (scanner self-tests, pattern detection, README+SKILL clean, installer lifecycle, overlay preservation, pack leak, forbidden files). Pattern count moved 8 to 10.

OWNER-REVIEW (also in the report draft): the owner's local voice overlay (`taylor-voice.md`) replaces `references/voice.md` wholesale, so his installed copy will not carry the two new pattern lines until the overlay file itself gains them; the kicker check ships in the script and applies regardless. Suggested morning action: append the two `scan:patterns` lines from this commit to `taylor-voice.md`.
