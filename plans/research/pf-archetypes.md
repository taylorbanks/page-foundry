# page-foundry Archetype System Audit: Over-Constraint Report

Sources read in full: `skills/page-foundry/references/archetypes.md` (197 lines), `SKILL.md` Phase 2 (lines 144-152, plus mapper/orientation references), `references/conversion-rules.md` (70 lines).

**Framing finding first:** the system contradicts itself. Shared rule 4 (archetypes.md line 24) states the correct principle — "Sections appear in the order a skeptical reader raises objections, not the order the builder is proud of features" — but every archetype then hardcodes one objection order as a numbered list, and line 3 makes it binding: "The archetype fixes section order... Deviate only when the user asks." Phase 2 reinforces it: "If the page maps cleanly, follow that spec exactly." The objection order should come from the Phase 1 objection map (which the pipeline already produces per-buyer); instead the reference freezes a single hypothetical buyer's order into every page.

---

## 1. Current inventory

### oss-project (7 numbered sections)
Prescribed order: `1 Hero (install command IS the CTA) → 2 Proof strip → 3 Quickstart → 4 How it works / architecture → 5 Comparison → 6 Community and contribution → 7 Footer CTA`.
- **Load-bearing:** install command in a copy-button block for practitioner audiences; "cut the section entirely if proof is thin; an empty proof strip on an OSS page reads as desperation"; quickstart-longer-than-one-screen signals an onboarding problem; "concede real tradeoffs; conceded weaknesses buy credibility"; maintenance signals as primary trust factor; no marketing adjectives.
- **Arbitrary:** proof strip fixed at slot 2 (for OSS, quickstart-before-proof is often stronger — the code is the proof); comparison always before community; footer CTA as a mandated section rather than a CTA-repetition policy.

### saas-homepage (9 sections + optional + enterprise variant)
Prescribed: `1 Hero → 2 Social proof strip ("directly under the hero") → 3 Problem → 4 Solution/features (3-5 blocks) → 5 How it works ("three steps") → 6 Deep proof → 7 Pricing teaser → 8 Objections/FAQ → 9 Final CTA`.
- **Load-bearing:** outcome-first headline within budget; real product visual ("no abstract illustrations of people pointing at charts"); problem in the buyer's own words from Phase 1; hiding pricing generates objections; FAQ worked from the objection map; "one quote with a number outranks six adjectives." The optional-sections and enterprise-variant mechanism is the healthiest part of the file — it's already contract-thinking.
- **Arbitrary:** logo strip hard-pinned to slot 2; problem-before-solution mandated (wrong for solution-aware or product-aware traffic); exactly "three steps"; "3 to 5 capability blocks"; the entire nine-beat run as a single fixed narrative.

### campaign-landing (11 sections)
Prescribed: `1 Hook → 2 Problem and stakes → 3 Failed alternatives → 4 The mechanism → 5 Demonstration → 6 Proof → 7 The offer → 8 Risk reversal → 9 Honest urgency → 10 FAQ → 11 Final CTA block`. Plus structural rules: no nav, binding message match, CTA repeats identically after every proof/objection block.
- **Load-bearing:** all three structural rules (backed by conversion-rules.md: nav removal "can roughly double conversion"); "place the heaviest proof immediately before the offer"; risk reversal "at the moment of commitment"; "fabricated scarcity fails the integrity gate"; the form-field cost curve.
- **Arbitrary:** the full 11-beat PAS long-form sequence is one copywriting school (classic direct response) presented as *the* structure. For a warm-audience lead magnet or a product-aware retargeting page, slots 2-4 (problem → failed alternatives → mechanism) are dead weight the reader scrolls past, yet "compress for simple lead magnets" is the only relief valve.

### mobile-app (6 sections)
Prescribed: `1 Hero (badges above fold, QR on desktop) → 2 Ratings proof → 3 Core loop in screens (3-4 blocks) → 4 Differentiator → 5 Platform and requirements → 6 Final CTA`.
- **Load-bearing:** badges above the fold; QR for desktop (the send-to-phone bridge is the whole job); real store-attributed reviews only; ASO keyword alignment; "keep total page weight very low; most traffic is mobile"; platform/requirements answering prevents store-page bounce.
- **Arbitrary:** ratings at slot 2; differentiator at slot 4 (for an app in a crowded category, the differentiator IS the hero); exactly 3-4 screenshot blocks.

