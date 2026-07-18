---
name: page-foundry
description: Produces high-converting homepages, landing pages, and sales pages written in your own voice, one brief in and one shipped page or design-handoff package out, with checks that keep the output from reading or looking AI-made. Use when someone wants to build, create, rewrite, review, or ship a page for a product, SaaS, web app, mobile app, open source project, course, community, or newsletter; asks to make a homepage, landing page, sales page, pricing page, or personal site; says their landing page is not converting or reads like AI wrote it; or mentions page-foundry, conversion copy, page CRO, or hero sections.
---

# Page Foundry

A foundry takes raw material through a fixed sequence of stations and rejects anything that fails inspection. This skill does the same for marketing pages: one product brief in, one deployable page (or one handoff package) out, with hard gates between stations. The point is repeatability across many products without the output converging on generic AI-page sludge or drifting from the owner's voice.

Run the pipeline in order. Each phase has an output the next phase consumes. Do not skip the gates; a page that fails a gate does not ship.

## When to use this skill

Reach for page-foundry when someone wants a real, high-performing web page, not just a block of HTML. Typical asks:

- "Build a landing page for my SaaS, app, or product."
- "Make a homepage for my open source project, startup, or course."
- "Write a sales page for my course, workshop, or membership."
- "I need a pricing page, a newsletter signup page, or a personal site."
- "My landing page is not converting," or "this page reads like AI wrote it."
- "Rewrite this page so it actually converts," or "review my homepage."
- "Give me a copy-and-design package I can hand to Claude Design or a designer."
- They mention conversion copy, CRO, hero sections, message match, or holding one voice across many product pages.

Not this skill: a throwaway HTML mockup with no conversion or voice requirement (a one-shot prompt is faster), or multi-page site architecture and content planning (page-foundry ships one page and flags the rest as separate work).

## Phase -1: Preflight

Run once at the start of every engagement.

Nothing installs, updates, or gets skipped silently.

