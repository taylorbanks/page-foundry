# REVIEW-3: WS3 audit (iters 19, 22, 23 against #15 and #16)

Fresh-context audit, 2026-07-18. Scope: commits since `v3-night-2`: `83d2d0b` (15a), `5626ce3` (15b), `27db0bc` (16), plus record commits and the operator's `7233a75`. Verdict: GREEN, zero reopens. Tagged `v3-night-3`.

## #15 acceptance, line by line

1. **Companion table entry, pinned pbakaus/impeccable, detection via skill paths plus npx, version from frontmatter.** Verified in the `83d2d0b` diff: enhancer-tier row, install command in the by-source list, integration-notes head names the two detection specifics (working `npx impeccable` counts as PRESENT; version read from SKILL.md frontmatter). `5626ce3` extends the row with `document` and `detect`, their OUTPUT artifacts, and the Gate 5 evidence-line contract.
2. **PRODUCT.md handoff without a double interview.** Verified: written from the brief before any impeccable command; Register `brand`, Platform `web`, CTA plus belief ladder plus proof into Conversion & proof, anti-references verbatim, unfillable fields left out; singleton merge-never-clobber (the owner decision, word for word in substance). Dogfood evidence is real: `15a-product-handoff/` holds the compiled `PRODUCT.md` and the verbatim `context.mjs` output showing exit 0, the file consumed as the context block, and routing to `reference/brand.md` on the Register value.
3. **Phase 4 wiring.** Verified in `5626ce3`: step 6 persists the property `DESIGN.md` via `/impeccable document` against the published eight-section spec with `version: alpha` pinned, accepts the six-section output, adds Layout/Shapes only with real content, never strips a richer file; `palette.mjs` OKLCH seed for strict-greenfield in step 2; token source priority now counts a prior run's `DESIGN.md`.
4. **Detect gate.** Verified: Gate 5 runs `detect.mjs --json` from the product repo root so config ignores and `DESIGN.md` enforcement apply; findings-are-floors is its own checklist line; acceptance is a `detector.ignoreValues` entry with a mandatory `reason` in the product's `.impeccable/config.json`, and a reasonless ignore is named a suppressed finding. Exit semantics match the evidence: verbatim `detect-output.json` shows the two true findings on our own docs page; the notes record the clean case as `[]` with exit 0 and findings with exit 2, and record the piped-exit-code near-miss that lesson 16 came from.
5. **Optional invocations.** Verified in `83d2d0b`: critique advisory with MECLABS as conversion arbiter, live in explore, overdrive rare, `clarify` kept off marketing copy, hooks off during runs with both toggle forms named. The 15b-to-15a ownership shift is recorded in the report draft.
6. **SECURITY.md boundary.** Verified: companion-side Node scripts, nothing bundled, review-before-install guidance consistent with the existing scanner paragraph.

## #16 acceptance, line by line

1. **Fifteen rules absorbed with provenance stamps.** Counted in the `27db0bc` diff: 15 stamped rules (spacing rhythm, focal point, squint test, type ramp, bolder reject-list, color strategy, tinted neutrals, three micro-bans, motion durations plus one earned scroll moment, scene sentence plus anchors, identity lock, real imagery, focus/hover completeness, content hardening, CLS/LCP mechanics), placed so nothing is stated twice (four extend existing Marketing-page bullets, one extends the anti-slop list, ten land in the new Craft rules section).
2. **Constants spot-checked before copying.** The evidence file holds raw grep blocks per rule. Independently re-verified in this audit against the clone at `8967edc` (frontmatter 3.9.1), eight constants sampled: 4pt scale values, 8 to 12px sibling and 48 to 96px section spacing, squint test with the 2-second criterion, clamp maximum at 2.5 times minimum, the `oklch(97% 0.01 60)` cream tell, 0.005 to 0.015 neutral chroma, the absolute side-stripe ban above 1px, and the 100/200/300/500 duration table with the 500ms stagger cap. All eight match the absorbed text.
3. **MECLABS-versus-Nielsen tension documented.** Head of the Craft rules section: conversion pages repeat CTAs and run long by design; contract and conversion rules set structure, MECLABS arbitrates, craft rules govern execution inside that structure.
4. **Squint-test boundary.** Ships as doctrine here; the Gate 5 checklist line stays with #18, which owns gate text ("squint test in render review" is in the #18 backlog item). Justification recorded in the report draft, same pattern as 15a's incremental companion row.
5. **Provenance correction.** `voice.md` now says impeccable 3.9.1 at `8967edc`; the edited line produces no scan finding.

## Mechanical checks

- `bash loop/verify.sh`: GREEN (all eleven checks, including pack leak and forbidden-files).
- `voice_scan.py` on the four changed prose files (`SKILL.md`, `design-direction.md`, `ship-gates.md`, `SECURITY.md`): exit 0, 0 FAIL, 5 WARN, every WARN on doctrine prose authored before WS3 (the foundry line, the 13b artifacts line, the 14a pattern-pass line, the motion-assets line, the 11g anti-template line). `voice.md` self-scan hits remain the rules file enumerating its own lists, unchanged by WS3.
- Working tree clean; both issues CLOSED with evidence comments whose claims match the diffs; #22 OPEN on milestone v3.0 ahead of 19b, as the ordering note requires; report draft carries the WS3 decisions and the OWNER-REVIEW items.
- `7233a75` touches operator-owned `loop/run.sh`: commit message and `escalation-1-resolved.md` record it as the operator's morning limit-detection patch (broadened phrasings, sub-90s fast-fail heuristic, 20-retry escalation cap, `STOP_AFTER` extended to 14:00 for the daytime run with the owner present). No verify gate weakened. Accepted as consistent with the incident record.

## Observations (not reopens)

1. **19a must name the WS3 regressions explicitly**: PRODUCT.md merge-never-clobber, detect findings as floors with reasonless-ignore-is-suppression, DESIGN.md six-versus-eight section acceptance, and craft-rule presence in `design-direction.md`. TESTS.md currently covers WS3 only via test 39 (13f), which is the agreed 19a boundary, but the sweep should not rediscover these from scratch.
2. **DOGFOOD-FULL should run detect from a product repo root**, not direct file arguments as the 15b micro-dogfood did, so the config-ignore and `DESIGN.md`-enforcement paths get exercised once for real before release.
3. The 15b dogfood findings on our own docs page stay open as #22; nothing in WS3 accepted them, which is the honest state.
