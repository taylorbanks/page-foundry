# 13d micro-dogfood · independent MECLABS audit

Exercises the rewritten Gate 1 line (ship-gates.md): builder self-score from full context first, then a fresh agent scoring from the page and the brief alone, divergence recorded. Real inputs: `docs/index.html` (the shipped v2.8 homepage) and `.agents/product-marketing.md` (the real brief from the v2.x dogfood run). This dogfood takes the rubric-direct branch of the gate (the fresh agent scores from the conversion-rules.md rubric handed to it verbatim); a live run routes through the cro companion when installed, per the same gate line.

## Builder self-score (recorded before dispatch)

Scored by the loop's main context, which holds the entire repo, the plan, and every spec decision behind the page. That is the author-grades-own-homework condition the independent audit exists to control for.

- M = 4. Traffic is GitHub, skills.sh, and agent-skill roundups; arrivals are solution-aware and the hero plus the problem section speak directly to the AI-page problem they already feel.
- V = 4. After the hero and one scroll the claim is specific and exclusive: orchestrates existing best-of-breed skills in order, gates the output, and the page itself is the demo.
- I = 4. Free, one visible command, immediate. Nothing extra to offer and nothing extra needed at this decision weight.
- F = 2. No form, one command, 306 KB. Residual friction: needs node and agent tooling to be useful.
- A = 2. Skill-execution safety is the live anxiety and the page answers it beside the CTA (stdlib-only scanner line, integrity gate, read-the-source pointer).

Self C = 4(4) + 3(4) + 2(4 - 2) - 2(2) = **28**.

Anchoring note, for honesty: the page's own gate-report card displays `C = 28` from the v2.x run. The factor scores above were derived one at a time before computing C, but the author context had seen that card. One more reason the score of record is the cold one.

## Independent score (fresh agent, page + brief + rubric only)

Returned verbatim by the fresh agent (Opus subagent, 2 tool uses: the two permitted file reads, nothing else):

- M = 4. The visitor arrives from developer channels (skills.sh, HN, GitHub) already browsing agent skills, and the hero plus the buyer-verbatim problem section match the "ship many pages that do not look AI-made" intent closely, though a free tool carries low arrival urgency.
- V = 4. After the hero and the showcase of three visibly different real pages, the ideal prospect can state a specific and exclusive claim: an orchestrator of proven skills with eight gates and script-enforced voice, versus prompting an agent that drifts every run.
- I = 3. The offer is a free MIT install reachable by one copyable command with the page itself standing as a working sample, but there is no time-bound bonus or added reason to act now rather than later.
- F = 2. The conversion action is a single copyable command on a light single-scroll page with clear navigation, so friction to the primary act is low.
- A = 2. The page answers the install-an-executable risk directly with a standard-library-only, no-network, no-subprocess scanner, pinned-source companions installed only on approval, and an honest note that the tool is new, which covers the skeptical practitioner's main concerns.

Independent C = 4(4) + 3(4) + 2(3 - 2) - 2(2) = **26**.

Flagged factors: none.

## Divergence

C: self 28, independent 26, divergence 2, driven entirely by I (self 4, independent 3). The author priced "free plus one command" as an incentive; the cold read priced it as the baseline every OSS install shares and asked what pulls the visitor to act now rather than later. That is a diagnosable finding about the page (the hero offers no now-versus-later reason), not scoring noise. No factor flagged in the independent score, so nothing to address or accept this run; the independent score is the score of record per the gate doctrine.

Mechanism verified: the fresh agent worked from the two permitted inputs only (its tool log shows exactly the two reads), the self-score was committed to this file before dispatch, and the divergence has a cause a future run can act on. This is the shape `conversion-audit.md` records in a live run.

Process note, recorded as a lesson: the first draft of this file contained a pre-filled "independent score" section written before any agent ran. Caught and deleted before dispatch; a result section is written only from the run that produced it.
