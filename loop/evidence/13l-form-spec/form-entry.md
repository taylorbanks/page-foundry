# 13l micro-dogfood · the spec's form entry for the waitlist fixture

FIXTURE. Same invented product as `loop/evidence/12b-contracts/waitlist-compile.md`: an on-call rotation scheduling tool, three months from private beta. This file is the form entry the new Phase 2 step 3 text requires, produced by walking cro's form reference (the pinned marketing-skills 2.3.0 copy at `~/.claude/plugins/cache/marketingskills/marketing-skills/2.3.0/skills/cro/references/form.md`) against the fixture's compiled contract. The entry follows that reference's Recommended Form Design output shape: required fields justified, optional fields with rationale, field order, copy, error messages, layout.

The contract binds first: its CTA policy reads "Email only; no qualification fields, because the fixture's access is not selection-limited." The form design works inside that.

## Form entry (spec section: the exchange, form-in-hero)

**Required fields.** One: email. Justification: the contract's goal is a qualified email where qualification is honest self-selection by the not-yet framing, so the address is the only data the next funnel step (the weekly build log, the early-access invite) requires. The reference's lead-capture guidance reads "Minimum viable fields (often just email)".

**Optional fields.** None. Rationale: access is not selection-limited, so a qualifying question costs completions (the reference's field-cost rule: 3 fields baseline, each field past that reduces completion) and buys nothing the funnel uses.

**Field order.** Single field; order is moot. Single column.

**Step call.** Single-step. The reference reserves multi-step for more than 5 to 6 fields or logically distinct sections; one field is neither.

**Copy (Phase 3 input; routes through the voice chain in a real run).**
- Label: `Email`, visible above the input, never placeholder-only (placeholders vanish on focus).
- Placeholder: an example, `you@company.com`.
- Button: `Get early access` (the reference's action-plus-what-they-get shape; the contract's exchange is early access).
- Trust line under the button: the update cadence plus the no-spam assurance, per the reference's near-form trust guidance and the contract's exchange job (weekly build log).

**Error messages.** Email invalid or empty: `Please enter a valid email address (e.g., you@company.com)`, positioned at the field, typed input preserved. Validate on field exit, never per keystroke.

**Layout.** Email keyboard on mobile (`type="email"`), 44px minimum touch target, button immediately after the field, founder-proof element in the same viewport per the contract's ordering constraint.

## What this walk proves

The new step 3 text produces a real deliverable even on the smallest possible form: an email-only contract still leaves label visibility, button copy, error handling, and the trust line as design decisions the reference answers and the old spec never recorded. The entry adds zero fields beyond the contract's policy, which is the binding the new text states.
