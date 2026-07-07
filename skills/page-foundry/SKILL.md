---
name: page-foundry
description: End-to-end pipeline for product homepages, landing pages, and sales pages. Use this skill whenever the user wants to create, draft, rewrite, review, or ship a homepage, landing page, sales page, product page, launch page, pricing page, course or workshop sales page, membership or community page, newsletter signup page, personal site, or marketing site for a product, web app, mobile app, SaaS, open source project, course, community, or person; also when they mention page-foundry, conversion copy, page CRO, hero sections, "make a page for X", or want a copy and design package to hand to Claude Design. It sequences intake, message architecture, page spec, copy, design, and build or handoff, then enforces ship gates (conversion rules, voice scan, accessibility, performance, schema, llms.txt). Orchestrates product-marketing, copywriting, cro, frontend-design, theme-factory, and gstack design skills when installed, and degrades gracefully when they are not.
---

# Page Foundry

A foundry takes raw material through a fixed sequence of stations and rejects anything that fails inspection. This skill does the same for marketing pages: one product brief in, one deployable page (or one handoff package) out, with hard gates between stations. The point is repeatability across many products without the output converging on generic AI-page sludge or drifting from the owner's voice.

Run the pipeline in order. Each phase has an output the next phase consumes. Do not skip the gates; a page that fails a gate does not ship.

## Phase -1: Preflight

Run once at the start of every engagement.

Nothing installs, updates, or gets skipped silently.

