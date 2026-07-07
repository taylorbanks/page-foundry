# Conversion Rules

These are the load-bearing rules, with the evidence behind them so future edits do not casually break them. Benchmarks current as of mid-2026; refresh with a web search if this file is more than a year old.

## Context: what the numbers say

- Median B2B SaaS landing pages convert around 2 to 5 percent; top performers reach 8 to 15 percent. The gap is explained almost entirely by intent matching, clarity, and form design, not by visual novelty.
- Single-CTA pages convert around 13.5 percent versus 10.5 percent for multi-CTA pages in dedicated landing page datasets.
- Heroes with a clear above-the-fold value proposition outperform clever or ambiguous messaging by 35 to 40 percent.
- Removing navigation and secondary CTAs from dedicated landing pages can roughly double conversion.
- Roughly 83 percent of landing page visits are mobile (Unbounce benchmark data), while desktop converts slightly better; design mobile-first, measure both.
- Cutting form fields substantially (around 40 percent) lifts completion 30 to 50 percent; progressive profiling beats long forms for both completion and lead quality.
- Pages need to be interactive in about 2 seconds; slow mobile loads cost roughly 20 percent of conversions.

## Hard rules

Apply these in Phase 2 (spec) and verify them in Phase 6 (gates).

1. **5-second test.** A cold reader must extract: what it is, who it is for, what to do next, within five seconds of the hero rendering. Test by reading only the headline, subhead, and CTA label, nothing else.
2. **Headline budget.** Primary headline targets under about 44 characters; hard ceiling 70. If the value proposition cannot fit, the positioning is unfinished; go back to Phase 1 rather than padding the subhead.
3. **One primary CTA.** One action, one verb-first specific label ("Start free scan", not "Get started"; "Get the checklist", not "Submit"). It may repeat; it may not compete. Secondary actions are visually subordinate.
4. **Proof adjacency.** Every CTA instance has a proof element (testimonial, number, logo row, rating) within one viewport. Claims and the evidence for them sit together, never in separate sections the reader must connect on their own.
5. **Message match.** For campaign-landing pages, hero language mirrors the traffic source's language. For homepages, hero language mirrors the buyer's own words from research, not internal product vocabulary.
6. **Intent isolation.** One page, one intent. Brand, competitor-comparison, problem, and product intents each get their own page rather than one page hedging across all of them.
7. **Form friction.** Ask only for what the next step in the funnel actually requires. Every field beyond name and email needs a stated justification in the spec.
8. **Mobile-first ordering.** The section order must work as a single column. Proof cannot live only in a sidebar; the mobile reader must hit proof before the form.
9. **Specificity beats cleverness.** Numbers, named outcomes, and concrete nouns outperform wordplay. If a line is clever but vague, replace it.
10. **No premature disqualification.** Any self-test, demo, quiz, or "see for yourself" device must convert every outcome a qualified buyer can experience, including the good one. Map each possible outcome to a next step before the section ships; if a qualified reader can land on an outcome that reads as "not for you," the section is wrong. The same applies to problem framing: never describe the problem so narrowly that a buyer with the adjacent problem self-selects out.

## MECLABS Conversion Sequence audit

Score the finished page with the MECLABS heuristic before shipping:

C = 4M + 3V + 2(I - F) - 2A

Score each factor 1 to 5:

- **M, motivation match (weight 4).** How well the page matches the visitor's intent and urgency at arrival. Driven by traffic source alignment and problem framing. The page cannot create motivation, only match it; this is why message match is rule 5.
- **V, value proposition clarity (weight 3).** Would the ideal prospect, after the hero plus one scroll, be able to say why to buy from here rather than the alternative? Specific, exclusive, credible claims score high.
- **I, incentive (weight 2).** What the visitor gets for acting now: trial, sample, lead magnet, bonus. Honest only.
- **F, friction (weight 2, subtracted from I).** Form length, page length mismatched to decision weight, confusing navigation, slow load.
- **A, anxiety (weight 2, negative).** Unanswered risk at the moment of action: price surprise, data concerns, "what happens after I click", missing refund terms. Risk reversal and proof near the CTA reduce A.

Record the per-factor scores and the computed C in the gate report. There is no absolute pass threshold; the value is in the diagnosis. Flag direction differs by factor: M, V, and I flag at 1 or 2 (low is bad); F and A flag at 4 or 5 (high is bad). Any flagged factor must be addressed or explicitly accepted by the user before ship.

## Anti-patterns to reject on sight

- Hero carousel or rotating headlines (nobody waits for slide two).
- Two equally-weighted hero buttons ("Start trial" next to "Book demo" splits intent; pick the primary, demote the other).
- Stock photography of people at laptops; testimonial sections with no names; "trusted by industry leaders" with no logos.
- Walls of feature bullets with no outcomes attached.
- Popup on entry. Exit-intent or scroll-depth triggers only, and only when the user asks for popups at all.
- Fake countdown timers, fake "3 spots left", fake strikethrough prices. These also fail the integrity gate.
