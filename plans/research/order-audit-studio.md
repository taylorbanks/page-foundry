# Audit: page-foundry v3.0 vs elite studio practice

Sources read in full: `/Users/taylor/projects/page-foundry/skills/page-foundry/SKILL.md`, `/Users/taylor/projects/page-foundry/plans/orchestration-walkthrough.md`, plus `references/ship-gates.md`, `references/design-direction.md`, and structural scans of `references/archetypes.md` and `references/handoff.md` (so no gap claimed below is secretly covered in a reference file).

---

## 1. Stage-by-stage mapping, and the skipped load-bearing stages

| Studio stage ($10K+ engagement) | page-foundry | Verdict |
|---|---|---|
| Discovery (stakeholder interviews, audience research, competitive audit, analytics review) | Phase 0: product-marketing + customer-research + competitor-profiling + interview | Strong on qualitative; **missing quantitative discovery** and stakeholder plurality |
| Strategy / messaging | Phase 1: message-architecture, persuasion-map, VOC | Equal or better than studio norm; verbatim-with-source discipline exceeds it |
| IA / content strategy | Phase 2 contract compiler + skeletons | Present, single-page scope by design |
| Wireframes, validated visually before content is final | Phase 2 spec (text only); gstack `/plan-design-review` optional enhancer | **Skipped as a first-class stage** — structure is validated as prose, not spatially |
| Content-first copywriting | Phase 3 | Present, unusually rigorous |
| Art direction: moodboards/stylescapes, aligned with client before any page design | Phase 4 token plans + scene sentence + named anchors | Present but **thin**: a palette + type pairing + one signature element is a fraction of a stylescape (no imagery language, texture, component samples), and in a suppressed-pause build run the pick can happen without the owner |
| Design comps, 2–3 iteration rounds against a rendered artifact | **Nothing.** Phase 4 jumps from tokens + shape picks straight to Phase 5 code | **Skipped, and it is the most load-bearing stage in the whole studio process** |
| Photography / illustration art direction, imagery sourcing or commissioning | **Nothing.** Anti-slop rules say "real screenshots, real photography only" but no phase produces or plans imagery | **Skipped** |
| Content-design iteration loop (copy refit after first comps) | Phase 3 step 5 re-trigger exists but fires only reactively, on drift or gate failures | **Skipped as a scheduled pass** |
| Build with designer-in-the-loop QA rounds | Phase 5; Gate 5 render review afterward | Compressed; Gate 5 is defect-catching, not design review rounds |
| QA (cross-browser, real device, forms end-to-end, zoom/reflow) | Gates 2–7 | See section 4 — materially narrower than studio QA |
| Launch + post-launch monitoring window | foundry-log + conversion-data field | Memory is excellent; **no launch-verification or monitoring phase exists** (the gates end at the built artifact, not the deployed page) |

Additional skipped items studios treat as load-bearing: OG image and favicon **creation** (Gate 6 checks their presence; no phase makes them — a gate that verifies an artifact nothing produces), font licensing verification before self-hosting, and multi-stakeholder discovery (Phase 0 interviews one voice; studios triangulate founder, sales, and support because founders misreport their own buyers).

## 2. Order differences: defect or improvement

**Copy before design (Phases 3 → 4) — improvement, with one defect attached.** This is textbook content-first design and for conversion pages it is correct: the page is an argument, the argument is words, and designing lorem-ipsum boxes then pouring copy in is how studios produce pretty pages that say nothing. page-foundry's order (message → structure → copy → form) is the order GOV.UK and every strong CRO shop converged on, and freezing `copy-approved.md` with a verbatim diff at the gate solves the real failure (builders paraphrasing silently) that studios solve with proofreading rounds. **The defect is the hardness of the freeze, not the order.** Copy is finalized before any form exists: headline behavior at 64px display size, line lengths against the measure, whether the proof copy fits the proof *shape* Phase 4 later picks (a logo bar wants different words than a featured case quote) — none of this existed when the copy was approved. The re-trigger machinery (Phase 3 step 5) can absorb design-driven copy edits, but nothing in the pipeline ever *schedules* one; the flow treats post-approval copy edits purely as exceptions. Elite content-first practice is "content leads," not "content is immutable before form exists."

