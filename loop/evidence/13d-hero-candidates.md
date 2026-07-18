# 13d micro-dogfood · hero candidates by objection framing

Exercises the rewritten Phase 3 step 2 (SKILL.md): 2 or 3 complete hero candidates, each leading with a different objection or entry state, scored as units, headline variants inside the winning framing, both picks recorded with reasons. Executed cold by a fresh Opus subagent given the real brief, the real Phase 1 message architecture, and the voice rules; step text quoted verbatim in its prompt. Proof set constrained to real-only items for the dogfood. Output below is the file it produced, verbatim (it wrote to `.agents/copy/`; relocated here because dogfood artifacts do not belong in the live run tree).

---

# Hero candidates: page-foundry homepage (Phase 3, cold run)

Traffic source assumed: GitHub, skills.sh listings, agent-skill roundups. Reader is a solution-aware developer or founder, skeptical, will read the source before installing.

Proof set for this run is real only: the copyable install command (`npx skills add taylorbanks/page-foundry`, free, MIT), the standard-library scanner fact (one Python file, no network, no subprocess), and the fact that this homepage was built by page-foundry. No external pages, no counts, no testimonials.

Scoring is 1 to 5 on each axis. Headline budget targets under about 44 characters and hard-caps at 70; the character count includes the terminal period.

## Candidates (framing first, each leading with a different answer)

### Candidate A: leads with "I'll just prompt an agent myself"

- **Headline:** A page an agent writes, and a gate it cannot pass. (49)
- **Subhead:** Every page runs the real marketing and design skills in order, then clears eight ship gates. A page that fails one does not ship, which is the part a bare agent prompt never gives you.
- **CTA label:** Install page-foundry
- **Proof beside hero:** the standard-library scanner. One readable Python file, no network, no subprocess. The voice gate is a file you can open, not a claim.
- **Scores:**
  - 5-second test: 4/5. Legible, but it assumes the reader already frames "prompt an agent" as the baseline, and the headline is a fragment that leans on the subhead to land.
  - Message match: 5/5. The reflex objection in this exact traffic is "I can just prompt Claude." This meets it first.
  - Headline budget: 3/5. 49 chars, over the 44 target, under the ceiling.

### Candidate B: leads with "Another AI builder, same template"

- **Headline:** Real skills build it. You own the output. (41)
- **Subhead:** page-foundry runs proven positioning, copy, conversion, and design skills, then hands you static HTML or a design handoff package. You are not tied to a platform, or to page-foundry.
- **CTA label:** Install page-foundry
- **Proof beside hero:** this page. It was built by page-foundry. Open the source and inspect the output; it is not a hosted template you rent.
- **Scores:**
  - 5-second test: 5/5. Two plain clauses, concrete, no jargon.
  - Message match: 4/5. It answers the "same template and lock-in" objection, which fits a refugee from hosted AI builders more than the GitHub reader, whose first reflex is DIY, not lock-in.
  - Headline budget: 5/5. 41 chars, under target.

### Candidate C: leads with the orchestration entry state (primary claim)

- **Headline:** A marketing team on every page you ship. (40)
- **Subhead:** One command puts a marketer, a copywriter, a conversion specialist, and a designer on the page, then checks the result so nothing AI-made ships. Keep the static HTML, or take the design package to any tool.
- **CTA label:** Install page-foundry
- **Proof beside hero:** the copyable install command, `npx skills add taylorbanks/page-foundry`. One command, free, MIT.
- **Scores:**
  - 5-second test: 5/5. Instantly legible, concrete image, and "you ship" signals the many-pages reader without a second read.
  - Message match: 5/5. This is the owner's lead angle and the primary claim. It matches the solution-aware developer who wants a team's output without hand-building every page.
  - Headline budget: 5/5. 40 chars, under target.

**Unit pick: Candidate C (15/15).** Candidate A is second at 12/15. Its framing is the sharpest answer to this traffic's core objection, but the fragment headline reads as incomplete in a cold five-second scan and it runs over budget, and a dedicated how-it-works section handles that objection better than the hero does. Candidate B is third at 14/15: clean and true, but "same template" is not the first thing this reader thinks, so it spends the hero on a lower-probability objection. Orchestration wins because it leads with the outcome the whole audience wants. It also reads cleanest in a cold scan and stays under the headline budget.

## Headline variants inside the winning framing (orchestration)

All lead with the same entry state: one command puts a whole marketing team on every page. They differ on wording, not on what the hero answers.