1. **Detect, everywhere.** A companion counts as PRESENT if its skill name resolves anywhere below. Match on SKILL.md frontmatter `name`, accept plugin-namespaced forms (`marketing:copywriting` satisfies `copywriting`), and count symlinks. Sweep in this order:
   - Runtime inventories first: `npx skills list` (covers project and global) if the skills CLI responds; `claude plugin list` in Claude Code; the available-skills listing in claude.ai.
   - Filesystem: `~/.agents/skills/` (the skills CLI's canonical location), `~/.claude/skills/`, project `.claude/skills/` and `.agents/skills/`, `/mnt/skills/*` (public, examples, user, plugins), and Claude Code plugin directories under `~/.claude/plugins/`.
   - gstack is detected by its slash commands (`/design-shotgun` etc.), never by directory.
   The sweep must complete before any install or update command is even considered. Installing a companion that is already present anywhere is a defect. Cache the result for the session.
2. **Check freshness.** If the skills CLI is present, run `npx skills check` and note outdated companions. Plugin-installed companions update via `claude plugin marketplace update <marketplace>` then reinstalling the plugin. Outdated is a reportable gap like missing: report, offer, act only on approval; what declining means per tier is defined in step 3.
3. **Report and ask, once. This stop is mandatory.** Show one table: present / outdated / missing, each row carrying its tier from the companion tables below, with the exact install or update command per gap and one line on what this run loses without it. Ask a single question: install and update now, or proceed without? On approval, run the commands, then RE-RUN detection and confirm every name resolves before continuing. What declining means depends on the tier:
   - **Core companion missing: the run does not start.** There is no silent degrade to the reference files; the condensed rules are weaker summaries of mechanisms the real skills apply with deeper and more current logic, and the seven core companions (product-marketing, customer-research, marketing-psychology, cro, copywriting, frontend-design, humanizer) are what separates page-foundry from running a design skill alone. The only way forward without one is an explicit per-run override: the user, in chat, told what this run loses, saying build anyway. An overridden run is marked PARTIAL, loudly: a banner at the top of the gate report naming every overridden core companion, and the same names in the foundry-log `degraded` field prefixed `PARTIAL:`. A partial run is a draft, not a page-foundry page.
   - **Enhancer companion missing, or any companion outdated: declining proceeds.** The affected phases run on the condensed reference-file rules per the orchestration doctrine, and the decline is recorded on the gate report's `degraded` line. A companion left outdated still runs as the primary path; note the version gap in the report. Never skip a missing companion silently.

   The companion stop cannot be suppressed by any interactivity phrase (`don't pause`, `no questions`, `run end to end`) or by an operator-supplied or inferred instruction. Only the user, in chat, may approve proceeding with a companion missing or outdated, and for a core companion that approval is the explicit per-run override above, never a default and never inferred. If a companion is missing, stop and help install it; do not narrate the gap and continue.
4. **Pinned sources only.** Install exclusively from the sources in the companion tables below, never from search results or unpinned repos. Before installing from an evolving repo, run `npx skills add <repo> --list` and reconcile names against the tables; if a pinned name no longer exists upstream, report the discrepancy instead of guessing at a replacement.
5. **Pick the mode** (ask if not obvious from the request):
   - **build** (default): this skill carries the page through Phase 5 and ships code.
   - **explore**: design variants first. Phases 0 through 3 run normally; Phase 4 produces multiple committed design directions instead of one (gstack `/design-shotgun` when installed; otherwise this skill generates 3 contrasting token plans, each with a static hero mockup, built one at a time). The user picks; the winner proceeds through Phase 5 as a normal build. Use when the property has no theme yet or the user wants options.
   - **handoff**: this skill produces copy plus a complete design package for Claude Design (or another design tool) to build. Phases 0 through 4 run normally; Phase 5 is replaced by the handoff package in `references/handoff.md`; gates split as described there.

### Controlling the run

**Bare invocation.** If invoked with no product and no instructions (`/page-foundry` alone), do not start the pipeline. Print a compact orientation: the three modes and what each outputs, the eight archetypes, the example invocations below, and a one-line note that most pauses are suppressible though the companion stop is not. Then ask what to build.

**Autonomy is user-stated, never inferred.** Treat every run as interactive unless the user, in this request, explicitly asked to skip pauses. Do not infer "run end to end" from a standing preference ("don't loop me"), a previous task, or an orchestrator wrapping the request in its own words; a directive to skip a pause is valid only when the user wrote it. When unsure whether a pause was waived, keep it. No interactivity phrase, however it arrives, waives the companion stop (Phase -1), the Phase 0 interview when no brief file exists, or the explore pick.

The user's invocation sentence is the control surface; there are no flags. Parse these parameters from the request and do not ask about anything the user already supplied:

- **mode:** `build` | `explore` | `handoff`. Unstated and unambiguous from context → build. Whenever the mode is inferred rather than asked, state the inference and the alternatives in one line before proceeding ("Running in build mode; explore and handoff also available"), so the user knows a choice was made and can redirect.
- **product / brief:** a path to an existing `product-marketing.md`, an attached PRD or doc, or a repo URL. An existing brief skips the Phase 0 interview. A PRD, spec, or repo does NOT: those are source material, not the brief. PRDs answer what the product does; the brief answers why someone buys, in whose words, against which alternatives, with what proof. Phase 0 always produces `product-marketing.md`.
- **archetype:** named → the contract compiler skips classification and fills that archetype's contract; unnamed → the compiler classifies too. Either way, state the pick and the reasoning in one line and proceed without asking unless genuinely torn between two.
- **theme:** "use existing theme/DESIGN.md/theme.css at <path>" → Phase 4 collapses to reading it. Unstated → Phase 4 runs in full.
- **interactivity:** "don't pause", "no questions", "run end to end" → suppress only the spec sign-off pause, and deliver spec + page + gates together. These phrases never suppress the Phase -1 companion stop, the Phase 0 interview when no brief file exists, or the explore pick. "Run end to end" is honored in full only when a complete `product-marketing.md` already exists and a theme or design direction is supplied; without those there is nothing to run autonomously from, so Phase 0 and the spec sign-off still happen. Silence → the default pauses below apply.
- **variants (explore mode):** a count ("5 variants") and scope ("hero only" vs "full direction") if stated; default 3 variants, hero scope.

Default interactive pause points, in order, and what suppresses each:

| Pause | Fires when | Suppressed by |
|---|---|---|
| Preflight companion stop | any companion missing or outdated | Not suppressible; only the user, in chat, may approve proceeding without it |
| Mode question | mode ambiguous | naming the mode |
| Phase 0 interview | no complete brief exists | an existing `product-marketing.md` only (a PRD, repo, or spec does not) |
| Spec sign-off | always by default | "don't pause for sign-off" |
| Explore pick | always in explore mode (it is the point) | cannot be suppressed |
| Shotgun offer | gstack present + no theme + direction undecided | naming a theme or direction |
| Voice wizard | `owner: default` or user asks | configured voice.md |

Example invocations:

- Full page, no questions: "page-foundry, build mode, saas-homepage for Acme; brief at .agents/product-marketing.md, use theme.css in repo root, don't pause, show spec + page + gate report together."
- Designs to choose from: "page-foundry, explore mode for Acme, 4 variants, full direction; brief attached; stop at the comparison."
- Claude Design package: "page-foundry, handoff mode for Acme; brief attached; campaign-landing; package only, I'll build in Claude Design."

### Companion skills

Two tiers. **Core** companions are required: they do the positioning, research, persuasion, conversion, copy, design, and de-patterning work the page depends on, and preflight stops until they are installed (step 3 above). **Enhancer** companions strengthen specific seams and degrade gracefully to reference-file fallbacks when absent.

Every row is an invocation contract, modeled on the humanizer contract in Phase 3: INPUT is what the companion is handed, OUTPUT is the artifact it must leave, CONSUMER is who reads that artifact, EVIDENCE is the gate-report line that proves the invocation was real. An invocation that leaves no artifact and fills no evidence line did not happen, whatever the transcript says.

Install commands by source: coreyhaines31/marketingskills companions via `npx skills add coreyhaines31/marketingskills --skill <name>`; anthropics/skills via `npx skills add anthropics/skills --skill <name>`; web-design-guidelines via `npx skills add vercel-labs/agent-skills --skill web-design-guidelines`; humanizer via `git clone https://github.com/blader/humanizer.git ~/.claude/skills/humanizer`; remotion from the repo `npx skills find remotion --owner remotion-dev` returns; gstack per its README (installs to `~/.claude/skills/gstack/`).

#### Core tier (required)

| Skill | Source | Phase | INPUT | OUTPUT | CONSUMER | EVIDENCE |
|---|---|---|---|---|---|---|
| product-marketing | coreyhaines31/marketingskills | 0 | product, repo README, PRD or spec, existing site, the conversation | `.agents/product-marketing.md`: positioning, ICP, differentiation, competitive frame, proof inventory | every later phase; the Phase 0 interview asks only what it could not infer | `product-marketing:` invoked, brief written, fields the interview still had to supply |
| customer-research | coreyhaines31/marketingskills | 1 | every VOC source the brief points to: reviews, transcripts, support tickets, competitor reviews, forums | `voc.md`: verbatim buyer quotes, every quote carrying its source | Phase 1 writes the message hierarchy and objection map in these words; Gate 2 traces quotes to the file; Gate 8 checks no paraphrase poses as verbatim | `customer-research:` invoked, voc.md written, quote count with sources |
| marketing-psychology | coreyhaines31/marketingskills | 1 | the brief plus `voc.md` | `persuasion-map.md`: the chosen levers and where each lands (claim order, objection answers, CTA framing) | Phase 2 claim ordering; Phase 3 copy applies the levers | `marketing-psychology:` invoked, map written, levers applied and where |
| cro | coreyhaines31/marketingskills | 2, Gate 1 | compiled contract, message architecture, candidate skeletons | skeleton pre-reads and spec structure; at Gate 1, `conversion-audit.md` with the MECLABS score | Phase 2 spec; Gate 1 verdict | `cro:` invoked, audit written, spec changes applied |
| copywriting | coreyhaines31/marketingskills | 3 | page spec, message architecture, `voice.md`, `voc.md` | full draft copy, section by section, which the voice chain refines into `copy-approved.md` | Phase 3 voice chain; Phase 5 builds it verbatim | `copywriting:` invoked, sections drafted, headline candidates scored |
| frontend-design | anthropics/skills | 4 | brand assets from the brief, the compiled contract, the page spec, any existing theme or `DESIGN.md` | the token plan: named hex palette, type pairing, layout concept, signature element, critique against the generic default; persisted as `theme.css` | Phase 4 shape picks; Phase 5 build; handoff `03-design-direction` | `frontend-design:` invoked, tokens persisted, alternatives considered |
| humanizer | blader/humanizer (GitHub) | 3, Gate 2 | final copy, after the word scan and the pattern pass | the rewrites that survive meaning arbitration, applied to the copy | Gate 2; `copy-approved.md` snapshots the result | `humanizer:` ran once, what it changed, accepted WARNs each with a reason |

#### Enhancer tier (graceful fallback)

| Skill | Source | Phase | INPUT | OUTPUT | CONSUMER | EVIDENCE |
|---|---|---|---|---|---|---|
| copy-editing | coreyhaines31/marketingskills | 3 | copywriting's draft | the tightened draft plus a changelog of what was cut and what was tightened | Phase 3 step 5 re-scan; the gate report | `copy-editing:` the changelog summary |
| pricing, competitors, aso | coreyhaines31/marketingskills | 2 (archetype-dependent) | the section's spec entry plus the brief fields it needs | that section's structure and copy input; pricing also feeds Gate 6's `/pricing.md` check on pricing pages | Phase 2 spec, Phase 3 copy | own line each when its section is in scope; `degraded` when needed and missing |
| launch, lead-magnets, popups, signup | coreyhaines31/marketingskills | 2, 3 (archetype-dependent: launch and campaign pages, gated offers, exit or scroll popups when in scope, signup-flow copy) | the section's spec entry plus the brief fields it needs | that section's structure and copy input | Phase 2 spec, Phase 3 copy | own line each when its section is in scope; `degraded` when needed and missing |
| analytics | coreyhaines31/marketingskills | Gate 7 | the conversion goal and the CTA set | the measurement plan: conversion event, UTM convention | Gate 7; the foundry-log `conversion data` field closes the loop next run | `analytics:` invoked, plan written |
| ai-seo | coreyhaines31/marketingskills | Gate 6 | the rendered page and copy | AI-discovery results and `llms.txt` | Gate 6 | `ai-seo:` invoked, checks run |
| schema | coreyhaines31/marketingskills | Gate 6 | page type plus brief facts | the JSON-LD block | Gate 6; embedded in the page | `schema:` invoked, block written |
| web-design-guidelines | vercel-labs/agent-skills | 4, Gates 3/5 | the design direction (Phase 4), the built page (gates) | rulings on accessibility, typography, imagery, interaction | Phase 4; Gates 3 and 5 | `web-design-guidelines:` whether the live ruleset ran or the frozen fallback did |
| web-artifacts-builder | anthropics/skills | 5 | `copy-approved.md` verbatim, the spec, the tokens | the built page | Phase 5 output; Gate 2 diffs its rendered text against the snapshot | the report names the build path; Gate 2's verbatim diff covers its output |
| remotion (official Remotion skill) | remotion-dev | 2, 5 (motion assets) | the spec's motion slot and its justification | the clip: muted, `prefers-reduced-motion` respected, static fallback frame | Phase 5 build | `remotion:` clip produced, or `[TK: motion asset]` in open items |
| gstack (`/design-consultation`, `/design-shotgun`, `/design-html`, `/plan-design-review`, `/design-review`, `/qa`) | garrytan/gstack | 2, 4, 5, 6 | per seam, per the integration notes below | `DESIGN.md` tokens, variant boards, built HTML, review findings | per seam, per the integration notes below | `gstack:` which commands ran; skipping without substituting is the documented default |

### The run artifact directory

Every run works out of one directory: `.agents/foundry/<product>/`, where `<product>` is the product's kebab-case name. When the product has its own repo, the directory lives in that repo; when several products share a workspace, each gets its own directory under the workspace's `.agents/foundry/`. Phases hand work to each other through files in this directory, never through what remains in context: an upstream decision a later phase depends on is read from the file that recorded it. That is what makes a run diffable and resumable. An interrupted run picks up from the last artifact on disk, and when two runs of the same product differ, the directories show where.

The layout, with the phase that writes each entry:

```
.agents/foundry/<product>/
├── foundry-log.md            per-property memory; Phase 6 appends, Phases 0 and 2 read
├── voc.md                    Phase 1, written by customer-research
├── persuasion-map.md         Phase 1, written by marketing-psychology
├── message-architecture.md   Phase 1
├── page-spec.md              Phase 2: filled contract, candidate skeletons with pre-reads, section spec
├── conversion-audit.md       Gate 1, written by cro
├── tokens/                   Phase 4: token plans; explore mode writes one per variant
└── copy/                     Phase 3: drafts plus copy-approved.md, the snapshot Gate 2 diffs against
```

Bare artifact names elsewhere in this skill (`voc.md`, `page-spec.md`, the OUTPUT column of the companion tables) resolve inside this directory. The brief is the one deliberate exception: `.agents/product-marketing.md` stays at the repo's `.agents/` root, because the marketingskills companions read it from that conventional path; a product with no repo of its own keeps its brief inside its foundry directory instead. Deployables are the other boundary: `pages/<product>/` holds what ships (`index.html`, `theme.css`, `assets/`, `llms.txt`), the foundry directory holds how it got there, and no file lands in both.

### Orchestration doctrine (how companions are used)

page-foundry is an orchestrator. Its reference files are a fallback, not the plan. In every phase that names a companion skill, follow this without exception:

1. **Invoke the companion as the primary path.** Actually call the skill, hand it the phase's inputs (the brief, the spec, the copy draft, the tokens, whatever that phase works on), and use its output as the phase's work product. When a companion is available you do not read its reference file and do the work yourself; the companion is more capable than the condensed rules, and skipping it is the main reason two runs of this skill differ in quality.
2. **Fall back only when the companion cannot be invoked.** For an enhancer companion that means declined at the Phase -1 stop, not installed, or erroring mid-run: use the condensed rules in the phase's named reference file. A core companion has no quiet fallback: reaching the reference file at all requires the explicit per-run override from Phase -1, or a mid-run error that one reinstall and retry did not fix, and either way the run is marked PARTIAL as Phase -1 describes.
3. **Flag every fallback.** Any phase that runs on a reference file because its companion was missing or declined is a DEGRADED phase. Say so in that phase ("running Phase N without <companion>; using the built-in condensed rules, which are weaker"), and record it on the gate report's `degraded` line. A degraded core phase also makes the whole run PARTIAL, and the user is told which skill would have made it better.

The reference files are the floor, so the skill still produces something when a companion is absent. The companion, when present, is the standard.

### gstack integration notes

When gstack is installed, use it at these seams; otherwise skip without substituting anything:

- **Phase 2:** offer `/plan-design-review` on the approved page spec; its inline mockups catch structural problems before copy is written.
- **Phase 4:** if `DESIGN.md` exists for the project (output of `/design-consultation`), read it and treat it as the property's token source; do not invent a competing theme. If no theme exists yet and the user is undecided on direction, offer `/design-shotgun` to generate variants; the approved variant becomes the token set. Shotgun approvals also feed gstack's per-project taste profile, which improves future variants; mention this once.
- **Phase 5:** `/design-html` is an accepted build path (it produces fluid, resize-safe HTML). Page-foundry's build requirements (semantic HTML, mobile-first, performance budget) still apply to its output.
- **Phase 6:** offer `/design-review` and `/qa` as additions to the gates, not replacements.

Division of authority: gstack owns visual exploration and engineering review; page-foundry's conversion, voice, and integrity gates remain authoritative for marketing pages and are never waived by a passing gstack review.

## Phase 0: Intake

Goal: one durable context file per product. Everything downstream reads it.

Artifacts: reads `foundry-log.md` and any v2.x state left in old locations; writes the brief, and creates the run artifact directory on a product's first run.

1. Open the run artifact directory `.agents/foundry/<product>/`, creating it if this is the product's first run. Look for the brief at `.agents/product-marketing.md` or `.claude/product-marketing.md` in the product's repo (for a product with no repo, inside the foundry directory), and for `foundry-log.md` in the foundry directory. Read both if found. The log's `open items` and `learnings` are binding inputs (see the log format in Phase 6), not background reading: restate them at the top of this run's plan so the user sees they carried forward.
2. **Adopt v2.x state.** Versions before 3.0 left run artifacts beside the page output, in the page directory or the workspace root: `foundry-log.md`, `copy-approved.md`, saved page specs, token plans, sometimes the brief itself. Check those locations; move anything found into the foundry directory (`copy-approved.md` into `copy/`, a saved spec to `page-spec.md`, token plans into `tokens/`, the log and the brief to their step 1 homes) and tell the user what moved. When a log exists in both places, append the old entries the new file lacks, oldest first, then delete the old file: run records are history, and adoption drops none of it. This fires once per product; when there is nothing to adopt, say nothing and continue.
3. If absent, build the brief. **Invoke the product-marketing skill as the primary path**: hand it the product, the repo README, any PRD or spec, the existing site, and the conversation, and let it produce the structured `.agents/product-marketing.md` (positioning, ICP, differentiation, competitive frame, proof inventory). Then interview the user for only what it cannot infer: the buyer's verbatim language, entry states per segment, traffic source, the real proof inventory, and claims that cannot be made. One round of questions; a PRD feeds the brief, it never replaces it. If product-marketing is not available, draft the brief yourself from `assets/brief-template.md`, tell the user Phase 0 ran without it, and mark the phase degraded.
4. Write the completed brief to `.agents/product-marketing.md` in the product's project directory (or into the product's foundry directory when there is no repo).

