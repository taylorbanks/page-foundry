# How page-foundry orchestrates: the 30,000-foot walkthrough

What actually happens when you invoke page-foundry v3.0, top to bottom: which specialist skills it calls, in what order, what each one produces, where those files live, which files are canonical, and what comes out the other end. Reference for humans; candidate source for a homepage diagram.

## The idea in one paragraph

page-foundry is a foundry: raw material moves through a fixed sequence of stations, and inspection rejects anything that fails. The stations are staffed by specialist skills that already exist and are better at their jobs than any generalist: a product marketer, a researcher, a psychologist, a conversion specialist, a copywriter, a designer, a design inspector. page-foundry itself does three things none of them do: it runs them in the right order, it makes every handoff a file on disk so nothing lives only in a model's short-term memory, and it refuses to ship the result until eight gates pass. The skills are the talent; page-foundry is the process; the files are the institutional memory.

## The walkthrough

### Invocation and preflight (Phase -1)

You say what you want built: `page-foundry, build mode, homepage for Acme`. Three modes: **build** ships static HTML, **explore** shows contrasting design directions first, **handoff** produces a package another design tool builds from.

Before any work, page-foundry sweeps for its companion skills. Seven are **core and required**: product-marketing, customer-research, marketing-psychology, cro, copywriting, frontend-design, humanizer. Missing one stops the run at a single install-or-override question; a run without them is marked PARTIAL because those seven are the difference between orchestration and improvisation. The rest are **enhancers** (impeccable, gstack, web-design-guidelines, remotion, the archetype specialists) that strengthen specific stations and degrade gracefully to built-in condensed rules when absent, with the gap recorded.

### Phase 0: Intake. Output: the brief.

- **product-marketing** studies the repo, the README, any PRD, the existing site, and the conversation, and drafts the durable brief: positioning, ICP, differentiation, competitive frame, proof inventory. Written to `.agents/product-marketing.md` in the product's repo. This file outlives the run; every future page for this product starts from it.
- **customer-research** starts immediately, mining any voice-of-customer source (reviews, transcripts, tickets, forums) into `voc.md`: verbatim buyer quotes, each carrying its source. **competitor-profiling** reads the named alternatives and fills the competitive frame.
- Then, and only then, you get interviewed, and only for what the mining could not supply: entry states, traffic source, the real proof inventory, claims that cannot be made. A question the files already answer is a wasted question.
- The run also opens its working directory, `.agents/foundry/<product>/`, and reads `foundry-log.md`: what previous runs shipped, what converted, what is still open. Prior learnings are binding inputs, not trivia.

### Phase 1: Message architecture. Output: what the page argues.

- **customer-research** extends `voc.md`; the message is written in the buyer's recorded words, not the builder's.
- **marketing-psychology** produces `persuasion-map.md`: which persuasion levers fit this buyer and offer, and where each lands (claim order, objection answers, CTA framing).
- page-foundry itself writes `message-architecture.md`: one positioning sentence, a claim hierarchy where every claim is concrete enough to be proven wrong, an objection map per buyer segment, and the proof inventory with nothing invented.

### Phase 2: Page spec. Output: the structure, chosen not stamped.

