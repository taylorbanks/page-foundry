# REVIEW-1 · fresh-eyes audit of iterations 1-9 (#14, #11)

Scope: work commits 98b7bc3, 2f282bf, cc7d546, 5d54185, f3d22bd, e76a19e, f966ae8, 711fa66, 40f6283, audited against the acceptance text of issues #14 and #11, TESTS.md entries 19-28, and the fix_plan item descriptions. Fresh context; the auditor authored none of these commits. Claims were re-verified against the files, not taken from the issues' evidence comments.

## Verdict: GREEN. Tag v3-night-1.

## #14 acceptance, re-checked in the shipped files

- Post-pattern-pass edits re-trigger scan + humanizer: SKILL.md Phase 3 step 5, and the re-trigger sentence inside Gate 2 (ship-gates.md). Both present, both name the trigger (any later copy edit) and the consequence (Gate 2 has not run until the last edit precedes the last scan).
- copy-editing owns the cuts and returns a changelog: Phase 3 step 2; the gate report format carries a `Copy-editing` line. No separate only-cuts step remains in Phase 3.
- Ordering defect fixed: red-team read is step 3, upstream of the voice pass (step 4). The research defect (humanize, then cut, then red-team-fix reaching Gate 2 unscanned) cannot recur while step 5 stands.
- Meaning-preservation guardrail, doctrine intact in both SKILL.md and Gate 2: humanizer proposes and meaning arbitrates, one pass not iterate-to-zero-tells, accepted WARNs carry a recorded reason, a claim-changing rewrite is a defect wherever it came from.
- Verbatim-copy chain: Phase 3 step 6 writes `copy-approved.md`; Phase 5 build-mode bullet diffs every build path and routes build-introduced prose back through step 5; Gate 2 checkbox fails drift and names snapshot-edited-to-match as a defect; handoff rides the same diff via `01-copy.md`.
- TESTS 19-22 cover all four behaviors. Evidence fixture loop/evidence/14b-verbatim-diff/ catches the paraphrase, the dropped sentence, and the unscanned label; the clean build passes.

## #11 acceptance, re-checked in the shipped files

- "No archetype contains a numbered section sequence": re-run fresh this audit, `awk 'NR>=89' references/archetypes.md | grep -E '^[0-9]+\.'` returns nothing; the only numbered lists in the file are the schema definition, the shared constraints, and the compiler questions (doctrine, not sequences). No slot-position language in any body.
- Six blocks present in all eight archetypes. The ten shared ordering invariants each trace to a real rule in conversion-rules.md (rules 1, 4, 5, 8, 10, 11 spot-checked line against line).
- Compiler: five inputs including awareness state and decision weight; output defined as a filled contract, never a name; straddle merge (union of jobs, goal from the conversion archetype, strictest policy); nothing-fits hand-fill path; foundry-log moves axis defaults and the contract must name the line that moved them.
- Composition axes (4) and section-shape lexicon (3+ shapes per recurring job, counted: 5/5/4/4/4/4/4) present; Phase 2 step 2 generates 2-3 structurally distinct candidates with MECLABS pre-reads, pick at spec sign-off.
- Gate 1 anti-template check reads the log's `skeleton` lines over the last three runs; flag resolves by justification or re-derivation; N/A without a log. Walked in loop/evidence/11g-antitemplate-dogfood.md on a labeled synthetic fixture.
- Structural-divergence property: loop/evidence/11b-contract-derivation.md derives two disjoint legal skeletons from one contract and rejects an illegal order on named constraints; loop/evidence/11f-skeleton-dogfood.md derives three candidates from a real compile of this repo. TESTS 23-28 cover compiler, divergence, straddle, multi-skeleton, log-moves-defaults, anti-template.

## Mechanical state at audit time

- `bash loop/verify.sh` exit 0 (scanner self-tests, installer lifecycle, pack leak, forbidden-files).
- `voice_scan.py` on SKILL.md, TESTS.md, archetypes.md, ship-gates.md, conversion-rules.md: 0 FAIL. Remaining WARNs sit in doctrine prose and quoted fixtures, consistent with the WARN-by-design pattern policy.
- Issues #14 and #11 closed, each with a per-acceptance-line evidence comment citing shas.
- Report draft carries both promised autonomous decisions (11g window N=3; 11d newsletter hero-proof mandate).

## Observations recorded, not reopened

- TESTS.md entries 17 and 18 sit out of numeric order. Pre-exists the loop (present at kit commit 4d3588c); item 19a owns the clean renumber.
- saas-homepage carries two supplementary blocks beyond the schema's six (`Optional jobs`, the sales-led variant). Judged in-schema: both are additive job annotations of the kind the trailing Tone/Length notes already establish, and the six required blocks are intact. If the owner wants strict six-block bodies, fold them into the Jobs block in a later pass.