Do not proceed on a guessed brief. A page built on an assumed audience or an assumed offer is rework, not progress.

## Phase 1: Message architecture

Goal: positioning and message hierarchy, before any page structure exists.

Artifacts: reads the brief and every VOC source it points to; writes `voc.md`, `persuasion-map.md`, `message-architecture.md`.

From the brief, produce a short message architecture document (under a page), written to `message-architecture.md`:

- One-sentence positioning: for WHO, PRODUCT is the WHAT that delivers OUTCOME, unlike ALTERNATIVE.
- Message hierarchy: the single most important claim, then 3 to 5 supporting claims in priority order. Each claim must be specific and checkable: concrete enough that a reader could prove it wrong. "Manage everything in one place" is neither.
- Objection map: the top 3 to 5 reasons this exact buyer says no, each paired with the proof or copy move that answers it. Include, per segment, the "this doesn't apply to me" objection: the reason a qualified buyer in a GOOD starting position concludes the product isn't for them.
- Proof inventory: every real testimonial, metric, named user, star count, certification, or credential available. Mark anything missing as `[TK: description]`. Never fabricate proof; see Integrity rules.

**Invoke customer-research** on every input the brief points to (reviews, interview transcripts, support tickets, competitor reviews, Reddit or forum sources, any voice-of-customer material) to surface the buyer's verbatim language and the real objections; its quotes land in `voc.md`, each carrying its source, and the message hierarchy and objection map are written in the words of that file, not the builder's. **Invoke marketing-psychology** to choose the persuasion levers that fit this buyer and offer (anchoring, loss aversion, social proof placement, commitment and consistency); `persuasion-map.md` records each chosen lever and where it lands (claim order, objection answers, CTA framing), and Phases 2 and 3 apply the levers by reading it. If either is missing, derive the message architecture from the brief alone, mark Phase 1 degraded, and tell the user the objection map and buyer language are weaker without customer-research and the persuasion sequencing is weaker without marketing-psychology.