### course-sales (12 sections)
Prescribed: `1 Hero (transformation) → 2 The gap → 3 Why existing paths fail → 4 The method → 5 Curriculum as outcomes → 6 Instructor → 7 Student results → 8 The offer → 9 Guarantee → 10 Honest urgency → 11 FAQ → 12 Final CTA block`.
- **Load-bearing:** transformation-not-curriculum framing; length scales with price (the ~$200/~$500 thresholds); "curriculum as outcomes" not lesson counts; student results as "the heaviest proof on the page, placed immediately before the offer"; first-cohort substitution rule; payment plans lifting conversion; "the method carries the credibility; the resume supports it, not the reverse."
- **Arbitrary:** it is campaign-landing's PAS skeleton with education nouns swapped in — same gap/failed-alternatives/mechanism spine, same closing run. Instructor at slot 6 (for a creator with a large audience, the instructor is the hook, slot 1).

### membership-community (9 sections)
Prescribed: `1 Hero → 2 Who it is for, who it is not for → 3 Inside the community → 4 What membership includes → 5 The founder → 6 Member outcomes → 7 Pricing → 8 FAQ → 9 Final CTA`.
- **Load-bearing:** the ghost-town fear as the organizing insight ("must prove the thing is alive"); the explicit not-for list; "show the artifact, not an illustration of 'community'"; cadence precision ("'monthly calls' is a promise the page is making"); cancel-anytime as buying factor; the currency-of-proof integrity note.
- **Arbitrary:** not-for list at slot 2 (strong move, arbitrary position); founder at 5; member outcomes at 6; the nine-beat linearity — activity proof arguably belongs woven through, not quarantined in one section.

### newsletter-capture (5 sections)
Prescribed: `1 Hero (form in hero, single email field) → 2 What is inside → 3 Proof → 4 About the writer → 5 Final form`. Plus the thank-you page as part of the archetype's spec.
- **Load-bearing:** nearly all of it. Single field; form-in-hero ("the form IS the page"); frequency/length expectations ("inbox anxiety is the real objection"); best-past-issues as "the strongest proof available: let them taste it"; the post-conversion page requirement. This is the least over-constrained archetype because it's short enough that the order barely matters.
- **Arbitrary:** writer-bio fixed at slot 4; for a personality-driven newsletter the writer is slot 1.

### personal-home (6 sections)
Prescribed: `1 Hero (positioning line) → 2 Proof of work (3-6 items) → 3 Current focus → 4 Credibility narrative → 5 Routes → 6 Contact`.
- **Load-bearing:** one deliberately-picked primary action; "curate ruthlessly; a personal page is a portfolio of judgment"; honest response expectations; the explicit license for aesthetic risk.
- **Arbitrary:** the whole order. This archetype says "tolerates the most aesthetic risk on the whole list" while fixing the structure — aesthetic freedom on a fixed skeleton is a paint job.

---

## 2. The uniformity risk

If 100 users build 100 pages, here is what converges, mechanically:

