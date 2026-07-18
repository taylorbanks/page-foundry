# REVIEW-2 · fresh-eyes audit of iterations 11 to 15 (#13)

Scope: work commits 02201d6, 081f952, 531dd3f, a3dbf69, 0d8b42d, audited against the acceptance text of issue #13 (body plus both decision comments), TESTS.md entries 29 to 38, and the fix_plan item descriptions. Fresh context; the auditor authored none of these commits. Claims were re-verified against the files, not taken from the closure comment.

## Verdict: ONE REOPEN, no tag

Every deliverable in the issue body shipped and holds up in the files. One deliverable from the capability-ownership decision comment did not ship and had no backlog owner: the two scanner rules voice_scan was assigned to absorb from impeccable. Reopened as 13f; the v3-night-2 tag waits for REVIEW-2b after 13f closes. Nothing that shipped is defective; the reopen is an omission, not a regression.

## #13 body deliverables, re-checked in the shipped files

- I/O contract table: both tier tables carry INPUT, OUTPUT, CONSUMER, and EVIDENCE per row; every row names the file artifact it must leave and the gate-report line that proves it ran. The table intro states the doctrine that an invocation with no artifact and no evidence line did not happen; TESTS 32 enforces it.
- Run artifact directory: the layout block names the writer phase per entry; every phase opens with an Artifacts line naming its reads and writes; the deployables boundary is explicit (run state in `.agents/foundry/<product>/`, `pages/<product>/` holds only what ships, no file in both). The brief's exception (marketingskills convention path) is stated in the layout section and recorded as an autonomous decision in the report draft.
- Per-companion evidence lines: the gate report format carries the companion evidence block; the seven core lines always appear; enhancers get a line when their seam is in scope, with the skipped wordings specified.
- VOC provenance: Phase 1 publishes the Verbatim, Paraphrase, and Recurring-language schema with the source bar (a pointer the owner can open and check; a genre name does not qualify). Gate 2 quote tracing and Gate 8 fabricated-attribution are text searches. Walked mechanically in loop/evidence/13c-quote-trace: the verbatim quote passes, the paraphrase wearing quotation marks fails, the invented quote fails.
- Independent MECLABS audit: Gate 1 rewritten so the builder self-scores first and the score of record comes from a fresh agent given the rendered page and the brief alone, with both scores and the divergence recorded in `conversion-audit.md`, and an honest self-score fallback when no fresh context exists. Real divergence measured on the shipped homepage in loop/evidence/13d-independent-audit.md (self 28, cold 26, cause diagnosed to the incentive factor), with an honesty note that the author context had seen the old score.
- Multi-candidate generation: Phase 3 drafts 2 or 3 complete hero candidates differing by objection framing, recorded with scores in `copy/hero-candidates.md`; Phase 4 produces 2 or 3 token plans whenever frontend-design is the token source, in every mode; TESTS 35 covers both.
- Timing fixes: the answer block and the measurement plan are Phase 2 spec entries, and Gates 6 and 7 verify what the spec placed, with retrofit named a defect at both gates. customer-research starts `voc.md` at intake and the interview drops what the file answers (TESTS 37). competitor-profiling owns the Phase 0/1 competitive frame; competitors stays on comparison sections. pricing drafts `/pricing.md` at Phase 2 on the public-pricing archetypes, the build ships it, Gate 6 checks it (TESTS 38). Walked in loop/evidence/13e-spec-entries.md on a real product and a labeled fixture.

## Decision comments, re-checked

- Two-tier policy: the core list matches the decision comment exactly (product-marketing, customer-research, marketing-psychology, cro, copywriting, frontend-design, humanizer). Core missing stops the run; the only path forward is the explicit in-chat per-run override, marked PARTIAL in the gate-report banner and the foundry-log `degraded` field; enhancer decline proceeds degraded; the stop stays non-suppressible by any interactivity phrase. The 13a micro-dogfood reproduced all five behaviors from the text alone, each citing its governing line.
- Ownership dedup, table side: theme-factory left the companion table and the token-persistence text; the one remaining mention is the design-direction provenance stamp, a historical record the closure comment names as the intended remainder.
- Ownership dedup, scanner side: NOT SHIPPED. The decision comment assigns voice_scan the mechanical text scan, "absorbing impeccable's aphoristic-cadence + repeated-section-kicker rules", and places the dedup inside this workstream's table redesign. Neither rule exists in `references/voice.md` scan:patterns (8 patterns, none matching; a grep for aphoristic or kicker across skills/ returns only the plan file), and no fix_plan item owned the work: 13a shipped the table and the tier policy, and WS3 item 16 covers design-direction craft rules, not scanner rules. Reopened as 13f at the top of the backlog; #13 reopened with the audit comment.

## Mechanical state at audit time

- `bash loop/verify.sh` exit 0 (scanner self-tests, installer lifecycle, overlay preservation, pack leak, forbidden files).
- voice_scan on every md and html file changed since v3-night-1: 0 FAIL across the skill files and the evidence files. The FAILs the scan reports sit in loop/fix_plan.md (dash characters authored in the operator's kit seeding) and loop/lessons.md line 5 (a banned word quoted inside the lesson that records the rule against it). Both are loop bookkeeping, not shipped copy, and REVIEW-1's scan scope treated them the same way; the loop's own additions to those files stay clean.
- Remaining WARNs in SKILL.md and TESTS.md are doctrine prose and test fixtures, consistent with the WARN-by-design pattern policy; none introduced by WS2 change the claim of the sentence they sit in.
- Issue state: #13 was closed with a per-deliverable evidence comment whose claims this audit re-verified; it is reopened by this audit for the scanner-rule gap. #11 and #14 remain closed.
- Report draft carries the five WS2 autonomous decisions (outdated-core reading, README truth split, brief location, token-plan scoping, score-of-record doctrine plus its fallback).

## Observations recorded, not reopened

- The root README still calls every companion optional and credits theme-factory in Built on. Already a recorded 13a decision deferring repo marketing to the 19b docs truth pass; noted here so 19b cannot miss either line.
- The enhancer table's remotion row keeps the `[TK: motion asset]` marker convention from Phase 5. It is a documented placeholder the skill itself manages, not an unresolved stub in this repo.