`voc.md` keeps what buyers said apart from what the researcher concluded, because only the first may be quoted. In exactly this format:

```
## Verbatim
> The quote, character for character as the buyer wrote or said it.
— {source} · {speaker, as far as known} · {date if known}

## Paraphrase
- {condensed or synthesized observation} ({source})

## Recurring language
- "{buyer word or phrase}" — {which sources it keeps appearing in}
```

A source is a pointer the owner can open and check: the review URL or ID, the transcript file and line, the ticket number, the forum permalink. "Customer interviews" or "G2" names a genre, not a source, and does not qualify; a quote whose source cannot be produced goes under Paraphrase until it can. Page copy quotes only from the Verbatim section or the brief's proof inventory, and a Paraphrase entry never appears inside quotation marks or testimonial styling, however close the wording. This split is what makes quote integrity mechanical downstream: Gate 2 searches every page quote against Verbatim, and Gate 8 fails any quote that matches a Paraphrase entry or matches nothing.

## Phase 2: Page spec

Goal: a section-by-section blueprint, with conversion rules applied before a word of final copy is written.

Artifacts: reads the brief, `message-architecture.md`, `persuasion-map.md`, `foundry-log.md`; writes `page-spec.md`.

1. **Compile the contract.** Run the contract compiler at the top of `references/archetypes.md`. Current archetypes: `oss-project`, `saas-homepage`, `campaign-landing`, `mobile-app`, `course-sales`, `membership-community`, `newsletter-capture`, `personal-home`. The compiler answers five questions from the brief (conversion, relationship, traffic source, dominant awareness state, decision weight), reads `foundry-log.md` so per-property conversion data moves its defaults, and outputs a filled contract: goal, buyer entry states, awareness-conditional jobs kept or struck with reasoning, proof requirements, CTA policy, ordering constraints, and a recommended setting per composition axis (narrative shape, hero form, proof strategy, density) with one line of reasoning each. Section order comes from the Phase 1 objection map, inside the contract's ordering constraints, and the spec records which order the map produced and why. A page straddling two archetypes gets a merged contract per the compiler's straddling rules. If nothing fits, fill the six contract blocks by hand from the shared constraints and `references/conversion-rules.md`, and tell the user that is what is happening.
2. **Generate candidate skeletons.** From the filled contract, produce 2 or 3 candidate skeletons: each one a job order plus axis settings, every one satisfying the full ordering-constraint set. Candidates differ structurally, on a narrative shape, a proof strategy, or a genuinely different legal order from the objection map, never cosmetically; three shufflings of one skeleton is a defect. When the constraints and the objection map leave only one credible order, present that one and say why, instead of inventing variety. Give each candidate a quick MECLABS pre-read (rubric in `references/conversion-rules.md`; when cro is present it scores the pre-read): one line per candidate on where it wins and where it leaks, and a recommendation. Draft the spec on the recommended skeleton; the pick lands at the spec sign-off pause below, where the user sees the alternatives and may choose one. When sign-off is suppressed, the recommendation proceeds and the spec records the alternatives considered.
3. **Invoke the cro skill as the primary path**: hand it the compiled contract, the message architecture, and the recommended skeleton, and use its output to structure the spec for conversion (5-second hero, single primary CTA, headline budget, proof adjacency, message match, mobile-first ordering, objection handling). `references/conversion-rules.md` is the fallback when cro is absent; using it marks Phase 2 degraded. Also invoke the archetype-specific companions on the sections that call for them: **pricing** for a pricing block, **competitors** for a comparison or alternative page, **aso** for a mobile-app page's store alignment, **launch** for a launch or campaign page, and **lead-magnets / popups / signup** where the spec includes those. Any that is needed but missing is noted as degraded.
4. Output the spec as a numbered section list in the computed order, opening with the four axis settings and their one-line reasons, each section with: the contract job it fulfills, purpose, the claim it carries (from Phase 1), the proof element placed beside it, the CTA treatment if any, and any motion asset (hero demo clip, animation) with its justification. Motion is a cost in weight and attention; it must earn its slot, either by user request or because showing the product moving is the claim. Write all of it to `page-spec.md`: the filled contract, the candidate skeletons with their pre-reads, and the section spec. The gates audit that file and Phase 3 writes copy against it; a spec that lives only in the transcript is not a spec.

