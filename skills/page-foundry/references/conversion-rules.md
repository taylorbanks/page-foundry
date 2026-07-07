# Conversion Rules

These are the load-bearing rules, with the evidence behind them so future edits do not casually break them. Benchmarks refreshed 2026-07 from published landing-page and form-conversion datasets; treat them as directional, and re-source with a web search if this file is more than a year old.

## Context: what the numbers say

- Median landing pages convert around 4 to 6 percent across industries in 2026; business pages run higher (low double digits), consumer pages around 10 percent. The gap is explained almost entirely by intent matching, clarity, and form design, not by visual novelty.
- A single primary CTA converts about 32 percent better than competing CTAs: roughly 13.5 percent for one action, 11.9 percent for two, 10.5 percent for three or more, in dedicated landing page datasets. On short pages keep the one CTA above the fold; on long-form pages with a complex offer, repeat the same primary CTA at intervals rather than adding competing ones.
- Heroes with a clear above-the-fold value proposition outperform clever or ambiguous messaging by 35 to 40 percent.
- Removing navigation and secondary CTAs from dedicated landing pages can roughly double conversion.
- Roughly 83 percent of landing page visits are mobile; desktop converts better (mobile lands near 58 percent of the desktop rate), so design mobile-first and measure both.
- Form length is a lever: completion runs about 23 percent at 3 fields, 17 percent at 5, 11 percent at 7, and 7 percent at 10 or more; cutting from 4 fields to 2 roughly doubles completion. A multi-step form with conditional logic and a progress indicator captures the same qualification data at roughly double the rate of an 11-field single page. On mobile, 62 percent of form abandonments cite complexity.
- Pages need to be interactive in about 2 seconds; slow mobile loads cost roughly 20 percent of conversions.

## Hard rules

Apply these in Phase 2 (spec) and verify them in Phase 6 (gates).

1. **5-second test.** A cold reader must extract: what it is, who it is for, what to do next, within five seconds of the hero rendering. Test by reading only the headline, subhead, and CTA label, nothing else.
2. **Headline budget.** Primary headline targets under about 44 characters; hard ceiling 70. If the value proposition cannot fit, the positioning is unfinished; go back to Phase 1 rather than padding the subhead.
3. **One primary CTA.** One action, one verb-first specific label ("Start free scan", not "Get started"; "Get the checklist", not "Submit"). It may repeat; it may not compete. Secondary actions are visually subordinate.
4. **Proof adjacency.** Every CTA instance has a proof element (testimonial, number, logo row, rating) within one viewport. Claims and the evidence for them sit together, never in separate sections the reader must connect on their own.
5. **Message match.** For campaign-landing pages, hero language mirrors the traffic source's language. For homepages, hero language mirrors the buyer's own words from research, not internal product vocabulary.
6. **Intent isolation.** One page, one intent. Brand, competitor-comparison, problem, and product intents each get their own page rather than one page hedging across all of them.
7. **Form friction.** Ask only for what the next step in the funnel actually requires; every field beyond name and email needs a stated justification in the spec. Field count is the lever (3 fields is the baseline, 4 to 6 costs roughly 10 to 25 percent of completions, 7 or more costs 25 to 50 percent). Keep labels visible (placeholder-only labels vanish on focus and fail accessibility), validate on field-exit and preserve typed input on error, use a single column, and give inputs 44px touch targets. Past a few fields, a multi-step form with a progress indicator beats one long page.
8. **Mobile-first ordering.** The section order must work as a single column. Proof cannot live only in a sidebar; the mobile reader must hit proof before the form.
9. **Specificity beats cleverness.** Numbers, named outcomes, and concrete nouns outperform wordplay. If a line is clever but vague, replace it.
10. **No premature disqualification.** Any self-test, demo, quiz, or "see for yourself" device must convert every outcome a qualified buyer can experience, including the good one. Map each possible outcome to a next step before the section ships; if a qualified reader can land on an outcome that reads as "not for you," the section is wrong. The same applies to problem framing: never describe the problem so narrowly that a buyer with the adjacent problem self-selects out.
11. **Answer the standing objections inline.** Most pages face four recurring objections; answer each next to where it arises, not only in a catch-all FAQ. Price and value (frame the cost against the cost of the problem; itemize what is included). "Will this work for my situation?" (specific proof, named use cases, or an explicit not-for list). Implementation difficulty (a concrete how-it-works and a time-to-value). "What if it does not work?" (guarantee, refund terms, or what-happens-after-you-click). An FAQ collects the leftovers; it does not replace answering the load-bearing objections in place.

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

## Pricing psychology

For archetypes with a pricing block (saas-homepage, course-sales, membership-community, and campaign-landing offers), apply these levers, honestly:

- **Anchor before the ask.** Show the higher tier or the cost-of-the-problem first, so the target price reads as reasonable against it.
- **Three tiers, guide the choice.** Good-better-best with the recommended tier visually marked reduces choice paralysis; a genuinely weaker decoy tier steers toward the target. The tiers must be real.
- **Price relativity and framing.** State the price against a reference the buyer already accepts (per day, per seat, versus the manual alternative). "$1 a day" and "$30 a month" are the same number and convert differently.
- **Charm versus round.** Prices ending in 9 test better for value-driven offers; round prices read as premium. Match the ending to the positioning instead of defaulting.
- **Rule of 100.** Under about $100 a percentage discount looks bigger; over it, an absolute dollar amount looks bigger. Frame the discount accordingly.

Never fake a strikethrough, a decoy tier that does not exist, or scarcity. Honest levers only; the integrity gate enforces this.

## Anti-patterns to reject on sight

- Hero carousel or rotating headlines (nobody waits for slide two).
- Two equally-weighted hero buttons ("Start trial" next to "Book demo" splits intent; pick the primary, demote the other).
- Stock photography of people at laptops; testimonial sections with no names; "trusted by industry leaders" with no logos.
- Walls of feature bullets with no outcomes attached.
- Popup on entry. Exit-intent or scroll-depth triggers only, and only when the user asks for popups at all.
- Fake countdown timers, fake "3 spots left", fake strikethrough prices. These also fail the integrity gate.

---

_Provenance: reconciled 2026-07-07 against marketingskills 2.3.0 (cro, marketing-psychology; form mechanics from cro/references/form.md). Benchmarks re-sourced 2026-07 from published landing-page and form-conversion datasets. The MECLABS Conversion Sequence heuristic is external and not part of those companions. Re-source the benchmark block when it is more than a year old._
