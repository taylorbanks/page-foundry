# Red-team report: page-foundry v3 phase order

Sources read: `/Users/taylor/projects/page-foundry/skills/page-foundry/SKILL.md` (full), `references/archetypes.md` (contract schema, axes, shape lexicon, compiler), `references/ship-gates.md` (gate mechanics), `plans/v3.0.md` (site-architecture placement, WS1/WS2 rationale).

---

## (a) Copy finalized and frozen (Phase 3) before design direction (Phase 4)

**Verdict: DEFECT — the most serious one in the pipeline.**

The re-trigger loop (any post-freeze edit re-runs scan + pattern pass + humanizer on edited sections, then re-snapshot) is *correctness-sufficient*: nothing reaches the page unvoiced, and the frozen snapshot is what makes Gate 2's verbatim diff mechanical. That part holds.

What breaks is the incentive structure, and it breaks the skill's own v3 centerpiece. `archetypes.md` says explicitly: "Phase 2 picks jobs and order; Phase 4 picks each job's shape, with the tokens in hand." But Phase 3 sits between them and freezes final copy. Copy *encodes* a shape: FAQ copy, comparison-table copy, not-for-list copy, numbered-step copy, and annotated-screenshot caption copy are structurally different texts for the same objection-handling job. So when Phase 4 step 3 arrives at the shape lexicon, every shape that doesn't match the frozen prose carries a tax: edit → scan → pattern pass → humanizer arbitration → re-snapshot, against a doctrine that says "one pass, not iterate-to-zero-tells." The predictable agent behavior under that cost gradient is to pick whichever shape the frozen copy already is — prose blocks everywhere. The shape lexicon, WS1's main anti-template mechanism, silently collapses to one shape per job. Copy that should have flexed (length, form, table-vs-prose) doesn't, because only its cost is visible; the claims that genuinely shouldn't flex needed no freeze-ordering to protect them — Gate 2 and the message architecture protect those regardless.

Secondary symptom: the skill already concedes the freeze is porous — build-introduced microcopy (buttons, alt text) is *guaranteed* new copy at Phase 5, so "final copy means final" always runs the chain at least twice anyway. The freeze buys less than it appears to.

**Minimal change:** hoist section-shape selection out of Phase 4 step 3 into the Phase 2 spec (the compiler/cro recommends a shape per job; the sign-off confirms it; the stated dependency on "tokens in hand" is weak — shapes are chosen by content facts the spec already has: proof-inventory shape, whether step order is real). Phase 3 then drafts *to* shapes. Phase 4 may still override a shape, but that override is a recorded decision that knowingly enters the re-trigger loop, not a tax silently avoided. Alternative (bigger): move the snapshot itself to after a post-Phase-4 fit pass — see (g).

## (b) Design direction (Phase 4) after skeleton pick (Phase 2)

**Verdict: ACCEPTABLE TRADEOFF, close to a strength.**

The attack — "visual direction should inform skeleton choice" — fails on the compiler's design. Skeleton = job order + four axis settings, and every axis has a deliberately *buyer-side* chooser: awareness → narrative shape, goal/audience → hero form, proof inventory shape → proof strategy, decision weight → density. None of these choosers is aesthetic, and that is the point: the ordering encodes "conversion structure is not negotiable by taste." Reversing it reintroduces the failure the skill exists to prevent (pretty-first pages that leak). The residual risks are covered by existing valves: gstack `/plan-design-review` puts inline mockups on the spec at sign-off; explore mode exists for direction-undecided properties; existing `DESIGN.md`/brand assets are read at Phase 4 with a defined priority order. One real cost worth noting, not an ordering defect: in non-gstack runs the user signs off on a skeleton with zero visual, approving structure blind to feel. That's a UX gap in the sign-off, not a reason to let tokens pick skeletons.

## (c) impeccable enters at Phase 4; PRODUCT.md written then

**Verdict: DEFECT, low severity.**

PRODUCT.md cannot be complete by end of Phase 1 as the question proposes — its `## Conversion & proof` section needs the primary/secondary CTA set, which the Phase 2 contract's CTA policy fixes, and the belief ladder needs the Phase 1 hierarchy. So "end of Phase 1" is wrong too. But by end of Phase 2 every input exists (positioning, ICP, CTA policy, belief ladder, proof inventory, voice fields, anti-references), and the file has zero dependency on Phases 3–4. Writing it at Phase 4 entry is pure delay, and the delay has a real failure window: an interrupted run, or the user independently running any impeccable command in the product repo between Phases 2 and 4, triggers impeccable's own interview — the exact double-interview the integration note exists to prevent. The singleton merge rule makes the earlier write free.

**Minimal change:** write PRODUCT.md immediately after spec sign-off (end of Phase 2), keeping Phase 4's merge-never-clobber check as a re-verify rather than the first write.

## (d) site-architecture as a Phase 2 adjunct (per plans/v3.0.md WS2)

**Verdict: DEFECT in the planned placement.**

The plan gives site-architecture ownership of "where this page sits in the site, nav policy inputs, URL/slug decisions, and the multi-page moment." Every one of those is an *input* to contract compilation, not an adjunct to it: the compiler fixes nav policy (campaign-landing strikes nav), CTA policy, and which jobs survive; the pricing shape lexicon forks on whether a full pricing page exists ("pricing teaser line linking the full pricing page" vs on-page offer stack); the post-conversion moment forks on whether the thank-you page is buildable in this pass; and the compiler's straddle rule answers "merge two contracts into one page" when the right answer is sometimes "two pages" — a call only site-architecture can make. Run as an adjunct after compilation, its outputs arrive after the decisions they should have shaped, and the gates then audit a contract compiled on guessed site context.