Get user sign-off on the spec before writing copy; the skeleton pick lands here, so present the candidates with their pre-reads alongside the spec, lead with the recommendation, and rebuild the spec on the alternative if the user picks one. When gstack is present, invoke `/plan-design-review` on the spec here; its inline mockups catch structural problems before copy is written.

## Phase 3: Copy

Goal: full page copy, in the owner's voice, passing the voice scan.

Artifacts: reads `page-spec.md`, `message-architecture.md`, `persuasion-map.md`, `voc.md`, `references/voice.md`; writes drafts to `copy/` and the approved snapshot to `copy/copy-approved.md`.

1. Read `references/voice.md` first. If its config block still says `owner: default`, or the user asks to set up or change the voice, run the Voice wizard (below) before writing.
2. Headline first: draft at least 6 candidates, score each against the budget, message match, and specificity, then present the top 3 with one line of reasoning each and pick (ask only in interactive runs). **Invoke the copywriting skill to write the body**, section by section against the spec and the message architecture; it does the writing. Then **invoke copy-editing** to tighten and cut what it produced. The cutting pass belongs to copy-editing, not to a later step: every sentence faces the question of what the reader loses if it dies, and a sentence that costs the reader nothing dies. Copy-editing returns a changelog of what it cut and what it tightened, and that changelog goes on the gate report's `copy-editing` line. For archetype-specific copy, invoke the matching companion on that section (**signup** for a registration flow, **popups** for an exit or scroll offer, **launch** for a launch page, **lead-magnets** for a gated offer). If copywriting is absent, write the copy yourself against the spec and `references/voice.md`, cut by the same question, and mark Phase 3 degraded.
3. Red-team read: adopt one skeptical reader per segment x entry state from the brief and walk the draft as each of them. Every reader must reach the CTA; a qualified reader concluding "not for me" is a defect (conversion rule 10). Fix bounce points now, while the copy is still upstream of the voice pass; the same check re-runs at the gates.
4. Run `python3 scripts/voice_scan.py <draft files>`. The script reads its rules from `references/voice.md`, so wizard changes take effect immediately. Fix every FAIL; zero FAILs is the bar.
   Then the **pattern pass** (do not skip it): the word scan catches vocabulary, not grammar, and the most common reason a page passes the word scan yet still reads as AI is a language pattern. Work through every `AI language pattern` WARN the scanner flags (negative parallelism "not X, it's Y"; copula avoidance "serves as"; tailing negation "no X, no Y"; authority tropes; significance inflation; three-verb-clause runs "runs X, gates Y, and hands Z"; parallel-list uniformity in prose): rewrite it, or accept it with a recorded reason on the gate report's `humanizer` line. The patterns are deliberately WARN, not FAIL, because some flagged sentences are right as written.
   Then **invoke the humanizer skill on the final copy. This is required, not optional.** The scanner catches lexical and single-sentence tells, but structural uniformity spread across separate elements (a roster where every item opens the same way, "Finds... / Pulls... / Structures...") is beyond regex; only a semantic read catches it. The humanizer proposes; meaning arbitrates. Every rewrite it proposes must preserve the claim and the register, with `references/voice.md` as the arbiter; a rewrite that changes what a sentence claims is a defect, not a fix, and is rejected. Apply the rewrites that survive arbitration, record on the gate report's `humanizer` line that the pass ran and what it changed, and stop there: one pass, not iterate-to-zero-tells. Over-processing copy to chase zero tells is the failure mode this guardrail exists to prevent. A scanner PASS without the humanizer pass is an incomplete Gate 2. A page is not voice-clean until both the words and the patterns are clean, by the scanner and by the humanizer.