- The **contract compiler** (page-foundry's own, in `references/archetypes.md`) answers five questions from the brief (conversion, relationship, traffic, awareness state, decision weight) and compiles a conversion contract: the jobs this page must do, its proof requirements, its CTA policy, and the ordering constraints any layout must satisfy. Contracts fix what the page must accomplish; they do not fix where sections sit. Two pages honoring the same contract should differ in structure whenever their buyers differ.
- From the contract, 2 or 3 **candidate skeletons** are generated, each a different legal structure, each pre-read against the MECLABS conversion rubric, with **cro** scoring when present. You pick at sign-off.
- **cro** structures the winning skeleton into the full spec; archetype specialists (**pricing**, **competitors**, **aso**, **launch**, **lead-magnets**, **popups**, **signup**) shape the sections that call for them. **ai-seo** places the answer block (the 40-to-60-word extractable summary AI engines cite) and **analytics** writes the measurement plan into the spec now, so the gates later verify decisions instead of retrofitting them.
- Everything lands in `page-spec.md`: contract, skeletons considered, section spec, answer block, measurement plan. A spec that lives only in the transcript is not a spec.

### Phase 3: Copy. Output: `copy-approved.md`, the canonical words.

- **copywriting** drafts 2 or 3 complete hero candidates, each answering a different objection from the map, then writes the body section by section against the spec, in your voice (the rules live in `references/voice.md`, which you configure once through a short wizard).
- **copy-editing** tightens and cuts, and returns a changelog of what died.
- A red-team read walks the draft as each skeptical buyer segment; any qualified reader bouncing before the CTA is a defect, fixed now.
- The voice chain runs: the mechanical scanner (`voice_scan.py`, zero tolerance on banned vocabulary and em dashes, pattern detection for AI grammar tells like negative parallelism and three-verb runs), then the **humanizer** pass for the structural tells regex cannot see. The humanizer proposes; meaning arbitrates: a rewrite that changes what a sentence claims is rejected. One pass, no over-processing.
- The surviving copy is snapshotted verbatim to `copy/copy-approved.md`. From this moment the words are canonical: any later edit re-triggers the chain, and the built page is diffed against this file at the gates. Builders paraphrase silently; the snapshot is what catches them.

### Phase 4: Design direction. Output: tokens, and a persisted design system.

- **web-design-guidelines** is authoritative on accessibility, typography, and interaction mechanics.
- **frontend-design** produces 2 or 3 committed token plans (palette, type pairing, layout concept, one signature element), differing on real axes, each with a critique against the generic default. On a truly greenfield property, **impeccable's** palette script seeds an OKLCH brand color first. You pick; losers are recorded in `tokens/` with the reason the winner won.
- Section shapes are chosen from the shape lexicon (which proof shape, which how-it-works shape) with tokens in hand: Phase 2 fixed the jobs and order, Phase 4 picks each job's form.
- The winning tokens persist as `theme.css`. With impeccable installed, `/impeccable document` also writes the property's `DESIGN.md` at the product's repo root in the published design.md format, the file other design tools can read, and the file that arms impeccable's detector: from now on, off-palette colors on this property are mechanical findings.
- In explore mode this phase produces full contrasting directions with hero mockups, and you pick from a comparison board.

### Phase 5: Build or handoff. Output: the page, or the package.

- **Build mode:** static HTML plus `theme.css`, mobile-first, semantic, performance-budgeted. **web-artifacts-builder** or gstack `/design-html` handles anything beyond a static file. **remotion** produces motion assets when the spec justified one. The rendered text is diffed against `copy-approved.md`; drift fails the voice gate. Output: `pages/<product>/` with `index.html`, `theme.css`, assets, `llms.txt`, schema.
- **Handoff mode:** instead of building, page-foundry compiles the package another tool builds from: master prompt with five non-negotiables and an explicit creative license grant, verbatim copy with image-slot geometry, the conversion contract, design direction, voice rules for any microcopy the tool generates, acceptance criteria mapped to gate IDs, a return spec, and a generated design.md projection for single-prompt tools. The tool gets everything it cannot know and full freedom in everything it does better.

### Phase 6: Eight ship gates. Output: a page that survived, and the memory of the run.

1. **Conversion**: MECLABS-scored twice, once by the builder, once by a fresh agent that sees only the rendered page and the brief; divergence is recorded in `conversion-audit.md`. An author grading its own homework is not an audit.
2. **Voice**: scanner at zero FAILs, pattern pass, humanizer evidence, and the verbatim diff against `copy-approved.md`.
3. **Accessibility**: WCAG 2.2 AA.
4. **Performance**: weight budget, no render-blocking scripts.
5. **Render review**: the page is looked at, at 390 and 1440, plus **impeccable's** deterministic design scan, 46 mechanical anti-pattern rules with `DESIGN.md` enforcement; findings are floors, never verdicts, and accepting one requires a recorded reason.
6. **AI discovery**: schema, llms.txt, robots allowlist for citation crawlers, the answer block the spec placed.
7. **Measurement**: the conversion event and UTM convention the spec wired.
8. **Integrity**: nothing fabricated. No invented testimonial, number, command, screenshot, or staged demo. This gate is page-foundry's own and nothing waives it.

The gate report shows pass/fail plus one evidence line per companion: what ran, what it wrote, what changed because of it. An invocation that left no artifact did not happen.

Finally the run appends to `foundry-log.md`: headline, skeleton shipped, MECLABS score, gates, companions, open items, learnings. The next run reads this first. When you later add conversion data, the next run must state what decision that data changed. Pages learn from the pages before them.

## The data spine

```
.agents/product-marketing.md          the brief; durable, per product, outlives every run
.agents/foundry/<product>/            the run memory; how every page got made
├── foundry-log.md                    per-property history; every run reads, every run appends
├── voc.md                            buyer quotes with sources; message + integrity trace to it
├── persuasion-map.md                 levers chosen and where they land
├── message-architecture.md           what the page argues
├── page-spec.md                      contract + skeletons + section spec + answer block + measurement
├── conversion-audit.md               independent MECLABS audit, both scores, divergence
├── tokens/                           every candidate token plan + why the winner won
└── copy/copy-approved.md             the canonical words; the build is diffed against this
PRODUCT.md, DESIGN.md                 product repo root; shared with impeccable + any design tool
pages/<product>/                      what actually deploys; nothing else lives here
```

Three canonicality rules make the system honest: the **snapshot** is the only source of shipped words (builds are diffed against it), the **spec** is the only source of structure (gates audit the file, not the transcript), and the **log** is the only memory (next runs read it, and repeated structure without conversion data behind it gets flagged).

## The pipeline at a glance

```
        you: one brief, a few answers
                    │
  ┌─────────────────▼──────────────────┐
  │ -1 PREFLIGHT   7 core skills req'd │
  │  0 INTAKE      product-marketing · customer-research · competitor-profiling → brief, voc.md
  │  1 MESSAGE     customer-research · marketing-psychology → message-architecture, persuasion-map
  │  2 SPEC        contract compiler → skeletons → cro · pricing/launch/… · ai-seo · analytics → page-spec
  │  3 COPY        copywriting → copy-editing → red-team → scanner → humanizer → copy-approved.md
  │  4 DESIGN      web-design-guidelines · frontend-design (·impeccable palette) → theme.css, DESIGN.md
  │  5 BUILD/HAND  web-artifacts-builder / gstack · remotion → pages/<product>/  or the handoff package
  │  6 GATES ×8    cro (indep. audit) · impeccable detect · ai-seo · schema · analytics + voice + integrity
  └─────────────────┬──────────────────┘
                    │ pass → ship          fail → fix and re-gate, never ship with a caveat
                    ▼
   a page that converts, reads like you, and survives inspection
   + foundry-log.md: the run remembered, so the next page starts smarter
```

## Versus doing it with one tool

| | Raw prompt / Claude Design alone | frontend-design alone | impeccable alone | page-foundry |
|---|---|---|---|---|
| Positioning + buyer research | invented on the spot | none | brief PRODUCT.md interview | product-marketing + customer-research + competitor-profiling, recorded with sources |
| Conversion structure | template instinct | none | none | compiled contract + candidate skeletons + MECLABS, audited independently |
| Copy | one pass, no gate | none | microcopy clarity only | specialist-drafted, red-teamed, voice-scanned, humanized, then frozen verbatim |
| Voice consistency across pages | none | none | none | scanner rules you own; page forty sounds like page one |
| Design | its taste | one strong direction | deep craft + detector | frontend-design direction + impeccable inspection + your recorded pick |
| Honesty | will invent proof | n/a | n/a | integrity gate: nothing fabricated, ever |
| Memory between pages | none | none | per-project design context | brief + log + tokens + voice: every page learns from the last |
| Verification | you eyeball it | you eyeball it | detector + critique | eight gates with evidence, or it does not ship |

Each column's tool is excellent at its slice, and page-foundry invokes most of them rather than competing with them. The difference is not any one capability; it is that the whole argument, from who buys to what ships, is researched, recorded, checked, and remembered.
