# Rewrite diagnosis: page-foundry homepage

Source file: `docs/index.html` (190 lines). Also read: `docs/llms.txt`.
Rubric: the `marketing-skills:cro` skill loaded successfully; its CRO Analysis Framework (value proposition clarity, headline, CTA, visual hierarchy, trust signals, objection handling, friction) is the diagnosis lens below, cross-labeled with MECLABS conversion factor terms (motivation, value proposition, incentive, friction, anxiety) as the step requires. The fallback rubric was not needed.

## Where the page loses which visitor

**1. The category-defining fact, that this is a Claude Code skill, is missing from the entire visible hero and does not appear in rendered body copy until line 166, near the bottom of the page.**
The h1 at line 49 reads `A whole marketing team on every page you ship.` and the subhead at line 51, `One command runs your brief through the best marketing and design skills, in order`, describes the mechanism without naming the platform. The install line directly under it, `npx skills add taylorbanks/page-foundry` (line 54), assumes the visitor already knows what a skills CLI is. The phrase `Claude Code` exists in the meta description (line 7), the og:description (line 11), twitter:description (line 16), and the JSON-LD block (line 24), all invisible on render, but the first place it appears in text a visitor actually sees is line 166: `Also a Claude Code plugin, or a .skill upload on claude.ai.` A cold visitor who does not already recognize `npx skills add` has to reach the Install section near the foot of the page, or view source, before learning what kind of product this is. This is a value proposition clarity leak: the visitor most likely to bounce is the one who is in-market for exactly this thing but does not yet know the vocabulary.

**2. The one primary CTA is a terminal command with no lower-commitment path for a visitor who is not ready to run it.**
The primary CTA appears twice, identically, as a copy button next to `npx skills add taylorbanks/page-foundry` (lines 54 and 163). The only other CTA is `★ Star on GitHub` (line 57), a vanity action that does not advance evaluation. Four separate links point to the same GitHub repo (nav at line 40, hero star at line 57, install paragraph at line 166, footer at line 175), but none of them is a dedicated docs, quickstart, or example-walkthrough link. A visitor who wants to understand the tool before installing it has no page-native next step other than reading raw source on GitHub.

**3. The Problem section speaks to one already-frustrated buyer state and offers no on-ramp for a visitor who has not yet formed that frustration.**
Lines 86 to 90 name a single, sharp pain: pages that come out `in a different voice, with a different structure, conversion left to guesswork` (line 88), aimed at people who already `ask an agent for a landing page` regularly. That is a precise fit for the audience the README names, people who ship many pages, but the page has no content addressing a visitor who is simply comparison-shopping page-building approaches and does not yet share that specific frustration. The persuasion architecture assumes agreement with the premise rather than building it.

## Which conversion factors leak, in MECLABS terms

**4. Anxiety: an unattributed quote sits on a page that markets its own zero-fabrication guarantee.**
Line 89: `You end up where a founder I know landed: "I'm tired of every page looking like the same ai-generated bullshit."` No name, company, or link backs this. The same page's gate report claims `Integrity` `PASS` `0 invented` (line 131), and the gate list defines the integrity gate as refusing `No invented testimonial, number, command, or screenshot of something that did not happen` (line 119). An anonymous, unverifiable quote used as a pain-point device, on a page whose own copy at line 154 says it is `built by a security practitioner who assumes you will not take any of that on faith`, is exactly the kind of claim that audience is primed to distrust.

**5. Anxiety: the gate report table is self-graded, on the same page it describes, with no verification path.**
Lines 121 through 132 show eight rows, every one marked `class="pass"`, produced by the tool being sold, scoring the page you are reading, with no link to a script output or a third-party check. Some cells state numbers with no visible scale, e.g. `MECLABS C = 28` (line 124) with no formula shown, and `Measurement` `PASS` `GitHub · skills.sh` (line 129) names two destinations rather than a measured value. A perfect, unverifiable self-report is the one section on this page that asks the skeptical reader it is targeting to take something on faith after explicitly promising it would not.

**6. Anxiety: the page states directly that there is no adoption proof.**
Line 155: `It is new. Few people have installed it yet. The proof is the real pages above, not a download count.` This is candid and consistent with the rest of the page's honesty framing, but it is also a first-party admission that no star count, install count, or user testimonial about the tool itself exists, only examples of its output. That absence of social proof for the tool is a named MECLABS anxiety factor, and the page names it about itself rather than mitigating it.

## What the current page claims, and to whom

The page targets people already using AI agents to write marketing pages at volume (the Problem section, lines 86 to 90) and claims: output will not `read or look AI-made` (meta description line 7, hero subhead line 51), the tool is free and MIT licensed (`Open source · MIT · v2.8`, line 48), it runs with `no network, no subprocess, no dependencies` (line 154), it is installable through three channels, skills CLI, Claude Code plugin, `.skill` upload (line 166), it passes eight self-defined ship gates (lines 121 to 132), it degrades honestly rather than pretending when a companion skill is missing (line 105), and it is early-stage with no adoption numbers to show (line 155). All of these claims are aimed at a technically literate, skeptical developer audience rather than a general small-business buyer, consistent with the security-practitioner framing at line 154.

## What works well enough to keep

**7. The page treats itself as the demo, and backs that with independently checkable examples.**
Line 58: `This page was built by page-foundry. That is the demo.` Combined with three showcase links to live, separately loadable sites, `eatpagosa.com/about` (line 69), `cyberprobono.com` (line 74), `streampatron.org` (line 78), this lets a skeptical visitor verify output quality themselves instead of trusting a screenshot. It is a stronger trust device than a standard testimonial wall because it is checkable, and a rewrite should keep it.

**8. The security paragraph makes specific, falsifiable claims instead of a generic trust badge.**
Lines 152 to 156 state plainly: `a standard-library Python scanner, no network, no subprocess, no dependencies`, and invite the reader to check: `Read it; it is short.` This preempts the exact objection a developer audience raises, what does an installed skill do on my machine, with specifics rather than reassurance. Keep the specificity; do not soften it into a generic security statement in the rewrite.

**9. The "does not pretend" framing at line 105 turns a real limitation into a differentiator.**
`When a skill you need is not installed, it uses a weaker built-in version and tells you the run was partial. It does not pretend.` This sets the product against the implicit alternative, prompting an agent with no guardrails, and stays consistent with the integrity claims used everywhere else on the page. It is doing real persuasion work and should carry into a rewrite rather than being cut for brevity.