5. Final copy means final. Any edit that touches copy after the pattern pass and the humanizer (a red-team fix from the gates, a cut during build, a spec-driven rewrite) re-triggers the scan and the humanizer on the edited sections before Gate 2 reports. The last edit precedes the last scan, or Gate 2 has not run.
6. Snapshot the approved copy. Once the copy has passed the scan, the pattern pass, and the humanizer, write it verbatim, in page order, to `copy/copy-approved.md` in the run artifact directory. In handoff mode this same content ships as the package's `01-copy.md`. The snapshot is the reference Gate 2 diffs the built page against, so it changes only when an edit goes back through step 5; editing the snapshot to match a drifted build defeats the check and is a defect.

### Voice wizard

Run when: the user says anything like "set up my voice", "update the voice", "this is going to someone else"; or on first use while `owner: default`. The wizard edits `references/voice.md` in place so the whole skill, including the scanner, follows the new register. (If the installed skill directory is read-only, copy the skill to a writable location first and tell the user.)

1. Show the current config in one screen: owner, register summary, punctuation rules, top of the banned list.
2. Interview, briefly: Who is the owner and audience? Three adjectives for how it should sound, three for how it must never sound? Punctuation positions (em dashes, exclamation points, sentence case)? Words or phrases they personally ban? Words on the current banned list they actually use and want removed? Two or three sentences of their real writing to calibrate against.
3. Rewrite the Register and Punctuation sections in their terms, and edit the machine-readable blocks (`scan:banned-phrases`, `scan:judgment-words`, `voice-config`) to match. Keep the AI-flagged vocabulary list intact unless they explicitly remove entries; that list protects everyone.
4. Verify: run `voice_scan.py` against a sample paragraph of their writing; it should pass. Show them the diff of voice.md and confirm.