**Fuse or precede?** Precede, don't fuse. The compiler already has the correct pattern for exactly this: it reads `foundry-log.md` as a pre-compilation input that "moves the defaults." Fusing would bloat a page-contract compiler into an IA engine and blur the skill's own scope note (one page; site work flagged separately).

**Minimal change:** when the property has or will have a multi-page presence, invoke site-architecture *before* the compiler, emitting a small `site-context.md` (page inventory, nav policy inputs, this page's slot, split-vs-straddle ruling) into the run directory; the compiler reads it exactly as it reads foundry-log. The escalation seam stays where planned.

## (e) Answer block + measurement plan in Phase 2

**Verdict: STRENGTH.**

This is the correct pattern, and the skill states its own justification precisely: "a gate can only verify what a spec demanded; a gate that discovers the requirement at ship time retrofits it onto finished copy, which is how bolted-on paragraphs read." Both items enter at the last point where they're fully determined (the conversion event needs the contract goal; the answer block needs the positioning and placement) and the first point where downstream work consumes them (Phase 3 writes the block's words through the full voice chain; Phase 5 wires the event). Earlier is impossible (no CTA set at Phase 1); later reproduces the v2 retrofit defect the plan's "timing fixes" explicitly repaired. Note the irony: this is the exact requirements-enter-upstream-of-their-consumers principle whose violation produces defects (c) and (d).

## (f) Hero candidates in Phase 3 before any visual exists

**Verdict: DEFECT, moderate — narrower than it looks, but real.**

Narrower: the hero *form* axis (install-command, product-in-hero, form-in-hero...) is fixed at Phase 2, so candidates are not written form-blind, and the *framing* pick (which objection/entry state the hero answers) is rightly a buyer-side decision that visuals should not influence. What does not survive: the *wording* pick. The 5-second test scored on words alone systematically favors verbally self-sufficient headlines; in a product-in-hero the screenshot does half the communicating and the words-alone winner is often redundant beside it. Line-count under the real display type at 390px is unknowable at Phase 3. And explore mode makes it worse, not better: Phase 3 precedes Phase 4, so every design variant's static hero mockup carries the same frozen words — the mode tests visual directions against fixed copy instead of testing hero word-visual *pairings*. Gate 1's cold-agent audit does score the rendered hero, but a failure there costs a full re-trigger, and (a)'s economics apply: the design conforms to the words.

**Minimal change:** keep the framing pick in Phase 3; voice-gate the top 2–3 headline finalists (cheap — headlines are short) and carry all of them into Phase 4 as live candidates; the wording pick lands against the hero mockup (or first render), is recorded in `hero-candidates.md` with the visual-fit reasoning, then snapshots. Explore-mode mockups may pair variants with different finalists.

## (g) Single-pass phases with terminal gates vs designed iteration loops

**Verdict: DEFECT by omission — one missing loop; everywhere else single-pass is right.**

The single-pass spine is correct and load-bearing: it's what makes runs diffable and resumable (the artifact directory doctrine), the one-pass humanizer rule correctly prevents over-processing thrash, one interview round is correct, and gates-as-floors ("fix and re-run") is the right shape for verification. Do not add loops to any of those. The pipeline even proves its authors know where taste requires designed iteration: explore mode *is* a designed loop (generate variants → pick), and the spec sign-off is a designed decision point.

But the one place iteration is intrinsic to the craft — the copy-visual boundary — has no designed loop at all. It's served by the failure loop (Gate 2/Gate 5 finding → re-trigger → re-gate), and a failure loop under a visible cost gradient doesn't produce iteration; it produces silent conformance (defects (a) and (f) are its two symptoms). Studios don't discover copy-design misfit at QA; they have a comp stage.

**Minimal change (subsumes the (a) alternative and (f)):** insert one designed **fit pass** between Phase 4 and Phase 5 — hero-wording finalist pick against the mockup, shape-fit confirmation per section, length trims to layout — ending with exactly one planned re-entry into the voice chain (scan + pattern pass + humanizer on touched sections) and *then* the `copy-approved.md` snapshot. One loop, bounded, artifact-recorded, with the freeze moved to after the last systematic source of edits instead of before it. Everything downstream (verbatim diff, Gate 2) works unchanged and better, because the snapshot stops being a moving target.

---

## Ranked defects

1. **(a) Copy frozen before shape/design decisions.** Root defect. Re-trigger economics make Phase 4's shape lexicon and design freedom nominal; WS1's anti-template goal is silently defeated by WS2's freeze discipline. Fix: shapes into Phase 2, or adopt fix #2.
2. **(g) No designed copy-visual fit loop.** The systemic form of (a)+(f). One bounded fit pass after Phase 4, snapshot at its end, resolves the whole family with a single mechanism.
3. **(f) Hero wording finalized visual-blind.** Framing pick is correctly placed; wording pick is premature and explore mode inherits the bias. Fix: carry voice-gated finalists to the mockup.
4. **(d) Site-architecture after the contract compiler (planned).** Dependency inversion — nav policy, page-set, and split-vs-straddle are compiler inputs. Cheap to fix now because it's still in plans/v3.0.md, not shipped. Fix: precede as `site-context.md` input, foundry-log pattern.
5. **(c) PRODUCT.md written at Phase 4.** Pure delay past its last input (end of Phase 2); narrow but real double-interview window on interrupted runs. Fix: write after spec sign-off.

Not defects: **(b)** buyer-derived skeleton before aesthetics is the right dependency direction (acceptable tradeoff; consider a mockup at sign-off for non-gstack runs). **(e)** answer block + measurement at Phase 2 is the pipeline's exemplary ordering move — the same principle whose application would fix (c) and (d).