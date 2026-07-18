# 11c: load-bearing survival map + two-buyer derivation

Test fixture, not a client run. Two checks against the 11c acceptance standard (same as 11b): every load-bearing rule from `plans/research/pf-archetypes.md` §1 survives as a job or constraint; slot numbers die; awareness-state notes added; the contract still permits structural variation and rejects illegal orders.

## Load-bearing survival map

Each item below is quoted or paraphrased from the research audit's "Load-bearing" lists for the three converted archetypes, with where it now lives in `references/archetypes.md`.

### mobile-app

| Research §1 load-bearing item | Survives as |
|---|---|
| Badges above the fold | Ordering constraint 1 |
| QR for desktop (send-to-phone bridge is the whole job) | Goal + entry states (device dimension) + job 1 + ordering constraint 1 |
| Real store-attributed reviews only | Proof requirements |
| ASO keyword alignment | Job 2 |
| Total page weight very low, most traffic mobile | Trailing page-weight note |
| Platform/requirements answering prevents store-page bounce | Job 4 + ordering constraint 3 |
| Device-framed screenshot / recording of core loop, captions in outcome language | Jobs 1 and 2 |
| Differentiator; privacy posture plainly for privacy-forward apps | Job 3 |
| Navigation minimal (Support, Privacy) | CTA policy |

Slot numbers died: ratings no longer pinned to slot 2, differentiator no longer pinned to slot 4 (now awareness-conditional: hero-adjacent for solution-aware crowded-category traffic, per the research's "the differentiator IS the hero" note), "exactly 3-4 screenshot blocks" count dropped.

### course-sales

| Research §1 load-bearing item | Survives as |
|---|---|
| Transformation-not-curriculum framing | Intro + job 1 |
| Length scales with price (~$200/~$500 thresholds) | Length note |
| 5-15% warm-traffic conversion range | Length note |
| Curriculum as outcomes, not lesson counts; format logistics | Job 5 |
| Student results heaviest proof, immediately before offer | Proof requirements + ordering constraint 2 |
| First-cohort substitution rule | Job 7 + proof requirements |
| Payment plans lift conversion above a few hundred dollars | Job 8 |
| Method carries credibility, resume supports it | Job 4 + proof requirements |
| Guarantee 30-day floor, exact terms, application-as-risk-filter variant | Job 9 |
| Honest urgency: real dates/caps, evergreen skips | Job 10 |
| FAQ topics (time, prerequisites, refunds, fall-behind, edge cases) | Job 11 |
| No nav, checkout-direct enrollment, minimum-field applications | CTA policy |
| Gap in reader's words; missing structure/feedback not motivation | Job 2 |
| Failed paths conceded honestly | Job 3 |

Slot numbers died: the 12-beat PAS sequence is gone; the arc jobs carry awareness conditions; instructor is no longer pinned to slot 6 (entry states + job 6 allow instructor-led opens for product-aware audience traffic, per the research's "the instructor is the hook" note). The old `[TK]`-and-cut instruction is now a plain no-fabrication rule with the same substitution behavior.

### membership-community

| Research §1 load-bearing item | Survives as |
|---|---|
| Ghost-town fear as organizing insight | Intro + entry states + ordering constraint 1 |
| Explicit not-for list | Job 2 (with the shared-constraint-9 non-collision note) |
| Show the artifact, not an illustration; feed recording beats copy | Job 3 |
| Cadence precision ("monthly calls" is a promise) | Job 4 |
| Cancel-anytime as buying factor | Job 7 |
| Currency-of-proof integrity note (busy week 8 months ago fails) | Proof requirements |
| Founder presence claims honest and verifiable | Job 5 |
| Member outcomes named, specific, before pricing | Job 6 + ordering constraint 2 |

Slot numbers died: not-for no longer pinned to slot 2, founder to 5, outcomes to 6; the research's `activity proof arguably belongs woven through, not quarantined` became explicit license in job 3 (interleave beside claims).

## Two buyers, two legal skeletons (course-sales)

Fixture brief: an eight-week cohort course teaching security engineers to run purple-team exercises. Price $900 (long-form density). Goal: enrollment.

**Variant A: problem-aware traffic** (search + content, reader knows their detections are untested). Objection map: "is my situation actually fixable" then "why didn't my self-study fix it" then "why does this method work" then "what exactly do I get" then "who are you" then "will it work for people like me" then "what if it doesn't".

Derived skeleton: transformation hero -> gap -> failed paths -> method -> curriculum-as-outcomes -> instructor -> student results -> offer -> guarantee -> honest urgency -> leftover objections -> close.

Constraint check: hero first (shared 1) yes. Arc order gap/failed-paths/method/curriculum preserved (course add 1) yes. Student results immediately before offer (course add 2) yes. Offer after method (course add 3) yes. Heaviest proof before ask (shared 3) yes. Risk reversal at commitment (shared 5): guarantee adjacent to offer, yes. FAQ collects leftovers only (shared 6) yes. Legal.

**Variant B: product-aware launch-list traffic** (the instructor's own newsletter audience). Objection map: "is the cohort version worth paying for" then "what exactly do I get and when" then "can I make the time" then "what if I fall behind".

Derived skeleton: instructor-led hero in launch-email language (message match, shared 8) -> method compressed to one block -> curriculum-as-outcomes with logistics and time commitment -> student results -> offer with payment plan -> guarantee -> real seat cap -> leftover objections (fall-behind, refunds) -> close. Gap and failed-paths struck (spec records: product-aware, arc pruned from the front).

Constraint check: hero first, yes. Arc pruned from the front, never reordered (course add 1): remaining arc runs method -> curriculum, yes. Student results immediately before offer, yes. Offer after method, yes. Message match binds, yes. Legal.

**Structural difference.** A opens with the reader's problem and spends five blocks earning the method; B opens with the instructor and reaches the offer in half the length with logistics promoted. Same contract, same course, different buyers, different pages. Under v2.x both got the identical 12-slot sequence.

**Negative case.** Candidate for variant A: hero -> offer -> method -> gap -> student results -> close. Rejected mechanically: offer itemized before method established (course add 3 fails); student results not immediately before the offer (course add 2 fails); arc runs backward, method before gap for a problem-aware reader (course add 1 fails). Constraints still bite.

Conclusion: all load-bearing items survive with citable locations, slot numbers are gone from all three archetypes, and the contracts produce buyer-dependent structure while rejecting illegal orders.
