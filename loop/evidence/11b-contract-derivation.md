# 11b micro-dogfood: one contract, two buyers, two legal skeletons

Test fixture, not a client run. Purpose: confirm the rewritten saas-homepage contract (archetypes.md, 11b) does what the doctrine head claims: "two pages honoring the same contract should differ in structure whenever their buyers differ", while the ordering constraints still reject bad orders. This is the acceptance property from issue #11 ("Phase 2 on the same brief can produce structurally different constraint-satisfying skeletons"), exercised by hand at contract level.

Fixture brief: a SaaS log-triage tool for on-call engineers. Goal: trial signup. Jobs drawn from the contract: hero (headline+subhead+product visual), problem, capabilities-as-outcomes, how-it-works, pricing disclosure, objection answers, close. Proof registers: fast trust signal + deep testimonial.

## Variant A: cold-dominant traffic (content marketing, unaware/problem-aware)

Objection map order: "do I have this problem?" then "does this fix it?" then "is it complicated?" then "can I trust it?" then "what does it cost?"

Derived skeleton: hero (trust signal adjacent) -> problem -> capabilities-as-outcomes (testimonial pull-quote inline beside the boldest claim) -> how-it-works -> pricing disclosure -> remaining objections -> close.

Constraint check: hero first (shared 1) yes. Proof within one viewport of hero CTA (shared 2): trust signal adjacent to hero, yes. Heaviest proof before the ask (shared 3): testimonial sits ahead of the closing CTA run, yes. Mechanism before price (shared 4): capabilities and how-it-works precede pricing, yes. Problem before capability story with cold traffic (saas add 2): yes. Pricing before final ask (saas add 1): yes. Legal.

## Variant B: solution-aware-dominant traffic (comparison shoppers from a review site)

Objection map order: "how is this different?" then "will it work with my stack?" then "what does it cost?" then "do I trust it?"

Derived skeleton: hero -> capabilities-as-outcomes led by the differentiating capability (deep testimonial directly beside it) -> integrations strip (optional job, earned: stack fit is this buyer's second objection) -> pricing disclosure -> how-it-works -> problem reduced to one clause inside the close -> close.

Constraint check: hero first, yes. Proof within one viewport of each CTA, yes (testimonial beside capabilities, trust signal at close). Heaviest proof before the ask: the deep testimonial precedes pricing and close, yes. Mechanism before price: capabilities precede pricing, yes. Saas add 2 (aware traffic: problem shrinks or moves late, spec records why): problem is one clause late in the page, recorded here, yes. Pricing before final ask, yes. Legal.

## Structural difference

A and B share no interior order. A: problem second, pricing fifth, proof concentrated late. B: capabilities second, pricing fourth, proof interleaved beside the differentiator, problem nearly gone. Same contract, same product, different buyers, different pages. Under v2.x both briefs got the identical nine-slot sequence.

## Negative case: the constraints still bite

Candidate skeleton: hero -> pricing disclosure -> capabilities -> problem -> close, proposed for variant A (cold traffic).

Rejected on two constraints: mechanism before price (shared 4) fails because pricing precedes any capability or how-it-works content; saas add 2 fails because cold traffic meets pricing and capabilities before the problem is established. The contract is not anything-goes; illegal orders are detectable mechanically from the constraint list.

Conclusion: contract permits real structural variation and rejects constraint-violating orders. Property holds for the 11b conversions.