## Phase 4: Design direction

Goal: a committed aesthetic and a token set, chosen for this property, before any markup.

Artifacts: reads the brief's brand assets, `page-spec.md`, and any existing theme or `DESIGN.md`; writes the token plan to `tokens/` and the winning tokens to `theme.css` in `pages/<product>/`, where the page ships it.

1. **Invoke web-design-guidelines** and treat it as authoritative on accessibility, typography, imagery, and interaction mechanics. `references/design-direction.md` carries the marketing-page and anti-slop layer (this skill wins on structure, conversion, and anti-slop calls) and is the fallback for the mechanics when web-design-guidelines is absent, which marks the design degraded.
2. **Invoke the frontend-design skill to produce the token plan** (palette as named hex values, display plus body pairing, layout concept, one signature element, and a critique against the generic default before building); use its output as the design direction. Token source priority when they exist: brand assets from the brief, then gstack `DESIGN.md` (from `/design-consultation`), then frontend-design's plan. If frontend-design is absent, build the token plan yourself from `references/design-direction.md` and mark Phase 4 degraded. When direction is genuinely undecided and gstack is present, invoke `/design-shotgun`.
3. **Pick each section's shape** from the section-shape lexicon in `references/archetypes.md`. Phase 2 fixed the jobs and their order; the form each job takes on the page (which proof shape, which how-it-works shape, which close) is a design decision made here, with the tokens in hand. An off-lexicon shape is fine when the spec records what it is and why; the ordering constraints and proof adjacency bind whatever shape a job takes.
4. **Explore mode:** produce the stated number of variants (default 3), each a complete committed direction (token plan + static hero mockup), deliberately contrasting along real axes (light/dark, editorial/brutalist, type-led/visual-led), never three flavors of the same idea. Present them, wait for the pick, then proceed as build mode with the winner. With gstack, `/design-shotgun` replaces this step and its comparison board handles the pick.
5. Record the token plan in the run directory's `tokens/` (explore mode: one file per variant, plus a line on why the winner won), and persist the winning tokens as `theme.css` with custom properties. One property, one theme, many pages.

## Phase 5: Build (build mode) or Handoff (handoff mode)

Artifacts: reads `copy/copy-approved.md`, `page-spec.md`, `theme.css`; build mode writes `pages/<product>/`, handoff mode writes the package `references/handoff.md` specifies.

**Build mode.** Default to static HTML and CSS in a single file plus `theme.css`, hand-built to the requirements below. Vanilla JS only for small interactions. When the page needs more than a single static file (state, routing, components), **invoke web-artifacts-builder** or gstack **/design-html** to build it rather than hand-rolling it. Requirements regardless of stack:

- Semantic HTML: one `h1`, ordered headings, `nav`/`main`/`section`/`footer` landmarks, real `button` and `a` elements.
- Mobile-first CSS; fully usable at 390px before desktop styling.
- System fonts or at most two self-hosted files, `font-display: swap`, preloaded.
- Images sized, compressed, lazy-loaded below the fold, real alt text.
- No render-blocking third-party scripts; analytics deferred.
- Every contract specifies its post-conversion moment (the shared requirement in `references/archetypes.md`); when that moment is a page rather than a screen the platform owns, build it in the same pass; the conversion is not done at the form.
- Motion assets: when the spec includes one and the Remotion skill is installed, produce the clip through it (product loop demos, hero animations, explainer clips). Without Remotion, mark the slot `[TK: motion asset]` and list it in open items rather than substituting a low-grade animation. Any motion ships muted, respects `prefers-reduced-motion`, and has a static fallback frame.
- Verbatim copy: the built page carries the copy from `copy-approved.md` exactly. Builders paraphrase silently, and a paraphrase un-passes the voice gate, so after any build path (hand-built, web-artifacts-builder, or `/design-html`) extract the rendered text and diff it against the snapshot. Drift fails Gate 2: repair the build to match the snapshot, or, if the new wording earns its place, take it through Phase 3 step 5 and re-snapshot before the gate reports. Prose the build introduced that the snapshot never contained (button labels, microcopy, alt text) is copy that skipped the voice pass; it goes through step 5 too. Handoff mode already carries this protection in the package's verbatim-copy rule; this bullet gives build mode, the default, the same guarantee.
- Output: `pages/<product>/index.html`, `theme.css`, `assets/`, plus `llms.txt` and schema from Phase 6. Run state (the copy snapshot, the spec, the log) stays in the run artifact directory; the page directory holds only what deploys.