| # | Headline | Chars | Budget | Message match | Specificity |
|---|---|---|---|---|---|
| V1 | A marketing team on every page you ship. | 40 | 5/5 under target | 5/5 team plus the "you ship" scale cue | 4/5 team is a legible metaphor for the orchestration |
| V2 | A whole marketing team on every page you ship. | 46 | 3/5 over target, under ceiling | 5/5 "whole" reads as the full team | 4/5 same as V1, one word heavier |
| V3 | Put a marketing team on every page. | 35 | 5/5 under target | 4/5 imperative, drops the "you ship" scale cue | 3/5 loses the many-pages signal |
| V4 | Every page gets your whole marketing team. | 42 | 5/5 under target | 5/5 "your" adds an ownership nod | 4/5 concrete, slightly softer verb |
| V5 | One command puts a marketing team on the page. | 46 | 3/5 over target, under ceiling | 5/5 names the one-command mechanic | 5/5 most concrete, states the mechanism |
| V6 | A whole marketing team, on every page. | 38 | 5/5 under target | 4/5 drops the "you ship" cue | 3/5 shorter, less specific |
| V7 | Every page you ship, run by a marketing team. | 45 | 4/5 one over target, under ceiling | 5/5 keeps "you ship" and adds "run by" | 4/5 concrete, a touch long |

### Top 3 with reasoning

1. **V1. A marketing team on every page you ship. (40)** The only top option that clears the 44 target and still carries the ship-many-pages ICP signal. Best cold five-second read of the set.
2. **V4. Every page gets your whole marketing team. (42)** Under budget, and "your" quietly nods to ownership, which is the next objection the page has to answer anyway.
3. **V5. One command puts a marketing team on the page. (46)** The most specific line, because it names the mechanic, but it runs over the target and the one-command detail belongs in the subhead and the CTA, not the headline.

## Both picks

- **Winning framing:** Candidate C, the orchestration entry state (a whole marketing team on every page, checked so nothing AI-made ships).
- **Winning headline:** V1, "A marketing team on every page you ship."

## Reasons for the pick

- Orchestration is the owner's designated lead angle and message hierarchy claim 1. The hero leads with the outcome the whole audience wants, and lets the "does not look AI-made" pain move to the problem section in the buyer's words, as the message architecture directs.
- Against this traffic (solution-aware developers on GitHub and skills.sh), the orchestration frame tested 15/15 as a unit: cleanest five-second read, tightest message match, under the headline budget. The two competing frames each spend the hero answering a narrower objection that a later section handles better.
- V1 wins the headline pass on the budget axis without losing the ICP signal. It is 40 characters, under the 44 target, and "you ship" tells the many-pages reader this is for them.
- Divergence from the page spec, recorded on purpose: the spec's current H1 is "A whole marketing team on every page you ship" (V2 here, 46 chars, over the 44 target). This cold run keeps the meaning and trims "whole" to land under budget. "Whole" is a fair call if the team wants the fuller register; it costs six characters and pushes over target. Flag for the owner rather than silently overriding the spec.
- Proof pairing under the real-only constraint: the winning hero carries the copyable install command, which reinforces the one-command mechanic in the subhead. The self-built-page proof ("this page was built by page-foundry") and the readable scanner both remain available and are strongest one section down, beside the gates, where they answer "is it real" and "is it safe" at the moment those questions arise.

---

## Executor findings on the step text, with disposition

The subagent reported two friction points after following the step cold; both reviewed, neither requires a SKILL.md change:

1. Its first draft used em dashes as separators and the voice gate FAILed it 7 times before it self-corrected to a clean pass (final artifact: exit 0, no FAIL, no WARN). No doctrine gap: `hero-candidates.md` lives in `copy/`, Phase 3 step 1 loads the voice rules before any drafting, and step 4 scans the draft files, this one included. The gate catching a cold executor's dashes and forcing the fix is the system working, and the sequence above is the proof.
2. It asked what to do when the spec's chosen hero proof is unavailable (a condition this dogfood created by constraining proof to a real-only subset). In a live run the condition cannot arise the same way: spec proof choices come from the Phase 1 proof inventory, which admits real items only. The executor did the right thing under the constraint anyway (picked from the allowed set per candidate and recorded why), which is the integrity rules operating without a special-case line.

Behavior the step promised, confirmed in the artifact: three framings differing on what the hero answers rather than phrasing, unit scores on all three axes, seven headline variants inside the winning framing, top 3 with one-line reasons, both picks landing together with recorded reasons, and a spec divergence flagged to the owner instead of silently overridden.