**Shape picks after copy (Phase 4 step 3) — a genuine ordering wrinkle.** Phase 2 fixes jobs and order, Phase 3 writes copy against them, Phase 4 then picks each job's form. A shape decision can invalidate copy assumptions with no forward edge back to Phase 3 except accidental drift-catching at Gate 2.

**Spec sign-off before copy — matches studio wireframe sign-off. Correct.**

**Measurement, answer block, and schema decided at spec time (Phase 2) — improvement over studio norm**, where analytics is bolted on at launch. The "a gate can only verify what a spec demanded" doctrine is better process discipline than most agencies practice.

**Independent cold-context MECLABS scoring at Gate 1 — improvement.** Studios rarely formalize "the author's score is not the score of record."

**Art direction late (Phase 4) — mostly fine for an agent, defensible.** Studios front-load aesthetic alignment because a client rejecting the direction after comps burns weeks; an agent regenerating token plans burns minutes. The cost asymmetry that forces studio order does not exist here. The residual risk is alignment, not schedule: the owner's one interaction with aesthetics is picking among 2–3 token plans, which is a weaker alignment instrument than a moodboard conversation.

## 3. What studios do to reach "beautiful" that no phase owns

1. **The comp iteration loop.** Beauty in studios is not produced by rules; it is produced by rounds — a creative lead looking at a full rendered comp and saying "the hero is dead, the rhythm collapses at section 3, try it again." page-foundry has floors everywhere (anti-slop list, 46 detector rules, craft constants) and a ceiling nowhere. Its own doctrine admits this: "a clean scan is a floor, never a verdict." No phase owns the loop that climbs from floor toward ceiling.
2. **Imagery strategy.** Photography direction, shot lists, illustration commissioning, icon system design, image treatment recipes (crop, grain, duotone, consistency rules). The integrity rules correctly ban fake imagery, but the constructive half — plan and produce real imagery — has no owner, so the default output is a text-and-CSS page with `[TK: image]` slots. Handoff mode specifies image-slot *geometry*, which is logistics, not art direction.
3. **A grid system.** The 4pt spacing scale exists; a layout grid (columns, gutters, container widths, baseline rhythm) does not. Studios compose on a grid; it is the difference between arranged and placed.
4. **Responsive art direction.** Gates check 390 and 1440. Studios *design* the recomposition: how the hero re-stacks at 768, art-directed image crops per breakpoint (`<picture>`), what drops at phone width. Breakpoints-where-the-design-breaks is stated as a craft rule but no phase produces the per-breakpoint design decisions.
5. **Typography depth.** "Display plus body pairing" is one line. Studios do licensing clearance (self-hosting a commercial face without a webfont license is a legal defect no gate catches), optical sizes, OpenType feature settings, tabular numerals for pricing tables, full hierarchy specimens.
6. **Motion as a language.** Duration tables and per-slot Remotion clips exist; a motion *identity* for the property (what moves, the easing personality, the one signature interaction) has no owner.
7. **State design.** Form validation, error, loading, and success states; hover/focus personality beyond compliance. Gate 3 checks the mechanics exist; nobody designs them, so they ship as browser defaults.
8. **The social surface.** OG image (often the single most-viewed designed artifact of a page) and favicon: checked at Gate 6, designed nowhere.

## 4. The 8 ship gates vs studio QA: what a studio rejects that these gates pass

The gates are stronger than studio QA on: message integrity (verbatim quote tracing to sourced VOC), voice consistency, fabrication, AI discovery, and measurement-as-spec. A studio would ship pages these gates bounce. But the reverse list is long:

