# 13m micro-dogfood · named capabilities consumed on the waitlist fixture

FIXTURE. Every product detail, quote, and copy line below is invented for doctrine testing and extends the 12b on-call scheduling fixture (`loop/evidence/12b-contracts/waitlist-compile.md`). The walk exercises the four behaviors 13m added: the objection map consuming Switching Dynamics and the anti-persona, the red-team's anti-persona reader, Fogg and Hick as spec-structure inputs with the pricing fallback, and copy-editing's three named sweeps. Each walk quotes the doctrine line it executes.

## Fixture brief extension (the two new template sections, filled)

Written against the new `assets/brief-template.md` sections.

### Objections & anti-persona

- Objections heard: `we already run our rotation in PagerDuty`; `another tool for the team to maintain`; `our calendar sync breaks every time we touch it`.
- Anti-persona: the solo developer with no rotation. The product schedules teams; a single person has nothing to rotate. The page may turn away exactly this reader.

### Switching dynamics

- Push: hand-edited spreadsheet rotations break every time someone swaps a shift.
- Pull: swaps that propagate to calendars and paging automatically.
- Habit: the current spreadsheet already feeds the team's Slack reminders; nobody wants to rewire that.
- Anxiety: a private beta could lose the rotation history; migrating the current schedule looks like a weekend of work.

## Walk 1 · Phase 1: the objection map consumes the forces

Doctrine executed: "every Habit and Anxiety force is an objection candidate, and each one either lands in the map with its answer or is struck with a recorded reason."

| Force | Disposition | Entry or reason |
|---|---|---|
| Habit: Slack reminders wired to the spreadsheet | MAPPED | Objection: switching means rewiring the reminders. Answer: the exchange job's update cadence names integrations on the beta roadmap, with the build log linked, honestly labeled as planned. |
| Anxiety: a beta loses rotation history | MAPPED | Objection: my schedule is not safe in a beta. Answer: the honest-state line in the hero (private beta in three months) plus the build log; the page asks for an email, never for the rotation data. |
| Anxiety: migration looks like a weekend of work | STRUCK, with reason | At waitlist stage the signup transfers nothing, so migration cost is not an objection to this page's ask; carried to the foundry-log's open items for the launch page, where it becomes real. |

The strike row is the behavior the old text lost: before 13m the map had no instruction to read the forces at all, so a force nothing answered vanished silently instead of leaving a recorded reason.

## Walk 2 · Phase 3: the anti-persona reader

Fixture hero, drafted to the 12b contract (form-in-hero, honest-state line beside it):

> On-call rotations for teams, without the spreadsheet.
> Swaps propagate to calendars and paging on their own. Private beta opens in three months; the build log ships weekly.
> [Get early access]

- Qualified pain-carrier (runs on-call today, Habit and Anxiety in hand): the subhead answers the Push directly; the honest-state line answers the beta Anxiety beside the CTA. Reaches the form. PASS.
- Anti-persona (solo developer, no rotation): the headline says `for teams` in its first clause; this reader self-selects out at the headline. Correct ending. PASS.
- Defect variant, caught only by the new reader: a fixture alternate headline, `Never lose track of on-call again`, drops the team framing. The solo developer reads it as personal tooling and reaches the form convinced. Under the old text no reader existed to catch this; the new walk fails it, because the page promises something the product does not do for them.

## Walk 3 · Phase 2: Fogg and Hick in the spec's structural reasoning, pricing on the floor

Two structural reasoning lines the fixture spec now carries, per "Name its two structural models when structuring the spec":

- Hick: one email field, one button, zero navigation. The contract's CTA policy already demanded that shape; the map cites Hick's Law as the reason the page offers exactly one choice, which turns a compiled constraint into stated reasoning.
- Fogg: the ask sits after the mechanism job (motivation built by the pitch) and costs one field (ability kept high); the prompt is the form riding the founder-proof viewport.

Pricing fallback, per "A pricing block whose companion is missing is still not psychology-free": the fixture's founding-pricing line, specced with the pricing companion absent, applies the anchoring lever from `persuasion-map.md` (founding price stated against the later public price, both real per the integrity rules) with the Pricing psychology section of `references/conversion-rules.md` as the written floor. The degraded line reads `pricing (missing)`; the section still carries its levers.

## Walk 4 · Phase 3: copy-editing's three sweeps, not cut-only

Fixture draft sentences in, changelog out, sweep definitions from the pinned marketingskills 2.3.0 `copy-editing` skill (Sweep 3 is So What, Sweep 5 is Specificity):

| Draft line | Sweep | Result |
|---|---|---|
| `We are building something exciting for on-call teams.` | Cut | Dies; the reader loses nothing. The hero already names what is being built. |
| `Swaps are handled automatically by the system.` | Tightened | `Swaps propagate to calendars and paging on their own.` Same claim, active voice, fewer words. |
| `Scheduling gets much easier.` | Sharpened (So What plus Specificity) | `The Sunday-night spreadsheet edit ends; the rotation updates itself.` The vague comparative becomes the named ritual the buyer loses, which is the deeper benefit `easier` gestured at. |

The negative that test 50 pins: a cut-only pass returns a changelog holding row 1 alone and leaves `much easier` standing, which is exactly the changelog shape the gate report line now exposes ("what was cut, what was tightened, what the So-What and Specificity sweeps sharpened").

## What this walk proves

Each of the four 13m behaviors executed on one fixture: two forces mapped and one struck with its reason on record; the anti-persona reader ending correctly on the real hero and catching the defect variant; Fogg and Hick cited in the spec's structural reasoning with the pricing block on its written floor; and a three-column copy-editing changelog a cut-only invocation cannot produce. Doctrine lines quoted from `SKILL.md` as shipped in this commit; sweep names verified against the pinned marketingskills 2.3.0 clone.
