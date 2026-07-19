# preflight.md: Interceptor dogfood, Phase -1

Product: Interceptor. Mode: `build` (default; oss-project archetype expected, confirmed at Phase 2). This records the real companion-detection sweep and the run decision. Detection ran over `~/.agents/skills/`, `~/.claude/skills/`, and `~/.claude/plugins/marketplaces/`, matching on SKILL.md `name` frontmatter.

## Core tier (required; the run does not start without all seven)

Every core companion resolved. This run is a full build, not PARTIAL.

| Skill | Status | Version | Resolved at |
|---|---|---|---|
| product-marketing | present | (unversioned) | `~/.agents/skills/product-marketing/` |
| customer-research | present | (unversioned) | `~/.agents/skills/customer-research/` |
| marketing-psychology | present | (unversioned) | `~/.agents/skills/marketing-psychology/` |
| cro | present | (unversioned) | `~/.agents/skills/cro/` |
| copywriting | present | (unversioned) | `~/.agents/skills/copywriting/` |
| frontend-design | present | (unversioned) | `~/.agents/skills/frontend-design/` |
| humanizer | present | 2.5.1 | `~/.agents/skills/humanizer/` |

## Enhancer tier (graceful fallback; declining proceeds)

| Skill | Status | Tier note / what this run loses without it |
|---|---|---|
| copy-editing | present | Phase 3 So-What and Specificity sweeps run live |
| competitor-profiling | present | competitive frame; ran in reduced mode this session (Firecrawl and DataForSEO absent), so competitor SEO and review numbers are `[TK]` in the brief |
| site-architecture | present | single-page property, so its multi-page role is out of scope for this run |
| pricing, competitors, aso | present | archetype-dependent; oss-project has no pricing or app-store section, so these stay idle |
| analytics | present | Phase 2 measurement plan and Gate 7 wiring run live |
| ai-seo | present | Phase 2 answer-block and Gate 6 AI-discovery run live |
| schema, seo-audit | present | Gate 6 JSON-LD and on-page audit run live |
| ab-testing, launch | present | post-ship seams; out of scope for a first build |
| web-design-guidelines | present | Phase 4 and Gate 3/5 rulings run on the live ruleset |
| web-artifacts-builder | present | an accepted Phase 5 build path |
| gstack | present | slash commands available; optional review seams |
| theme-factory | present on disk | removed from the page-foundry companion table in v3.0 (capability-ownership dedup); not invoked, correctly |
| impeccable | missing | Phase 4 `DESIGN.md`, Phase 4.5 comp critique, and Gate 5 design detect run on `references/design-direction.md` and `references/ship-gates.md` fallback rules instead. Every such seam is a degraded seam on the gate report. Install: `npx impeccable install` from the product repo root |
| canvas-design | missing | Phase 5 OG card falls back to the `og.html` capture path (test 53). Install: `npx skills add anthropics/skills --skill canvas-design` |
| webapp-testing | missing | Gate 3/5 render evidence comes from Interceptor directly (`loop/pf-render.sh` for 1440, iframe-eval for 390) rather than this skill. Install: `npx skills add anthropics/skills --skill webapp-testing` |
| algorithmic-art | missing | opt-in and propose-first, so its absence is a no-op unless a signature element proposes it. Install: `npx skills add anthropics/skills --skill algorithmic-art` |

remotion stack: not checked. The oss-project archetype carries no mandatory motion slot, so a motion asset only appears if Phase 2 justifies one; that check happens at Phase 2, and a missing stack there becomes an open item, not a blocker.

## The stop, and the autonomous decision

In a real interactive run the four missing enhancers trigger the one mandatory preflight stop: show this table, ask install-now or proceed-without, once. This dogfood runs unattended, so there is no user to answer. Decision recorded: proceed with the four enhancers declined, because all are enhancer tier and declining is the allowed path for that tier. No companion was installed, matching the skill's rule that installs happen only on explicit user approval from a pinned source. Each declined seam is degraded and named on the gate report when it runs.

OWNER-REVIEW: the "proceed without the missing enhancers" call was made autonomously here; a real interactive run would put that choice to the user. impeccable specifically means the design detect gate runs on reference-file rules rather than the real detector this session, which is why the morning owner test (rebuilding this skill's own page with impeccable installed) is the stronger check of the detect seam.

Pinned-source reconciliation: no install ran, so no `npx skills add <repo> --list` reconciliation was needed this iteration. Names above match the v3.0 companion tables.
