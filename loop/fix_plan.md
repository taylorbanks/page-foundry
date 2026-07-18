# pf-v3-overnight backlog

One item per iteration, top-most unchecked first. Items are sized to finish inside one iteration; split further in place if needed (complete the first slice). Mark `[x] (sha)` or `BLOCKED(reason, attempt N/3)`. REVIEW items audit; they do not author.

## P0 — v2.x defects (small, independent; ship first)

- [x] (98b7bc3) 14a (#14): Phase 3 ordering fix in SKILL.md — any edit after the pattern pass (cuts, red-team fixes) re-triggers scan + humanizer; copy-editing outputs a changelog; collapse the redundant only-cuts pass into copy-editing. Add the humanizer meaning-preservation guardrail from the issue comment (proposes/arbitrates, one pass, accepted-WARN-with-reason, claim-changing rewrite = defect). TESTS.md entry.
- [ ] 14b (#14): Build-mode verbatim-copy protection — SKILL.md Phase 5 + Gate 2: snapshot approved copy at end of Phase 3 (artifact file), diff rendered text after any builder, drift fails Gate 2. TESTS.md entry. Close #14 with evidence.

## WS1 — conversion contracts (#11)

- [ ] 11a: archetypes.md head rewrite — replace "archetype fixes section order" doctrine with the six-block contract schema (Goal / Buyer entry states / Jobs / Proof requirements / CTA policy / Ordering constraints) + the ~10 ordering invariants extracted verbatim from conversion-rules; shared rules updated so rule 4 and rule 11 now WIN. Phase 2 text in SKILL.md updated to compile-a-contract language.
- [ ] 11b: Convert oss-project, saas-homepage, campaign-landing to contracts (every load-bearing rule from plans/research/pf-archetypes.md §1 survives as constraint or job; slot numbers die; awareness-state notes added).
- [ ] 11c: Convert mobile-app, course-sales, membership-community to contracts (same standard).
- [ ] 11d: Convert newsletter-capture, personal-home to contracts; promote the thank-you page requirement into a shared cross-archetype reference stub (full contract comes in 12a).
- [ ] 11e: Mapper → contract compiler — +awareness state +price/decision weight inputs; output is a filled contract; straddle = merge (union of jobs, conversion owner sets goal, strictest policy); nothing-fits = hand-filled contract; reads foundry-log to adjust axis defaults. Micro-dogfood: compile a contract for a sample brief (a dev-tool + a course) and commit both outputs to loop/evidence/.
- [ ] 11f: Composition axes (narrative shape / hero form / proof strategy / density) + section-shape lexicon (3+ shapes per job) as a new reference section; Phase 2 multi-skeleton generation (2–3 constraint-satisfying candidates, MECLABS pre-read, pick at spec sign-off).
- [ ] 11g: Anti-template check — foundry-log gains skeleton line (job order + axes); Gate 1 check comparing to the property's last N pages; converged-without-data flagged. TESTS.md entries for 11a–g. Close #11 with evidence.
- [ ] REVIEW-1: fresh audit of everything since start vs #14/#11 acceptance + TESTS.md; reopen failures at top; tag v3-night-1 on green.

## WS2 — evidence-based orchestration (#13)

- [ ] 13a: Companion table → I/O contract table (INPUT / OUTPUT / CONSUMER / EVIDENCE columns) + two-tier policy per the decision comment: core tier REQUIRED (product-marketing, customer-research, marketing-psychology, cro, copywriting, frontend-design, humanizer; preflight stops until installed; explicit per-run override only, output loudly marked partial); enhancer tier degrades. theme-factory removed from the table (dedup decision).
- [ ] 13b: Run artifact directory `.agents/foundry/<product>/` (voc.md, persuasion-map.md, message-architecture.md, page-spec.md, conversion-audit.md, tokens/, copy/) wired through every phase: each phase names what it reads and writes. Phase 0 adopts v2.x artifacts (old .agents/product-marketing.md, foundry-log) — this is #19's migration piece, do it here.
- [ ] 13c: Gate-report evidence lines per companion (humanizer-style) + VOC provenance schema (every quote carries a source; Gate 2 tracing + Gate 8 become mechanical checks against voc.md).
- [ ] 13d: Independent MECLABS audit (Gate 1 scored by a fresh subagent given only rendered page + brief; divergence recorded) + multi-candidate generation (hero candidates by objection framing; frontend-design always 2–3 token plans; selection reasons logged to artifacts).
- [ ] 13e: Timing fixes — ai-seo answer-block + analytics conversion event into Phase 2 spec; customer-research during intake; competitor-profiling into Phase 0/1 (competitors stays archetype-side); pricing output generates /pricing.md. Close #13 with evidence. TESTS entries 13a–e.
- [ ] REVIEW-2: audit WS2 vs #13 acceptance; tag v3-night-2 on green.

## WS3 — impeccable (#15, #16)

- [ ] 15a: impeccable companion entry (pinned pbakaus/impeccable, detection paths + npx, version from frontmatter, enhancer tier) + PRODUCT.md handoff (write from our brief BEFORE any impeccable command; register brand, platform web, CTA/belief-ladder/proof → Conversion & proof; anti-references verbatim; singleton policy merge-never-clobber) + hooks-off-during-runs note + SECURITY.md boundary paragraph.
- [ ] 15b: Phase 4 wiring — /impeccable document persists property DESIGN.md (published 8-section spec profile), palette.mjs greenfield seed; design detect gate: detect.mjs --json over built HTML/CSS at Gate 5, findings-are-floors doctrine, per-property accepted-findings file. Micro-dogfood: run the local clone's detect.mjs against docs/index.html, commit output as evidence. Close #15.
- [ ] 16 (#16): Absorb the 15 craft rules into design-direction.md with provenance stamps — spot-check each constant against the impeccable reference files in the local clone first (critique.md flag); record the MECLABS-over-Nielsen tension note. Close #16 with evidence.
- [ ] REVIEW-3: audit WS3; tag v3-night-3 on green.

## WS4 — handoff 3.0 (#17)

- [ ] 17a: handoff.md rewrite — manifest 00–06 (+assets/manifest geometry), five non-negotiables + explicit creative-license grant in 00, fabrication ban verbatim, 01 image slots with dimensions/aspect ratios, 04 from a FIXED criteria template with criterion-ID↔gate-ID map incl. Gates 6+7, 05 voice-rules excerpt, 06 return-spec + revision-request format.
- [ ] 17b: design.md projection — generation rules (deterministic compilation from 00–05, published 8-section spec, version alpha pinned, never hand-edited, regenerate on change) + `npx @google/design.md lint` wiring when available + per-tool packaging table (attachments / single-prompt / repo). Close #17.
- [ ] REVIEW-4: audit WS4; tag v3-night-4 on green.

## WS1b + WS2c — new archetypes and catalog integration (#12, #21)

- [ ] 12a: Contracts for pricing-page, comparison-alternatives, thank-you-post-conversion (top-3; thank-you referenced by all archetypes).
- [ ] 12b: Contracts for docs-dev-tool-landing, waitlist-coming-soon, event-webinar (Event schema note).
- [ ] 12c: Contracts for agency-services, ecommerce-product, changelog-launch-post; 404 note in shared rules; portfolio = personal-home axis note. Close #12.
- [ ] 21a (#21): site-architecture (Phase 2 adjunct + scope-escalation seam), competitor-profiling (already in 13e — verify + cross-reference), seo-audit (Gate 6), ab-testing (post-ship loop) — real I/O contracts in the table + phase bodies.
- [ ] 21b (#21): image + canvas-design (asset ownership split), webapp-testing (Gates 3/5 executor), gstack diagram (how-it-works), motion stack rewrite (remotion-best-practices + create + render + captions; hyperframes flagged evaluate-before-trust), react-view-transitions conditional, deploy-to-vercel opt-in; distribution seam section (launch orchestrates social/pr/ad-creative/emails/directory-submissions consuming run artifacts, opt-in post-ship). Close #21.

## WS5 + WS6 — gates, docs, dogfood, release (#18, #19)

- [ ] 18 (#18): Gate upgrades consolidation — squint test in render review, focus/hover + CLS/LCP teeth in Gates 3/4, floors-not-verdicts doctrine line, final gate-report format (evidence lines + humanizer + degraded + skeleton + design-detect). Close #18.
- [ ] 19a (#19): TESTS.md full sweep — regression entries for every v3 behavior (contract compiler, required-core preflight, artifact directory, evidence lines, verbatim diff, detect gate, handoff manifest, projection). Renumber cleanly.
- [ ] 19b (#19): Docs truth pass — README, skill README, CHANGELOG v3.0.0 entry, orientation text, llms.txt; no claims for anything not merged; plans/v3.0.md status flipped to shipped-pending-release. Close #19 (migration shipped in 13b — note it).
- [ ] DOGFOOD-FULL: run the v3 skill end to end in build mode on a real brief (suggest: a page for the Interceptor OSS tool from its actual repo README, in loop/evidence/dogfood/) — contract compile, artifacts, copy, build, ALL gates incl. detect + render at 390/1440 via Interceptor CLI with screenshots saved. The page must pass its own gates. Fix what fails; that is the point. Record the run's gate report + foundry-log in evidence.
- [ ] AUDIT: fresh-eyes audit — milestone vs plans/v3.0.md vs repo; every issue closed with evidence or reopened; TESTS.md spot-executed (pick 5 behavioral tests, walk them); verify.sh green; docs claims true. Reopen anything failing at top of backlog.
- [ ] REPORT: write plans/v3.0-overnight-report.md — everything done (by issue, with shas), every autonomous decision + justification, OWNER-REVIEW assumptions collected from the running draft, blocked/deferred items, and tomorrow's suggested test script for the owner. Commit + push.
- [ ] RELEASE-PREP: version 3.0.0 in package.json + CHANGELOG; rebuild .skill zip; global sync preserving voice overlay (verify owner line + pattern count after); run verify.sh; ONLY if green and AUDIT passed: write loop/RELEASE-READY (runner performs npm publish + tag + gh release deterministically); then write loop/DONE with the exact promise string per Standing Rule 6.
