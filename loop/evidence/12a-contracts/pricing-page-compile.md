# 12a micro-dogfood · pricing-page compile

FIXTURE. The product and its prices below are invented for compiler testing only. This file contains proof REQUIREMENTS, never proof content; no testimonial, metric, or customer appears here or may be reused anywhere. The point of this compile is to exercise the three behaviors 12a added: the compiler's new question-1 mappings, the pricing-page contract's blocks, and the thank-you-post-conversion same-pass rule.

Fixture brief, in full: a team-inbox SaaS with public pricing. Three tiers: Solo at $19 per seat monthly, Team at $49 per seat monthly (the intended target tier), and a quote-based Enterprise tier priced that way because procurement and SSO reviews genuinely require scoping. 14-day trial on Solo and Team, no card required. Traffic: the site nav plus "COMPETITOR pricing" cross-shopping searches; an existing free-trial cohort hits seat limits and arrives with upgrade intent. No `foundry-log.md` exists for this property.

## The five questions

1. **Conversion:** tier selection into checkout, trial, or upgrade. → `pricing-page`, per the compiler's new question-1 mapping.
2. **Relationship:** ongoing subscription; the page must state the leaving path plainly (cancel and downgrade are billing-mechanics jobs in this contract).
3. **Traffic:** mixed. Nav evaluators, cross-shoppers from pricing searches, and in-product upgrade arrivals. No single source, so message match binds only loosely; the entry-states mix does the ordering work instead.
4. **Awareness state:** product-aware to solution-aware. Nobody lands on a pricing page unaware; the contract's entry states (evaluator, cross-shopper, upgrader) replace the generic ladder, and the brief says all three arrive.
5. **Decision weight:** $49 per seat monthly with a no-card trial: light to enter, recurring to keep. Density: compressed; the deliberation this page ends is which-tier, not whether-category.

## Filled contract

**Goal.** Tier selection: start the Team trial from the recommended card, or the upgrade from Solo.

**Buyer entry states.** All three of the contract's states arrive, per the brief. Evaluators from the nav carry which-tier-is-me; cross-shoppers check the sticker against a shortlist; the trial cohort at seat limits carries upgrade intent, so the upgrade jobs are KEPT (they would be struck for a product with no existing customers).

**Jobs, kept or struck.**

- Tiers in the first scroll, Team marked recommended: KEPT.
- One who-it-is-for line per tier: KEPT.
- Anchor before the ask: KEPT; Enterprise and the cost-of-the-problem line anchor Team.
- Legible adjacent-tier difference: KEPT; the one capability that moves Solo to Team, stated plainly, matrix behind a toggle.
- Billing mechanics inline: KEPT; seat definition, limit behavior, proration, cancel and downgrade paths.
- Free path plainly: KEPT; 14 days, no card, what ends at day 15.
- Upgrade-state jobs: KEPT; what Team adds over Solo and that nothing breaks on the way up.
- Honest sales path: KEPT; Enterprise states its quote-based reason (procurement, SSO review) beside the contact action.
- Risk reversal at the cards: KEPT; trial terms and cancel-anytime on the cards.
- Leftovers: KEPT; B2B procurement questions and outgrow/shrink answers.

**Proof requirements.** A proof element in the tier-card viewport; the strongest form is a quote naming value at a specific tier. Requirements only; the fixture supplies no proof content.

**CTA policy.** One verb-first action per tier, same label pattern, Team's button leading; Enterprise contact is that tier's action, not a competitor. Navigation standard.

**Ordering constraints.** The shared ten read as the contract directs (constraint 4 at funnel scope: one what-this-is line in the hero, no mechanism section above the cards), plus the archetype's three: cards in the first scroll, anchor before or beside the target price, billing mechanics before the final CTA repetition.

**Axes.** Narrative shape: offer-led; the tiers are the offer and the entry states arrive decided on the category. Hero form: product-in-hero is wrong here, the cards do the passing; copy-plus-cards. Proof strategy: interleaved; small proof rides the cards per shared constraint 2. Density: compressed; decision weight chose it in question 5.

**Log.** No `foundry-log.md` exists for this property, so the axis defaults stand, and the contract says so, per the compiler's log rule.

**Post-conversion.** Trial start lands on a first-run screen the product owns (not built here); the Solo-to-Team upgrade confirmation is a page this skill can build, so the run builds it in the same pass to the `thank-you-post-conversion` contract: confirm the upgrade as fact, deliver the unlocked capability as the immediate first step, no additional ask (the moment was spent on the upgrade itself).

## What this compile proves

Question 1's new mapping routes tier-selection conversions to `pricing-page`; the contract's six blocks fill from a brief without inventing content; the funnel-scope reading of shared constraint 4 resolves the tension between mechanism-before-price and cards-in-first-scroll; the same-pass rule routes a buildable post-conversion screen to the `thank-you-post-conversion` contract. `/pricing.md` drafting is Phase 2 companion behavior (TESTS.md 38), out of a compile's scope.