- **A page that only works in Chrome.** All rendering evidence comes from one engine. No Safari (i.e., no iOS, where most B2C traffic lands), no Firefox. Studios run a browser/device matrix on real devices; Safari flex/gap/backdrop-filter bugs are exactly what headless Chrome cannot see.
- **A page broken between 391 and 1439px.** Two widths are screenshotted. The 700–1100px band — tablets, split-screen, half-maximized laptops — is where generated layouts most often shear, and no gate looks there.
- **A form nobody ever submitted.** Gate 7 verifies the event is *wired*; studio QA submits every form, walks the error path, and watches the event arrive in the analytics tool. A silently failing endpoint passes all eight gates.
- **Reflow and zoom failures.** WCAG 2.2 AA is spot-checked structurally, but 1.4.10 reflow (320px / 400% zoom) and text-resize are absent, and there is no screen-reader smoke pass (VoiceOver through the hero and form). Studio a11y QA does both.
- **"Competent but dead."** Gate 5's bar is "fix anything a cold viewer would flag in five seconds" plus a detector that, by its own doctrine, only proves no known tell fired. A creative director rejects pages that pass every mechanical check and still have no life — flat rhythm, timid hierarchy, no tension. No gate holds that authority.
- **Content edge cases.** The harden rules (long/short headline extremes, 30–40% expansion headroom) live in design-direction.md as build guidance; no gate verifies them.
- **Untested interactive states.** Hover on touch, focus traps, error-state layout shift — Gate 3 checks presence, not behavior under use.
- **A dead deploy.** Gates run against the built artifact; nothing verifies the page live at its URL (canonical resolving, OG validator, TLS, analytics firing in production). Studios run a launch checklist and a post-launch watch window. (House rules in this environment even mandate Interceptor verification for anything claimed live; the skill never invokes the idea.)

## Top 8 gaps, ranked by impact on final page quality

1. **No design-comp iteration loop between tokens and shipped page.** The stage where studios manufacture "beautiful" — full-page comp, structured critique, revise, 2–3 rounds — does not exist; the first complete visual is the ship candidate and Gate 5 only catches defects. Fix: insert a Phase 4.5 (or make the Phase 5 first build explicitly a comp): render full page, critique against the direction's own scene sentence and named anchors, revise, minimum two rounds before gates.
2. **Imagery has no owner.** No art direction, sourcing/creation plan, shot list, treatment recipe, icon system — and Gate 6 demands an OG image and favicon that no phase produces. Honest pages default to imageless text walls, the strongest remaining AI tell. Fix: Phase 4 gains an imagery plan section (style, source, per-slot treatment) and Phase 5 must produce the OG image and favicon as deliverables.
3. **No scheduled copy-design reconciliation.** Copy freezes before form exists; the re-trigger only fires on drift. Headlines untested at display size, copy written for shapes not yet chosen. Fix: a mandatory copy-fit pass after first render (wrap, measure, proof-shape match), routed through Phase 3 step 5 as a planned step, not an exception.
4. **Gate 5 has floors but no ceiling.** Nothing plays creative director; "competent but dead" ships. Fix: an adversarial design review with bounce-to-Phase-4 authority, scored against the property's named anchors ("does this belong in their league?"), not against defect lists.
5. **Single-engine, two-width verification; no end-to-end form test.** Safari/iOS, Firefox, the 700–1100px band, 320px reflow, and an actual observed form submission are all absent. Fix: extend Gates 3/5/7 with an iOS-Safari + Firefox screenshot set, 768 and 1024 widths, reflow check, and one real submit with the event observed.
6. **No grid system and no responsive art direction.** Spacing scale without a layout grid; breakpoints checked, never designed. Fix: token plan must include a grid spec (containers, columns, gutters) and a per-breakpoint recomposition note for the hero and densest section.
7. **Interactive and motion states undesigned.** Error/loading/success states, focus/hover personality, and a property-level motion language ship as defaults. Fix: a states-and-motion section in the Phase 4 output; Gate 5 walks the error path.
8. **No quantitative discovery for existing pages.** Rewrites enter at Phase 1 on qualitative material alone; studios start redesigns from analytics, heatmaps, and search data. The foundry-log closes this loop only for its own prior runs. Fix: Phase 0 on an existing property requires a data pull (traffic, top sources, current conversion, scroll/heat if available) recorded in the brief, or an explicit "no data exists" line — the same discipline the log already enforces for repeat runs.

Overall judgment: phases -1 through 3 meet or beat elite studio practice (research provenance, message discipline, and copy integrity are genuinely ahead of it); the pipeline's studio-grade weakness is concentrated in Phase 4 through Gate 5, where it substitutes rule-floors and one token pick for the comp-iteration, imagery, and creative-authority stages that are where studios actually earn the fee.