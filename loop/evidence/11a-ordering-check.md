# 11a micro-dogfood: do the shared ordering constraints admit different legal orders?

Reasoning artifact for issue #11, item 11a. No page was built. The contract doctrine claims section order is computed per buyer instead of fixed per archetype. If the ten shared invariants in `references/archetypes.md` secretly force one order, the rewrite changed words, not behavior. This walk checks two objection maps against one job set.

Job set (a self-serve SaaS homepage, jobs as obligations): establish what/who/next in the hero; show the real product; name the pain in buyer language; convert capabilities to outcomes; kill the "looks complicated" objection; deliver a specific-number testimonial; disclose the pricing model; answer the objection map; make the ask.

**Buyer A: cold, problem-aware, mixed organic traffic.** Objection order from a Phase 1 map: do you understand my problem, does the product do this, is it complicated, can I trust you, what does it cost.

Order A: hero → problem in buyer language → capabilities as outcomes (product shown) → how-it-works → pricing model → leftover FAQ → number testimonial → ask.

**Buyer B: product-aware, arriving from a comparison post, evaluating against a named alternative.** Objection order: why this over what I already use, prove it, what does switching cost, what does the product cost.

Order B: hero → differentiating outcomes (product shown) → how-switching-works → pricing model → leftover FAQ → number testimonial → ask.

Order B has no standalone problem section. The pain-naming job still gets done: one line inside each outcome block, framed against the named alternative. Jobs bind; sections are shapes. That is the contract model doing what the numbered lists could not.

Invariant check, both orders:

| # | Invariant | A | B |
|---|---|---|---|
| 1 | hero first, 5-second test | pass | pass |
| 2 | proof within one viewport of every CTA | satisfiable: hero CTA adjacent to a proof element, final ask preceded by the testimonial | same |
| 3 | heaviest proof immediately before the ask | testimonial → ask | testimonial → ask |
| 4 | mechanism before price | how-it-works precedes pricing | how-switching-works precedes pricing |
| 5 | risk reversal at commitment | lives in the ask block | same |
| 6 | objections inline, FAQ collects leftovers | problem and complexity answered in place | comparison objections answered in outcome blocks |
| 7 | mobile order reaches proof before any form | testimonial precedes the ask form | same |
| 8 | message match for single-source traffic | n/a (mixed traffic) | hero mirrors the comparison post's language |
| 9 | no qualified reader disqualified | problem framed at category width | switching framed without disparaging the incumbent's users |
| 10 | order follows THIS buyer's objection map | derived above | derived above |

Result: one contract, two legal orders. They differ in opening move, section count, and where the pain-naming job lives. Note what the invariants still force: both orders end with the heaviest proof against the ask, and mechanism precedes price in both. Convergence where the evidence demands it, divergence where the buyer differs. This is the designed behavior, and it seeds the #11 acceptance line (same brief, structurally different constraint-satisfying skeletons) that 11e's compiler micro-dogfood will prove end to end.