**Handoff mode.** Read `references/handoff.md` and produce the package exactly as specified there: a paste-ready master prompt, final copy marked verbatim, the page spec, the design direction with tokens and asset list, and the acceptance criteria derived from the gates. Run the pre-handoff gates listed there before delivering the package.

## Phase 6: Ship gates

Artifacts: reads the run directory (the spec, the copy snapshot, `voc.md` for quote tracing); writes `conversion-audit.md` at Gate 1 and this run's `foundry-log.md` entry.

Read `references/ship-gates.md` and run the full checklist (in handoff mode, run the pre-handoff subset now and the rest when the built asset comes back). Summary: conversion audit with MECLABS score, voice scan at zero FAILs plus the pattern pass and the verbatim-copy diff against `copy-approved.md`, WCAG 2.2 AA spot checks, performance budget, schema + llms.txt + robots + meta, measurement, integrity. **Invoke the companion that owns each gate as the primary path**: **cro** for the conversion audit and MECLABS score (its audit lands in `conversion-audit.md`), **web-design-guidelines** for the accessibility and render review, **ai-seo** for the AI-discovery gate (robots.txt crawler allowlist, content extractability, llms.txt), **schema** for the JSON-LD, and **analytics** for the measurement gate. Add gstack **/design-review** and **/qa** as extra checks. Any gate run on the `references/ship-gates.md` fallback because its companion was missing is marked degraded in the report. The voice scan (Gate 2) and integrity (Gate 8) are always page-foundry's own and are never waived by a companion.

Report results as a pass/fail table with the MECLABS score, followed by the companion evidence block from the gate report format in `references/ship-gates.md`: one line per companion in scope this run, each filling the EVIDENCE column of its table row with what ran, the artifact it wrote, and what changed because of it. A failed gate means fix and re-run, not ship with a caveat.

Close every run by appending a record to the run artifact directory's `foundry-log.md`, in exactly this format so future runs can parse it:

```
### {YYYY-MM-DD} · {mode} · {archetype}
- headline: {shipped H1}
- skeleton: {job order, comma-separated} · {narrative shape}/{hero form}/{proof strategy}/{density}
- meclabs: C={n} (M{n} V{n} I{n} F{n} A{n})
- gates: {pass/fail/N-A summary}
- companions: {active this run, with versions where known}
- degraded: {phases that ran on a reference-file fallback because a companion was missing or declined, each with the companion it lacked; core-tier overrides listed first, each prefixed PARTIAL:; "none" if every phase used its companion}
- open items: {unresolved, one per line}
- conversion data: {added later by the user; visits, signups, rate, source}
- learnings: {one line per lesson worth carrying forward}
```

The log is memory, not a receipt. Phase 0 reads it and treats two fields as binding inputs: unresolved `open items` become spec and gate checks for this run, and `learnings` adjust defaults (a headline pattern that converted poorly is not re-shipped; a section that produced signups is not cut without saying so). When `conversion data` exists, Phases 1 through 3 must state explicitly how it changed at least one decision, or state that it changed nothing and why. The `skeleton` line records the structure the page shipped with (the job order and the four axis settings from the spec), and Gate 1's anti-template check reads it: a new page repeating the property's recent skeletons without conversion data behind the repeat gets flagged. The `companions` field makes quality attributable: when two runs differ, check what was installed before blaming the pipeline.

## Integrity rules

These override everything else in this skill:

- Never invent testimonials, customer names, logos, star counts, download numbers, or statistics. If the proof inventory is thin, build the page around the proof that exists and tell the user what proof to go collect.
- Never fabricate technical artifacts or usage scenarios. Two rules, and the second is the one that is easy to miss. First: every command, terminal output, code snippet, config, API response, or file path shown must be real and runnable exactly as shown, or it does not go on the page. Second: never stage a terminal, screenshot, console, or UI that depicts an action the user does not take or output they never see, even when the underlying command or data is real. An internal component the user never runs (a build script, a linter, a scanner the pipeline calls) does not get shown as the user running it. To show the product working, show a real artifact of real use, the actual page it built, a real screenshot, the output the user actually receives, not a reconstruction of one. Real data presented in a styled card (the page's own gate report) is fine; a terminal of a script the user never runs is a staged scenario and fails this rule. A demo of the product itself is held to all of this, and a staged demo is the same class of failure as a fake testimonial.
- Never make claims about security, privacy, or compliance that the brief does not substantiate.
- Honest urgency only. Deadlines, caps, and limited seats appear only when they are real.

## Scope notes

- A "homepage" for a product with an existing multi-page site is still one page; flag site-architecture work separately rather than silently expanding scope.
- Rewrites of existing pages enter at Phase 1 (re-derive the message architecture, diff against what the current page says). Do not polish sentences on top of a broken structure.
- New archetypes follow the format in `references/archetypes.md`; add them there.
