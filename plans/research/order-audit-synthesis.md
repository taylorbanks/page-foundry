# page-foundry v3 — merged audit findings (12, ranked by impact on final page quality)

**Verdict on the contested settled decision:** copy-before-design survives. Both reports that examined the order affirm it (studio-benchmark: "textbook content-first... correct"; order-redteam (b): buyer-side skeleton before aesthetics is the right dependency direction). The red-team attack is fatal only to the *snapshot placement* — freezing before any form exists — not to the order. Finding 1 reflects that judgment. MECLABS arbiter: unchallenged by all three.

---

**1. RETHINK — Copy snapshot frozen before any visual form exists; re-trigger economics push Phase 4 to pick whichever shape the frozen prose already is, silently collapsing the shape lexicon (v3's anti-template centerpiece) and locking hero wording visual-blind (explore mode inherits the bias).**
Reports: order-redteam (a)+(f)+(g) and studio-benchmark (§2, gap 3) — agree on mechanism and fix shape.
Fix: hoist per-job shape selection into the Phase 2 spec (compiler recommends, sign-off confirms; Phase 4 override = recorded decision entering the re-trigger loop knowingly); insert one bounded fit pass between Phases 4 and 5 (hero-finalist pick against the mockup, shape-fit confirm, length trims → one planned voice-chain re-entry), *then* write `copy-approved.md`. Gate 2's verbatim diff works unchanged. SKILL.md Phases 2–5, `archetypes.md` compiler.

**2. RETHINK — First complete visual is the ship candidate: no comp iteration rounds, no authority above defect-floors, so "competent but dead" passes every gate.**
Reports: studio-benchmark (gaps 1+4) primary; capability-underuse (#8, `critique`→`polish` unwired) supplies the mechanism; order-redteam concurs studios have a comp stage but requires loops be designed and bounded — so fixed rounds, not iterate-to-taste.
Fix: Phase 4.5 comp stage — render full page, critique against the direction's own scene sentence and named anchors ("does this belong in their league?"), max 2 rounds, bounce-to-Phase-4 authority; wire impeccable's critique snapshot as `polish`'s backlog in the Gate 5 fix loop (that wiring alone is LOOP-NOW separable).

**3. V3.1 — Imagery has no producer: no art direction, sourcing, or treatment plan, and Gate 6 demands an OG image and favicon no phase makes; honest pages default to text-and-CSS walls, the strongest remaining AI tell.**
Reports: studio-benchmark (gap 2) + capability-underuse (#5) — independently converge on the same fix.
Fix: add marketingskills `image` as a pinned enhancer; Phase 4 gains an imagery-plan section (style, source, per-slot treatment); Phase 5 deliverables include OG image + favicon (that deliverable line is LOOP-NOW separable).

**4. V3.1 — All rendering evidence is one engine at two widths, no form is ever actually submitted, and nothing verifies the deployed page: Safari/iOS breakage, 700–1100px shear, and silently dead forms pass all eight gates.**
Reports: studio-benchmark only (gap 5 + dead-deploy); no conflict.
Fix: extend Gates 3/5/7 in `ship-gates.md` — WebKit + Firefox screenshot set, 768/1024 widths, 320px reflow, one real submit with the event observed; add a post-deploy live check (the house Interceptor rule already mandates this and the skill never invokes it).

**5. LOOP-NOW — VOC quote integrity is mechanical but representativeness is unchecked: no theme clustering, frequency×intensity, confidence labels, or recency window, so one loud old quote can steer the hero.**
Reports: capability-underuse (#3) only; no conflict.
Fix: extend the `voc.md` template with customer-research's synthesis fields (theme, confidence, date); Phase 1 invocation names the ranked-theme deliverable before hierarchy/objection ordering.

**6. LOOP-NOW — Page title and meta description ship unvoiced and unsnapshotted while Gate 6 "checks meta" nothing demanded — the skill's own named retrofit-at-gate anti-pattern, on the page's first headline.**
Reports: capability-underuse (#1) only; no conflict.
Fix: Phase 3 step 2 requests copywriting's meta-content output, routes it through the full voice chain into `copy-approved.md`.

**7. LOOP-NOW — The advertised "my page isn't converting" entry path never diagnoses the current page: no cro live-page analysis and no analytics/heat/search pull before re-deriving message architecture.**
Reports: capability-underuse (#2) + studio-benchmark (gap 8) — agree; qualitative and quantitative halves of the same intake gap.
Fix: rewrite intake, before Phase 1 — invoke cro on the live URL and record a data pull (or an explicit "no data exists" line, mirroring foundry-log discipline) into the brief.

**8. LOOP-NOW — Spacing scale without a layout grid, breakpoints checked but never designed: composition reads placed, not arranged.**
Reports: studio-benchmark (gap 6) only; no conflict.
Fix: `design-direction.md` token plan requires a grid spec (containers, columns, gutters) plus a per-breakpoint recomposition note for the hero and densest section; Gate 5 verifies against it.

**9. LOOP-NOW — cro's `form.md` never invoked though four archetypes (newsletter-capture, waitlist, event-webinar, campaign-landing) are form-centric, where field friction is the dominant leak.**
Reports: capability-underuse (#4) only; no conflict.
Fix: Phase 2 step 3 archetype-conditional invocation (same pattern as pricing/aso); Gate 1 reads its output.

**10. V3.1 — Error/loading/success states, focus/hover personality, and page-level motion identity ship as browser defaults; Gate 3 checks presence, nobody designs behavior.**
Reports: studio-benchmark (gap 7) + capability-underuse (impeccable `animate` note) — agree.
Fix: states-and-motion section in the Phase 4 output; Gate 5 walks the error path; name impeccable `animate` at Phase 5 (its headless-render rule also protects Gate 2's verbatim diff from blank reveal-animations).

**11. LOOP-NOW — Core companions invoked at a fraction of catalog: pricing psychology never reaches pricing archetypes (even as fallback when the `pricing` enhancer is absent), Fogg/Hick never inform spec structure, copy-editing runs cut-only (So What and Specificity sweeps unnamed), and Switching Dynamics + anti-persona are produced but never consumed.**
Reports: capability-underuse (#6, #9, #10); no conflict.
Fix: name the capabilities in invocation text — Phase 1 objection map and Phase 3 red-team read consume brief §7–8; Phase 2 pricing sections invoke pricing-psych + structure levers; Phase 3 copy-editing invocation names the sweeps.

**12. LOOP-NOW — Two Phase-2 ordering inversions: site-architecture planned as a post-compiler adjunct though nav policy, pricing-shape fork, and split-vs-straddle are compiler inputs; PRODUCT.md delayed to Phase 4 past its last input, opening a double-interview window.**
Reports: order-redteam (d)+(c) only; no conflict. Time-sensitive — site-arch placement is still in `plans/v3.0.md`, cheapest to fix before it ships.
Fix: multi-page properties emit `site-context.md` before compilation (same input pattern as foundry-log); write PRODUCT.md at spec sign-off with Phase 4 demoted to a merge-never-clobber re-verify.

---

**Killed:**
- *Contradicts settled decisions:* nothing survived to contradict — "design/tokens should precede skeleton or copy" attacks were rejected by the reports themselves (RT (b), SB §2); MECLABS arbiter untouched.
- *Duplicates merged:* SB's scheduled-reconciliation → 1; CU's critique→polish → 2; SB's OG/favicon-checked-never-made → 3; CU's site-arch minor notes → 12.
- *Real but below the cap (indirect to this page's quality):* ab-testing hypothesis engine + cro `experiments.md` (CU #7 — feeds the *next* run; queue for V3.1), ceremony trims (`overdrive`, skeleton pre-read scoring, `live`-at-explore), font licensing, multi-stakeholder discovery.
- *Vague, no mechanism:* SB's "typography depth" and "motion as language" kept only where they named one (finding 10), dropped otherwise.