# 17a micro-dogfood · fill the fixed acceptance-criteria template

Input: the compiled contract from the 11e dogfood (`loop/evidence/11e-compiler-dogfood/dev-tool-contract.md`, page-foundry itself as an oss-project) plus the live docs homepage's real values (`docs/index.html`, `docs/llms.txt`, `docs/robots.txt`, `docs/theme.css`, `docs/assets/og.jpg`, all verified on disk before filling). Output: `04-acceptance-criteria.md` beside this file, filled by walking the template in the rewritten `references/handoff.md` top to bottom under its own rules.

What the fill exercised, and what it proved:

1. **Slots fill from real values.** Canonical URL and OG image filename came from the live head; the answer block resolved to spec section 1 because the hero subhead on the live page is a self-contained block of about 45 words of real text; budget slots took the stated defaults. No slot was left in braces and no value was invented.
2. **N/A discipline holds.** Seven criteria went N/A, each with its reason on the line: no form (G3.8), no auth (G3.9), not a public-pricing archetype (G6.8), and the three measurement criteria plus nothing reworded, renumbered, or deleted anywhere.
3. **Branch slots select.** G5.2 resolved to the locked regime because the property has a committed `theme.css`; the unused propose-then-lock branch text dropped out as the template intends.
4. **The template surfaces gaps instead of absorbing them.** The G7 fills could not name a conversion event because this property has no measurement plan: the v2.x-era page predates the requirement. The forced N/A reasons put that gap in writing where the ship gates treat a missing plan as a Phase 2 defect. A real v3 handoff run of this property would stop at Phase 2 until the plan exists, which is exactly the behavior the fixed template is for: the gap is recorded, never silently filled.

Verbatim scanner output for both files in this directory is in the commit message. The stable-ID property (a post-build failure traces to the exact line the builder was given) is structural: the IDs above are byte-identical to the template's, which is checkable by diffing the ID prefixes of this file against the template block in `references/handoff.md`.