1. **The universal opening: hero → proof strip → problem.** saas-homepage mandates it; oss-project mandates hero → proof strip; mobile-app mandates hero → ratings proof. ~Half of all pages built open with the identical logo/stat strip directly under the hero — which is also what every YC template and every AI-generated page already does. The reference makes page-foundry output indistinguishable from the sludge the skill exists to avoid.
2. **The universal close: FAQ → final CTA block ("one line restating the outcome, button").** Seven of eight archetypes end this way in nearly identical words (saas #8-9, campaign #10-11, course #11-12, membership #8-9, mobile #6, newsletter #5, oss #7). 100 pages, one ending.
3. **One PAS spine for all persuasion pages.** campaign-landing slots 2-4 and course-sales slots 2-4 are the same problem → failed-alternatives → mechanism sequence. Every sales page and every course page built by this skill tells its story in the same order regardless of the buyer's awareness state — the one variable that should determine story order.
4. **Fixed slot-counts produce fixed rhythms:** "3 to 5 capability blocks," "three steps," "3 or 4 screenshot-led blocks," "3 to 6 items," "three or four concrete bullets." A hundred pages with the same cadence of threes and fours.
5. **Linear single-column narratives only.** Numbered lists imply stacked full-width sections. There is exactly one layout-shape suggestion in the entire file (the bento aside in saas #4). No sanctioned patterns for: interleaved proof (testimonials beside features rather than in a "deep proof" section), split heroes, sticky CTA rails, tabbed persona switchers, comparison-led pages, demo-first pages. The design phase can restyle the sections but never re-shape the skeleton.
6. **Proof quarantined in dedicated sections** ("proof strip," "deep proof," "student results," "member outcomes") — despite shared rule 3 ("proof lives next to the claim it supports") pointing the other way. The section lists win because they're numbered and the principle isn't.

The tokens will differ (Phase 4 does real work there). The wireframe will not. A hundred page-foundry pages will be recognizable as page-foundry pages at thumbnail size — the exact "converging on generic AI-page sludge" failure SKILL.md line 8 names as the enemy.

## 3. Redesign proposal: archetypes as conversion contracts

Replace each numbered section list with a **contract** of six blocks. Everything currently load-bearing survives as a constraint; only the sequencing dies.

**Contract schema (per archetype):**

- **Goal** — the single conversion, unchanged from today (each archetype already states this cleanly).
- **Buyer entry states** — the awareness/temperature states this page type must serve, keyed to the Phase 1 brief (e.g. saas-homepage: cold / evaluating / returning; campaign-landing: exactly one, from the traffic source; membership: skeptical-of-ghost-towns by default). This is the input that *generates* section order instead of a list dictating it.
- **Jobs the page must do** — the current sections, rewritten as obligations without positions. saas-homepage's jobs: *establish what/who/next in 5 seconds; show the real product; name the pain in buyer language; convert capabilities to outcomes; kill "looks complicated"; deliver one specific-number testimonial; disclose the pricing model; answer the Phase 1 objection map; make the ask.* Every job must appear on the page; no job owns a slot number.
- **Proof requirements** — type and *placement constraints*: "heaviest proof immediately precedes the ask" (campaign/course, already stated, keep verbatim); "proof within one viewport of every CTA instance" (conversion rule 4, already exists — the archetypes just need to point at it); "activity proof current, not archival" (membership); "cut proof sections rather than run them thin" (oss).
- **CTA policy** — unchanged: one primary, repetition rules, nav policy, form-field budget. These are the best-evidenced rules in the system (the +32% single-CTA and nav-removal data in conversion-rules.md) and are already expressed as policies, not positions.
- **Ordering constraints** — invariants replacing the sequence. The full set extractable from today's files: (a) 5-second hero always first; (b) proof within one viewport of every CTA; (c) heaviest proof adjacent-before the offer/ask; (d) mechanism established before price is asked; (e) risk reversal at the moment of commitment, not before; (f) objections answered where they arise, with FAQ collecting only leftovers (conversion rule 11 — currently violated by every archetype's mandatory FAQ-slot); (g) mobile single-column order hits proof before any form (rule 8); (h) message match binding for single-source traffic; (i) no qualified entry state disqualified before reaching a CTA (rule 10); (j) sections sequenced by *this buyer's* objection order from the Phase 1 objection map — shared rule 4, finally made operational.

**Layout freedom mechanisms (without losing discipline):**

1. **Composition axes, declared per run in the Phase 2 spec:** *narrative shape* (problem-led PAS / demo-led / proof-led / offer-led — chosen by awareness state: unaware traffic gets PAS, product-aware gets offer-led), *hero form* (copy+CTA / form-in-hero / product-in-hero / install-command / social-proof-led), *proof strategy* (concentrated section vs interleaved beside claims), *density* (long-form vs compressed, driven by price/decision weight — course-sales' price thresholds generalize to every archetype). Four axes × the ordering constraints = real variety inside hard rails.
2. **A section-shape lexicon** (new reference file or a design-direction.md section): for each *job*, 3+ sanctioned shapes. Proof: logo strip / inline pull-quote beside the claim / case-study card / stat wall. How-it-works: numbered steps / annotated screenshot / 30-second clip / live embed. Objections: FAQ accordion / inline callouts / not-for list / comparison table. Phase 4 picks shapes; Phase 2 picks jobs and order.
3. **Per-run layout exploration:** Phase 2 generates 2-3 candidate skeletons from the same contract (different orderings/axes, all constraint-satisfying), does a quick MECLABS pre-read on each, and presents the pick at the existing spec sign-off pause — the explore-mode pattern, moved upstream to structure where it matters more than color.
4. **An anti-template check in Gate 1:** foundry-log.md already records every run. Add a line for the shipped skeleton (job order + axes); if a new page's skeleton matches the property's last N pages and no `conversion data` entry justifies the repetition, flag it. This makes the log's "conversion data must change a decision" doctrine bite on layout, and makes convergence a *choice backed by data* (converged-because-it-converts is fine; converged-because-the-reference-said-so is the defect).
5. **Deviation accounting inverts:** today deviation from the list is the exception to record; under contracts, the *spec* records which ordering the objection map produced and why — same auditability, gates check constraints instead of slot-order.

The gates need almost no change: rules 1-11 and MECLABS are already constraint-shaped. This redesign mostly means the archetype file stops restating a weaker, frozen version of what conversion-rules.md already says better.

## 4. New archetypes worth adding, ranked

1. **pricing-page** — conversion: tier selection into checkout/trial. Highest-intent page in any funnel; SKILL.md's own description promises "pricing page" and the pricing-psychology section in conversion-rules.md is a contract already written, with no archetype to live in. Clear #1 gap.
2. **comparison-alternatives** — conversion: capture switch intent from a buyer already using a named competitor. Message match against the competitor's vocabulary; honest-concession rules (oss #5) generalize; the `competitors` companion is already wired into Phase 2 with no archetype to serve.
3. **docs-dev-tool-landing** — conversion: first successful API call / time-to-hello-world before signup. Distinct from oss-project: commercial dev tool, key-gated quickstart, pricing coexists with docs-first credibility.
4. **waitlist-coming-soon** — conversion: qualified email before the product exists. Unique proof problem (zero product proof; founder, mechanism, and traction proof only) that the integrity rules make interesting rather than impossible.
5. **thank-you-post-conversion** — conversion: activate or upsell the just-converted. Already half-specified inside newsletter-capture (line 174); every archetype has this moment; promote it to a contract every other archetype references.
6. **event-webinar** — conversion: registration against a real date. The one archetype where honest urgency is native rather than optional; date-schema and calendar-add mechanics.
7. **ecommerce-product** — conversion: add-to-cart. Distinct anxieties (shipping, returns, variants, sizing) and proof form (review volume, photos); large audience, but furthest from the current skill's product-page center of gravity.
8. **agency-services** — conversion: booked qualified call. Sells judgment and process; proof is case studies; deliberate friction (qualification) inverts the form-field rule, which makes it a genuinely distinct contract.
9. **changelog-launch-post** — conversion: re-engagement/upgrade of existing users. Unique entry state (already a customer); doubles as launch-day landing target.
10. **404-with-a-job** — conversion: salvage misrouted intent to search/nearest page. Real but tiny; ship as a page in the shared rules or an appendix, not a full archetype.
11. **portfolio** — mostly personal-home with proof-of-work promoted to the hero; under the contract model this is one axis setting on personal-home, not a new archetype — which is itself evidence the contract redesign is right.

## 5. What the mapper should become

Today the mapper is a 3-question **classifier onto 8 fixed templates** (conversion type, relationship duration, traffic source), with composition rules that say "take the structure from the conversion archetype, borrow sections from the other." Under contracts, borrowing sections stops making sense — there are no slots to borrow into.

It should become a **contract compiler**. Inputs: the three existing questions (they're good) plus two the current mapper ignores despite the archetype bodies depending on them — *buyer awareness state* (which currently silently decides whether the PAS spine is right) and *price/decision weight* (which course-sales alone uses, but which governs page length everywhere). Output: not a template name but a filled contract — goal, entry states, the union of jobs from every archetype the page touches, the *strictest* applicable CTA/nav policy, merged proof requirements, applicable ordering constraints, and recommended settings on the composition axes with one line of reasoning each. "Straddling two archetypes" becomes contract merge (union of jobs, conversion-owner sets the goal, strictest policy wins) instead of structure-plus-borrowed-sections. "Nothing fits" becomes cheap instead of exceptional: shared constraints + conversion rules already *are* a contract, so an off-archetype page is just a hand-filled one — and a recurring hand-filled contract is the signal to promote a new archetype (the existing "consider adding the new archetype" instruction, made systematic). Finally, the mapper should read `foundry-log.md`: per-property conversion data and learnings adjust axis defaults, which closes the loop the log format was built for but that the current mapper never consults.

**One-line verdict:** the conversion rules are the asset and are already constraint-shaped; the archetypes wrap them in fixed sequences that re-freeze what rule 4 and rule 11 explicitly unfreeze. Keep every rule, every integrity note, every honest-proof doctrine verbatim; delete the slot numbers.