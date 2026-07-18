# 19a evidence: TESTS.md full sweep + renumber

Item: regression entries for every v3 behavior; renumber cleanly. Date: 2026-07-18.

## Renumber

Before: numbers 1 to 64 all present and unique, but entries 17 and 18 sat in swapped physical order (file read 16, 18, 17), and nine blank separator lines split the list between entries 39 and 47 and before 56. After: entries sorted numerically, single-spaced, labels unchanged. Labels were preserved deliberately: `fix_plan.md`, evidence files, and test 37's cross-reference to test 44 all cite numbers, and a relabel would have broken them for zero gain. Diff shape confirms mechanics: 10 deletions (9 blanks plus the moved entry 17), 4 insertions (entry 17 re-placed plus three new entries).

## Coverage: the eight named behaviors

| Behavior named in 19a | Tests |
|---|---|
| contract compiler | 23 (filled contract, not a name), 24 (structure varies per entry state), 25 (straddle merge), 26 (skeleton candidates), 27 (log moves defaults), 54 (shapes in Phase 2) |
| required-core preflight | 11 (stop is non-suppressible), 12 (autonomy not inferred), 29 (core override marks PARTIAL; enhancer degrades bannerless) |
| artifact directory | 30 (phases hand work through files), 31 (v2.x adoption, once and losslessly) |
| evidence lines | 32 (no artifact means no invocation), 17 (degraded marked and named) |
| verbatim diff | 22 (build-mode snapshot diff), 46 (head entries diffed at Gate 6) |
| detect gate | **65 (new)** |
| handoff manifest | **66 (new)** |
| projection | **67 (new)** |

## Provenance for the three new entries

Each clause in 65 to 67 restates shipped text; nothing is invented.

- Test 65: `references/ship-gates.md` lines 58 to 59 (detect invocation from repo root, empty-array-exit-0 semantics, fix-or-accept with `reason`, floors doctrine applied to the scan), `SKILL.md` lines 183 to 184 (document-and-detect one-loop doctrine, accepted findings in `.impeccable/config.json` under `detector.ignoreValues`), `SKILL.md` line 292 (Phase 4 step 6: published spec, eight sections, `version: alpha`, add `## Layout`, never strip; `palette.mjs` greenfield seed), `SKILL.md` line 181 (singleton merge-never-clobber).
- Test 66: `references/handoff.md` lines 9 to 56 (package tree, files ship even when near-empty, five non-negotiables and license grant verbatim, questions not guesses), lines 58 to 75 (`01` source and geometry lines, labeled head entries), line 92 (fixed criteria template, N/A with reason, append under owning gate, prefix maps to gate), line 96 (`05` excerpt as configured at run time), lines 98 to 118 (return spec, return log by ID, fixed revision shape, full re-attach), lines 237 to 242 (pre-delivery package gates).
- Test 67: `references/handoff.md` lines 129 to 151 (deterministic compilation, every line traces, eight sections, `version: alpha`, regenerate never hand-edit, two files named `DESIGN.md` never merge, propose-then-lock frontmatter carries `name` and `version` only, lint semantics: `broken-ref` blocks, two expected warnings, unlinted ship recorded), lines 225 to 233 (per-tool packaging, single-prompt seam cost stated before choosing).

## Sweep beyond the eight

Walked every v3 fix_plan item against the file: WS1 covered by 23 to 28, 40 to 43, 54; WS2 by 29 to 39, 44 to 53, 55 to 63 plus 17 and 22; WS3 by 51 (PRODUCT.md), 52 (critique feeds polish), 64 (doctrine and gate teeth), and now 65; WS4 by 46, 53, 55, 56, 64 (criteria prefix map) and now 66 and 67; WS5 by 64; WS6 by 31. The 16-craft-rules item is reference prose whose enforceable surface (grid spec, focus and hover teeth, CLS and LCP mechanics, squint test) tests 48 and 64 already bind. Verdict: no v3 behavior without an owner in TESTS.md.

## Scan

`voice_scan.py` on TESTS.md: 0 FAIL, 4 WARN, exit 0. All four WARNs predate this item and sit on entries 11, 15, 18, and 31; entries 15 and 18 quote the patterns they test for (fixture text), 11 and 31 are shipped prose from earlier iterations. Zero WARNs on the three new entries.
