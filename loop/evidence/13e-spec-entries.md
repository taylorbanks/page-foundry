# 13e micro-dogfood · Phase 2 spec entries (answer block, measurement plan, /pricing.md)

Exercises the new Phase 2 step 4 text on the two 11e compile inputs. Input 1 is page-foundry itself: real product, real facts, nothing invented. Input 2 reuses the 11e course FIXTURE; its product and price are invented for pipeline testing only and carry no proof content.

## Input 1 · dev-tool (page-foundry, oss-project), real

**Answer block** (58 words, drafted from the repo README and skill frontmatter; ai-seo not invoked in this offline check, noted per the degraded rule):

> page-foundry is a skill for AI coding agents that turns one product brief into a shipped homepage, landing page, or sales page. Seven phases with hard gates check conversion structure, accessibility, performance, and honesty, and a mechanical voice scan keeps the copy in the owner's register instead of generic AI prose. Free, MIT-licensed, installable via the skills CLI.

Every claim traces: seven phases, the gate list, the voice scanner, MIT, and the install channel are all in the README shipped in this repo. Word count inside the 40 to 60 band.

**Measurement plan** (a plan the spec would carry; nothing here claims wired analytics):

- Conversion event: install intent, measured as a copy click on the `npx skills add` command block. Recorded by the page's privacy-respecting counter if the owner wires one, or consciously declined; Gate 7 takes either, never silence.
- UTM convention for the traffic the 11e compile named: `?utm_source=github&utm_medium=readme`, `?utm_source=skills-sh&utm_medium=listing`, `?utm_source=roundup&utm_medium=mention`.

**/pricing.md:** N/A. oss-project is not a public-pricing archetype (Gate 6 names saas-homepage, course-sales, membership-community). The spec records the N/A; nothing ships.

## Input 2 · course FIXTURE (course-sales, $349), public-pricing path

FIXTURE. Drafted only to exercise the /pricing.md seam; the course, its price, and its terms are the 11e fixture's inventions.

`pages/course-fixture/pricing.md` draft the spec would carry:

```markdown
# Pricing — (fixture course)

- Format: 8-week live cohort, one cohort at a time
- Price: $349, one-time
- Payment plan: available (terms on the enrollment page)
- Guarantee: exact terms stated on the page (fixture does not invent them)
- Enrollment: open only during the launch window; next cohort date on the page
```

Fields the fixture brief does not supply (guarantee terms, cohort date) point back to the page instead of inventing values, per the omit-rather-than-invent rule in the Gate 6 templates.

## What this proves

The new step 4 text is executable as written: both entries and the pricing draft fall out of inputs the spec already has (the compiled contract's goal and traffic answers, the brief's facts), no gate had to invent anything, and the two gate-side checks (Gate 6 block survival, Gate 7 wiring) have a specced object to verify against.