1. **Detect, everywhere.** A companion counts as PRESENT if its skill name resolves anywhere below. Match on SKILL.md frontmatter `name`, accept plugin-namespaced forms (`marketing:copywriting` satisfies `copywriting`), and count symlinks. Sweep in this order:
   - Runtime inventories first: `npx skills list` (covers project and global) if the skills CLI responds; `claude plugin list` in Claude Code; the available-skills listing in claude.ai.
   - Filesystem: `~/.agents/skills/` (the skills CLI's canonical location), `~/.claude/skills/`, project `.claude/skills/` and `.agents/skills/`, `/mnt/skills/*` (public, examples, user, plugins), and Claude Code plugin directories under `~/.claude/plugins/`.
   - gstack is detected by its slash commands (`/design-shotgun` etc.), never by directory.
   The sweep must complete before any install or update command is even considered. Installing a companion that is already present anywhere is a defect. Cache the result for the session.
2. **Check freshness.** If the skills CLI is present, run `npx skills check` and note outdated companions. Plugin-installed companions update via `claude plugin marketplace update <marketplace>` then reinstalling the plugin. Treat outdated exactly like missing: report, offer, act only on approval.
3. **Report and ask, once.** Show one table: present / outdated / missing, with the exact install or update command per gap and one line on what this run loses without it. Ask a single question: install and update now, or proceed without? On approval, run the commands, then RE-RUN detection and confirm every name resolves before continuing. On decline, proceed with the condensed rules built into this skill's reference files and record the decline in the gate report. Never skip a missing companion silently.
4. **Pinned sources only.** Install exclusively from the sources in the companion table below, never from search results or unpinned repos. Before installing from an evolving repo, run `npx skills add <repo> --list` and reconcile names against the table; if a pinned name no longer exists upstream, report the discrepancy instead of guessing at a replacement.
5. **Pick the mode** (ask if not obvious from the request):
   - **build** (default): this skill carries the page through Phase 5 and ships code.
   - **explore**: design variants first. Phases 0 through 3 run normally; Phase 4 produces multiple committed design directions instead of one (gstack `/design-shotgun` when installed; otherwise this skill generates 3 contrasting token plans, each with a static hero mockup, built one at a time). The user picks; the winner proceeds through Phase 5 as a normal build. Use when the property has no theme yet or the user wants options.
   - **handoff**: this skill produces copy plus a complete design package for Claude Design (or another design tool) to build. Phases 0 through 4 run normally; Phase 5 is replaced by the handoff package in `references/handoff.md`; gates split as described there.

### Controlling the run

**Bare invocation.** If invoked with no product and no instructions (`/page-foundry` alone), do not start the pipeline. Print a compact orientation: the three modes and what each outputs, the eight archetypes, the example invocations below, and a one-line note that pauses are suppressible. Then ask what to build.

The user's invocation sentence is the control surface; there are no flags. Parse these parameters from the request and do not ask about anything the user already supplied:

- **mode:** `build` | `explore` | `handoff`. Unstated and unambiguous from context → build. Whenever the mode is inferred rather than asked, state the inference and the alternatives in one line before proceeding ("Running in build mode; explore and handoff also available"), so the user knows a choice was made and can redirect.
- **product / brief:** a path to an existing `product-marketing.md`, an attached PRD or doc, or a repo URL. An existing brief skips the Phase 0 interview. A PRD, spec, or repo does NOT: those are source material, not the brief. PRDs answer what the product does; the brief answers why someone buys, in whose words, against which alternatives, with what proof. Phase 0 always produces `product-marketing.md`.
- **archetype:** named → use it; unnamed → run the mapper, state the pick and the reasoning in one line, and proceed without asking unless genuinely torn between two.
- **theme:** "use existing theme/DESIGN.md/theme.css at <path>" → Phase 4 collapses to reading it. Unstated → Phase 4 runs in full.
- **interactivity:** "don't pause", "no questions", "run end to end" → suppress the spec sign-off pause and the preflight install question (continue with what's installed), and deliver spec + page + gates together. Silence → the default pauses below apply.
- **variants (explore mode):** a count ("5 variants") and scope ("hero only" vs "full direction") if stated; default 3 variants, hero scope.

Default interactive pause points, in order, and what suppresses each:

| Pause | Fires when | Suppressed by |
|---|---|---|
| Preflight install offer | companions missing | "continue with what's installed" |
| Mode question | mode ambiguous | naming the mode |
| Phase 0 interview | no brief/PRD/repo available | providing any of those |
| Spec sign-off | always by default | "don't pause for sign-off" |
| Explore pick | always in explore mode (it is the point) | cannot be suppressed |
| Shotgun offer | gstack present + no theme + direction undecided | naming a theme or direction |
| Voice wizard | `owner: default` or user asks | configured voice.md |

Example invocations:

- Full page, no questions: "page-foundry, build mode, saas-homepage for Acme; brief at .agents/product-marketing.md, use theme.css in repo root, don't pause, show spec + page + gate report together."
- Designs to choose from: "page-foundry, explore mode for Acme, 4 variants, full direction; brief attached; stop at the comparison."
- Claude Design package: "page-foundry, handoff mode for Acme; brief attached; campaign-landing; package only, I'll build in Claude Design."

### Companion skills

| Skill / command | Source | Install | Used in phase |
|---|---|---|---|
| product-marketing | coreyhaines31/marketingskills | `npx skills add coreyhaines31/marketingskills --skill product-marketing` | 0 |
| customer-research, marketing-psychology | coreyhaines31/marketingskills | same pattern, `--skill <name>` | 1 |
| copywriting, copy-editing | coreyhaines31/marketingskills | same pattern | 3 |
| cro | coreyhaines31/marketingskills | same pattern | 2, 6 |
| pricing, competitors, aso | coreyhaines31/marketingskills | same pattern | 2 (archetype-dependent) |
| frontend-design | Anthropic (anthropics/skills) | `npx skills add anthropics/skills --skill frontend-design` | 4 |
| theme-factory, web-artifacts-builder | Anthropic (anthropics/skills) | same pattern | 4, 5 |
| ai-seo, schema | coreyhaines31/marketingskills | same pattern | 6 |
| web-design-guidelines | vercel-labs/agent-skills | `npx skills add vercel-labs/agent-skills --skill web-design-guidelines` | 4, 6 (render gate) |
| remotion (official Remotion skill) | remotion-dev (confirm exact repo via `npx skills find remotion --owner remotion-dev`) | per find result | 2, 5 (motion assets) |
| gstack (`/design-consultation`, `/design-shotgun`, `/design-html`, `/plan-design-review`, `/design-review`, `/qa`) | garrytan/gstack | per gstack README (installs to `~/.claude/skills/gstack/`) | 2, 4, 5, 6 |

Every companion is optional; the reference files contain condensed versions of the load-bearing rules.

### gstack integration notes

When gstack is installed, use it at these seams; otherwise skip without substituting anything:

- **Phase 2:** offer `/plan-design-review` on the approved page spec; its inline mockups catch structural problems before copy is written.
- **Phase 4:** if `DESIGN.md` exists for the project (output of `/design-consultation`), read it and treat it as the property's token source; do not invent a competing theme. If no theme exists yet and the user is undecided on direction, offer `/design-shotgun` to generate variants; the approved variant becomes the token set. Shotgun approvals also feed gstack's per-project taste profile, which improves future variants; mention this once.
- **Phase 5:** `/design-html` is an accepted build path (it produces fluid, resize-safe HTML). Page-foundry's build requirements (semantic HTML, mobile-first, performance budget) still apply to its output.
- **Phase 6:** offer `/design-review` and `/qa` as additions to the gates, not replacements.

Division of authority: gstack owns visual exploration and engineering review; page-foundry's conversion, voice, and integrity gates remain authoritative for marketing pages and are never waived by a passing gstack review.

## Phase 0: Intake

Goal: one durable context file per product. Everything downstream reads it.

1. Look for an existing context file at `.agents/product-marketing.md` or `.claude/product-marketing.md` (per product, or in the product's repo), and for `foundry-log.md` from prior runs. Read both if found. The log's `open items` and `learnings` are binding inputs (see the log format in Phase 6), not background reading: restate them at the top of this run's plan so the user sees they carried forward.
2. If absent, draft the brief from every available source first (attached PRD or spec, the conversation, the repo README, any existing site), then interview the user with `assets/brief-template.md` for only what those sources rarely contain: the buyer's verbatim language, entry states per segment, traffic source, the proof inventory, and claims that cannot be made. One round of questions. A PRD never substitutes for the brief; it feeds it.
3. Write the completed brief to `.agents/product-marketing.md` in the product's project directory (or alongside the page output if there is no repo).

Do not proceed on a guessed brief. A page built on an assumed audience or an assumed offer is rework, not progress.

## Phase 1: Message architecture

Goal: positioning and message hierarchy, before any page structure exists.

From the brief, produce a short message architecture document (under a page):

- One-sentence positioning: for WHO, PRODUCT is the WHAT that delivers OUTCOME, unlike ALTERNATIVE.
- Message hierarchy: the single most important claim, then 3 to 5 supporting claims in priority order. Each claim must be specific and checkable: concrete enough that a reader could prove it wrong. "Manage everything in one place" is neither.
- Objection map: the top 3 to 5 reasons this exact buyer says no, each paired with the proof or copy move that answers it. Include, per segment, the "this doesn't apply to me" objection: the reason a qualified buyer in a GOOD starting position concludes the product isn't for them.
- Proof inventory: every real testimonial, metric, named user, star count, certification, or credential available. Mark anything missing as `[TK: description]`. Never fabricate proof; see Integrity rules.

If customer-research and marketing-psychology are installed, apply them here. Either way, write claims in the buyer's language, not the builder's.

## Phase 2: Page spec

Goal: a section-by-section blueprint, with conversion rules applied before a word of final copy is written.

1. **Pick the archetype.** Read the archetype mapper at the top of `references/archetypes.md`. Current archetypes: `oss-project`, `saas-homepage`, `campaign-landing`, `mobile-app`, `course-sales`, `membership-community`, `newsletter-capture`, `personal-home`. If the page maps cleanly, follow that spec exactly. If it straddles two, use the mapper's composition rules. If nothing fits, build a custom spec from the shared rules, and tell the user that is what is happening.
2. Read `references/conversion-rules.md` and apply the hard rules: 5-second hero test, single primary CTA, headline budget, proof adjacency, message match, mobile-first ordering.
3. Output the spec as a numbered section list, each with: purpose, the claim it carries (from Phase 1), the proof element placed beside it, the CTA treatment if any, and any motion asset (hero demo clip, animation) with its justification. Motion is a cost in weight and attention; it must earn its slot, either by user request or because showing the product moving is the claim.

Get user sign-off on the spec before writing copy. If gstack is present, this is the moment to offer `/plan-design-review`.

## Phase 3: Copy

Goal: full page copy, in the owner's voice, passing the voice scan.

1. Read `references/voice.md` first. If its config block still says `owner: default`, or the user asks to set up or change the voice, run the Voice wizard (below) before writing.
2. Headline first: draft at least 6 candidates, score each against the budget, message match, and specificity, then present the top 3 with one line of reasoning each and pick (ask only in interactive runs). Then write the rest section by section against the spec. Use the copywriting skill if installed.
3. Run `python3 scripts/voice_scan.py <draft files>`. The script reads its rules from `references/voice.md`, so wizard changes take effect immediately. Fix every FAIL; review every WARN. Zero FAILs is the bar.
4. One editing pass that only cuts. Every sentence survives the question: what does the reader lose if this dies? If nothing, it dies.
5. Red-team read: adopt one skeptical reader per segment x entry state from the brief and walk the draft as each of them. Every reader must reach the CTA; a qualified reader concluding "not for me" is a defect (conversion rule 10). Fix bounce points now; the same check re-runs at the gates.

### Voice wizard

Run when: the user says anything like "set up my voice", "update the voice", "this is going to someone else"; or on first use while `owner: default`. The wizard edits `references/voice.md` in place so the whole skill, including the scanner, follows the new register. (If the installed skill directory is read-only, copy the skill to a writable location first and tell the user.)

1. Show the current config in one screen: owner, register summary, punctuation rules, top of the banned list.
2. Interview, briefly: Who is the owner and audience? Three adjectives for how it should sound, three for how it must never sound? Punctuation positions (em dashes, exclamation points, sentence case)? Words or phrases they personally ban? Words on the current banned list they actually use and want removed? Two or three sentences of their real writing to calibrate against.
3. Rewrite the Register and Punctuation sections in their terms, and edit the machine-readable blocks (`scan:banned-phrases`, `scan:judgment-words`, `voice-config`) to match. Keep the AI-flagged vocabulary list intact unless they explicitly remove entries; that list protects everyone.
4. Verify: run `voice_scan.py` against a sample paragraph of their writing; it should pass. Show them the diff of voice.md and confirm.

## Phase 4: Design direction

Goal: a committed aesthetic and a token set, chosen for this property, before any markup.

1. Read `references/design-direction.md` for per-property direction guidance and the anti-slop list. If web-design-guidelines is installed, load its rules alongside: on accessibility, typography, imagery, and interaction mechanics it is authoritative; on marketing-page structure, conversion, and anti-slop calls, this skill wins.
2. Token source priority: existing brand assets from the brief, then gstack `DESIGN.md`, then theme-factory theme, then a new token plan via the frontend-design skill process (palette as named hex values, display plus body pairing, layout concept, one signature element, critique against the generic default before building). Offer `/design-shotgun` when direction is genuinely undecided.
3. **Explore mode:** produce the stated number of variants (default 3), each a complete committed direction (token plan + static hero mockup), deliberately contrasting along real axes (light/dark, editorial/brutalist, type-led/visual-led), never three flavors of the same idea. Present them, wait for the pick, then proceed as build mode with the winner. With gstack, `/design-shotgun` replaces this step and its comparison board handles the pick.
4. Persist the winning tokens (theme-factory, or `theme.css` with custom properties). One property, one theme, many pages.

## Phase 5: Build (build mode) or Handoff (handoff mode)

**Build mode.** Default to static HTML and CSS in a single file plus `theme.css`. Vanilla JS only for small interactions. Reach for web-artifacts-builder or gstack `/design-html` when the page needs more. Requirements regardless of stack:

- Semantic HTML: one `h1`, ordered headings, `nav`/`main`/`section`/`footer` landmarks, real `button` and `a` elements.
- Mobile-first CSS; fully usable at 390px before desktop styling.
- System fonts or at most two self-hosted files, `font-display: swap`, preloaded.
- Images sized, compressed, lazy-loaded below the fold, real alt text.
- No render-blocking third-party scripts; analytics deferred.
- If the archetype's spec includes a post-conversion page (newsletter-capture's thank-you page does), build it in the same pass; the conversion is not done at the form.
- Motion assets: when the spec includes one and the Remotion skill is installed, produce the clip through it (product loop demos, hero animations, explainer clips). Without Remotion, mark the slot `[TK: motion asset]` and list it in open items rather than substituting a low-grade animation. Any motion ships muted, respects `prefers-reduced-motion`, and has a static fallback frame.
- Output: `pages/<product>/index.html`, `theme.css`, `assets/`, plus `llms.txt` and schema from Phase 6.

**Handoff mode.** Read `references/handoff.md` and produce the package exactly as specified there: a paste-ready master prompt, final copy marked verbatim, the page spec, the design direction with tokens and asset list, and the acceptance criteria derived from the gates. Run the pre-handoff gates listed there before delivering the package.

## Phase 6: Ship gates

Read `references/ship-gates.md` and run the full checklist (in handoff mode, run the pre-handoff subset now and the rest when the built asset comes back). Summary: conversion audit with MECLABS score, voice scan at zero FAILs, WCAG 2.1 AA spot checks, performance budget, schema + llms.txt + meta, integrity. Use the cro skill and gstack `/design-review` + `/qa` here if installed.

Report results as a pass/fail table with the MECLABS score. A failed gate means fix and re-run, not ship with a caveat.

Close every run by appending a record to `foundry-log.md` beside the page output, in exactly this format so future runs can parse it:

```
### {YYYY-MM-DD} · {mode} · {archetype}
- headline: {shipped H1}
- meclabs: C={n} (M{n} V{n} I{n} F{n} A{n})
- gates: {pass/fail/N-A summary}
- companions: {active this run, with versions where known}
- open items: {unresolved, one per line}
- conversion data: {added later by the user; visits, signups, rate, source}
- learnings: {one line per lesson worth carrying forward}
```

The log is memory, not a receipt. Phase 0 reads it and treats two fields as binding inputs: unresolved `open items` become spec and gate checks for this run, and `learnings` adjust defaults (a headline pattern that converted poorly is not re-shipped; a section that produced signups is not cut without saying so). When `conversion data` exists, Phases 1 through 3 must state explicitly how it changed at least one decision, or state that it changed nothing and why. The `companions` field makes quality attributable: when two runs differ, check what was installed before blaming the pipeline.

## Integrity rules

These override everything else in this skill:

- Never invent testimonials, customer names, logos, star counts, download numbers, or statistics. If the proof inventory is thin, build the page around the proof that exists and tell the user what proof to go collect.
- Never make claims about security, privacy, or compliance that the brief does not substantiate.
- Honest urgency only. Deadlines, caps, and limited seats appear only when they are real.

## Scope notes

- A "homepage" for a product with an existing multi-page site is still one page; flag site-architecture work separately rather than silently expanding scope.
- Rewrites of existing pages enter at Phase 1 (re-derive the message architecture, diff against what the current page says). Do not polish sentences on top of a broken structure.
- New archetypes follow the format in `references/archetypes.md`; add them there.
