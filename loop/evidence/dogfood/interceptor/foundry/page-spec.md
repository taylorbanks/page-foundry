# page-spec.md: Interceptor (page-foundry Phase 2 dogfood)

Page spec for the Interceptor page, built in Phase 2 from `product-marketing.md`, `message-architecture.md`, `persuasion-map.md`, and `foundry-log.md` in this directory. This is a build run on a single-page property. The contract is compiled below, the composition axes and per-job shapes are recommended from the brief, three legal candidate skeletons carry a MECLABS pre-read each, and the section spec is written in the recommended order. Every proof element is sourced to the brief or marked `[TK]`; the section spec carries no claim the message architecture did not already establish.

## Step 1: site context

Single-page property. Interceptor ships one homepage for the open-source project, with no existing site, no separate pricing page, and no thank-you page in scope (the conversion completes off-page at the repo or the package download). Phase 2 step 1 is skipped, per the rule that a single-page property compiles without `site-context.md`. The `site-architecture` companion is present but idle this run: its multi-page role has nothing to do here. Recorded so the compiler notes below stand on a stated absence, not an omission.

## Step 2: the compiled contract

### Compiler inputs (the five questions)

1. **What is the conversion?** Install, star, or read the docs on an open-source developer tool. Install/star routes to `oss-project` per the compiler's question 1. Classified `oss-project`; the user did not name an archetype, so classification ran and this is its result. Not a straddle: the boundary note under `docs-dev-tool-landing` straddles only when an open core carries a hosted commercial tier, and the brief marks any paid or hosted tier `[TK: no paid or hosted tier confirmed]`, so there is no commercial surface to straddle toward. Primary conversion: get the tool running (the install or repo action). Star and read-the-docs are secondary.
2. **One-time or ongoing?** The install is a one-time acquisition, but the tool is a living dependency the reader underwrites by adopting it, so the aliveness job (maintenance signals, who runs it, release cadence) binds. This is the `oss-project` reading, not a subscription reading.
3. **Where does the traffic come from?** Mixed and organic for the homepage of an open-source tool: search, a Hacker News or forum thread, a colleague, a mention in another project's docs. Launch-day traffic from a single post is single-source, and message match binds then (shared constraint 8). No single controlled paid source dominates, so this compiles the homepage-style `oss-project` contract with minimal nav, not a no-nav campaign contract.
4. **What awareness state dominates?** Solution-aware. The brief's segments own the detection problem already and are comparing approaches (CDP stealth patches, other agent-browser layers); `voc.md`'s ranked themes are all problem-and-mechanism shaped (detection and blocking, CDP is the tell, stealth-maintenance burden, the arms race). Product-aware arrivals (referred by a thread or another tool's docs) are the secondary state. Almost never unaware, per the contract. This answer chooses the narrative-shape axis below.
5. **How heavy is the decision?** Free in money, so no price gate. The real weight is setup friction (a running browser with the extension loaded manually, and on the full package a `.pkg` and macOS permission grants) and trust (automation against real logged-in accounts, plus the optional bridge's unauthenticated local socket). Motivation is already high (theme 1 is the top-ranked pain), so the persuasion arc is short; the weight lands on the security objections, answered in place rather than by length. This chooses the density axis: compressed, with the trust section carrying real weight.

**Log note.** This is the property's first run (`foundry-log.md` Run 1). No prior `conversion data` or `learnings` exist, so no axis default is moved; the defaults below stand as the compiler's own recommendations, and the log will record the shipped skeleton for the next run's anti-template check.

**Site-context note.** Single-page property, so the compiler ran without `site-context.md`; nav policy, pricing shape, and the post-conversion moment are settled from the brief alone, as recorded in this contract.

### 1. Goal

Get the tool running: the primary conversion is the install or repo action, carried by the install command in the hero (for a practitioner audience the install command is the CTA). Star and read-the-docs are the secondary paths, quiet beside the primary.

### 2. Buyer entry states

- **Solution-aware (dominant).** Owns the detection problem, comparing approaches. Raises "why this over the CDP stealth patches I already run" early, so the mechanism and the honest comparison carry weight; the comparison still cannot precede the first sight of the tool working (ordering constraint below).
- **Product-aware (secondary).** Sent by a thread, a colleague, or another project's docs, arriving half-sold and reaching for the quickstart within one scroll.
- **Single-source launch traffic.** On a launch post the hero mirrors the post's language (shared constraint 8).

Unaware traffic is not served; the page does not open by teaching that bot detection exists.

### 3. Jobs the page must do

The seven `oss-project` jobs all apply; none is struck. Several are constrained by `[TK]` proof and are noted as such. Two cross-cutting jobs from the Phase 1 objection map join them: answering the load-bearing objections in place, and drawing the not-for line for the anti-persona.

| # | Job | Kept / struck | Note |
|---|---|---|---|
| J1 | State plainly what it does and for whom, no marketing adjectives | Kept | The hero statement; the register the brief mandates |
| J2 | Install command in a copy-button code block, version/license/star badges adjacent | Kept, badge-constrained | The command is real; version, license, and star count are `[TK]`, so those badges are omitted or shown only once grounded. No fabricated star badge |
| J3 | Zero to first useful output in the fewest visible steps, real commands and real output | Kept | The heaviest `oss-project` proof: the product itself. Output verified at build (DOGFOOD-6) |
| J4 | Show how it works; for security tooling, threat model and data handling | Kept | Two parts: the no-CDP mechanism, and the data-handling and safety treatment the trust surface demands |
| J5 | Compare honestly against the 2 to 3 alternatives, concede real tradeoffs | Kept | CDP frameworks, stealth patches, and the scale boundary (Browser and BrightData). Concessions are the honesty proof |
| J6 | Show the project is alive: discussion, contributing, maintainer, release cadence | Kept, `[TK]`-constrained | Stars, cadence, and contributor count are `[TK]`. The section states what is checkable (public repo, open issues, documented limitations) and marks the rest `[TK]`, rather than padding |
| J7 | Link docs, repo, license, and security policy at the close | Kept | License identifier is `[TK]`; the link points at the repo `LICENSE` if present, confirmed at build |
| J8 | Answer the load-bearing objections where they arise (from the Phase 1 objection map) | Kept | O2 and O3 (real-account risk, the local socket) answer in the trust section; O5 answers at the mechanism; O1 at the comparison and not-for line; O4 in the FAQ |
| J9 | Draw the not-for line for the anti-persona | Kept | Sends batch headless scraping at scale to Browser and BrightData. Satisfies shared constraint 9: it turns away only readers the tool would fail |

### 4. Proof requirements

Stars, downloads, and named adopters appear only if real; all are `[TK]`, so they are cut rather than run thin (an empty proof strip reads as desperation on an `oss-project` page). The proof this page actually carries:

- The **Stealth Verification result** (BrowserScan Normal, Pixelscan Definitely Human, CreepJS 0% headless, Fingerprint.com notDetected), vendor-stated in `SKILL.md`, with independent reproduction marked `[TK]` on the page. This is the checkable-authority proof and rides in the hero viewport.
- The **quickstart output** (real command, real output): for `oss-project` the strongest proof is often the product itself, and it carries trust a logo row never would.
- The **documented limitations** as an honesty proof (proof 12): candor an audience that reads the code before trusting it reads as credibility.
- **Category validation** in place of social proof: the market converging on non-CDP browser control on purpose (`voc.md` paraphrase names felarof's C++ APIs, Intuned, Browser Cash, pydoll). This stands in for the adoption proof the inventory cannot yet support, per `persuasion-map.md`.

Proof strategy is interleaved (see axes): the inventory is many small checkable pieces rather than one heavy artifact, so each rides beside the claim it backs. Shared constraints 2 and 3 still bind: every CTA keeps a proof element within a viewport, and the heaviest proof (the working quickstart) sits before the closing ask.

### 5. CTA policy

Default policy, with the install command as the primary CTA; it repeats at the close in identical wording. Secondary actions (Docs, GitHub, Community) stay quiet as text links. Navigation: minimal and allowed (Docs, GitHub, Community), per the contract. No form: this is an open-source acquisition, not an email capture, so there is no field budget to design and the `cro` form-design output is not requested this run.

### 6. Ordering constraints

The shared ten bind (hero passes the 5-second test; proof beside each claim and within a viewport of each CTA; heaviest proof before the ask; mechanism before price, not applicable with no price; risk reversal at commitment; objections answered where they arise with an FAQ for leftovers; mobile single column reaches proof before any form, not applicable with no form; message match on single-source traffic; no qualified reader disqualified before a CTA; sections in the order this buyer raises objections). The `oss-project` contract adds three:

- The install command lands in the hero, not below it.
- For product-aware traffic, the quickstart begins within one scroll of the hero.
- The comparison never precedes the reader's first sight of the tool working.

The third constraint is load-bearing for skeleton selection below: it makes a comparison-early order illegal, however much the solution-aware reader wants the comparison sooner.

### Composition axes (recommended, one reason each)

- **Narrative shape: demo-led.** Chosen by the dominant awareness state (solution-aware): the problem compresses to one sentence, and the mechanism and the demonstration lead. Walking a reader who owns the problem through problem agitation is dead weight they scroll past.
- **Hero form: install-command.** Pinned by the `oss-project` contract, not a per-run choice. The practitioner converts on the thing itself, and the Stealth Verification result is the in-viewport proof beside it.
- **Proof strategy: interleaved.** Chosen by the shape of the proof inventory: many small checkable pieces (the stealth result, the quickstart output, the documented limitations, the category-validation names) work harder spread beside the claims they back than gathered into one section. The one near-concentrated artifact, the stealth result, sits in the hero region by contract.
- **Density: compressed.** Chosen by the decision weight: the install is free and motivation is already high, so the arc is short. The security objections get their weight from being answered in place, not from length; padding a free-install page costs conversions.

### Per-job shape recommendations (from the section-shape lexicon)

Recommended before any tokens exist; Phase 4 revisits each with the tokens in hand, where a change is a recorded override.

| Job | Recommended shape | Input that chose it |
|---|---|---|
| J1 statement + the one-line problem | One sentence in the buyer's words | Solution-aware traffic needs only a sentence of problem framing |
| J2 install | Install-command block (copy-button code) in the hero | The contract pins the hero form; the command is the CTA |
| J3 quickstart | An annotated real command with its real output | The mechanism's real order is a short sequence of compound calls; the output is the proof |
| J4 mechanism | A terse mechanism section (extension versus attached debugger, the before-and-after of the CDP surface) | The wedge is a single architectural difference a reader can picture; `gstack /diagram` is available if the section takes the diagram shape at build |
| J4 data handling and safety | An inline callout beside the claim that raises the risk, plus a short safety-controls list | The objection map raises real-account and socket risk here; the pratfall lever wants the limit stated in place, then bounded |
| J5 comparison | An inline before-and-after contrast plus a short concessions list, not a wide matrix | Compressed density and a single-axis wedge; a forty-row table reads as homework to this reader |
| J6 project status | A terse status line linking the repo and issues, stating what is checkable | The aliveness proof is thin (`[TK]` stars and cadence); the shape cannot promise more than the inventory holds |
| J8 leftover objections | An FAQ collecting only the leftovers | Shared constraint 6: the load-bearing objections answer in place; the FAQ takes maturity, license, and platform questions |
| J9 not-for line | A not-for list | It qualifies buyers and reads as confidence; the anti-persona bounds it |
| Close | One line restating the outcome with the install command repeated | Compressed density; the `oss-project` close repeats the install action |

## Step 3: candidate skeletons and MECLABS pre-reads

Three legal skeletons, each a job order plus axis settings, each satisfying the full ordering-constraint set, differing on a real axis rather than cosmetically. A fourth shape, comparison-early (the wedge before the quickstart), was considered and dropped: the `oss-project` ordering constraint forbids the comparison preceding the first sight of the tool working, so a comparison-early order is illegal, not a variant. Presenting it would be inventing variety the constraints already ruled out. The `cro` companion (present) scored each pre-read on the MECLABS Conversion Sequence (C = 4M + 3V + 2(I − F) − 2A; each factor 1 to 5). The scores are the heuristic's design diagnosis, not claimed product metrics.

### Candidate A (recommended): mechanism-forward, interleaved proof

Order: Hero (install + stealth result) → Problem (one line) → Mechanism (no-CDP contrast) → Quickstart → Data handling and safety → Comparison → Not-for line → Why now (category validation) → Project status → FAQ → Close.
Axes: demo-led, install-command, interleaved, compressed.

MECLABS pre-read: M 5, V 5, I 3, F 2, A 3 → **C = 31**. Wins on value clarity: the mechanism is legible in the hero plus one scroll, so the solution-aware reader understands the wedge (the CDP surface removed, not masked) before the quickstart shows it working, and the security answers land in place. Leaks on the quickstart depth: the working output sits at section 4, slightly past "within one scroll" for the product-aware minority, mitigated because the mechanism section is terse; F is held at 2 by the real install friction the page cannot fully remove.

### Candidate B: demonstration-first, interleaved proof

Order: Hero (install + stealth result) → Quickstart → Mechanism → Data handling and safety → Comparison → Not-for line → Why now → Project status → FAQ → Close.
Axes: demo-led (demonstration-forward), install-command, interleaved, compressed.

MECLABS pre-read: M 5, V 4, I 3, F 2, A 3 → **C = 28**. Wins for the product-aware reader: the quickstart lands within one scroll, meeting the second `oss-project` ordering constraint at full strength, and "show it working before you argue" is the `oss-project` instinct. Leaks for the dominant solution-aware segment: they see the output before the reason it is trustworthy, so value clarity drops for the majority; the mechanism arriving after the demonstration slightly delays the CDP-surface reassurance that answers the detection anxiety.

### Candidate C: proof-led, concentrated stealth result

Order: Hero (install) → Stealth-verification proof section (the detector results gathered as one moment) → Mechanism → Quickstart → Data handling and safety → Comparison → Not-for line → Why now → Project status → FAQ → Close.
Axes: proof-led, install-command, concentrated, compressed.

MECLABS pre-read: M 5, V 4, I 3, F 2, A 2 → **C = 30**. Wins on anxiety: the detection fear, this buyer's top pain, meets a prominent reproducible-results moment early, so A is lowest here. Leaks on proof balance: the results are vendor-stated with independent reproduction `[TK]`, so leading the whole page on one un-reproduced artifact over-weights it, and concentrating proof under-uses the product-as-proof (the quickstart) that `oss-project` values most.

### Recommendation

**Candidate A.** Highest C (31), and its value-clarity advantage serves the dominant solution-aware segment: the mechanism legible before the ask is what this reader came to evaluate. Its one leak (quickstart depth) is bounded because the mechanism section is terse and the quickstart still lands within roughly one to two scrolls. Candidate B is the fallback the log should promote if launch analytics show product-aware referral traffic dominating; that is a testable structural claim the axis settings record. Candidate C's reliance on the un-reproduced stealth result over-weights a single `[TK]`-shadowed artifact, which interleaving hedges. The spec below is drafted on Candidate A.

## Step 4: conversion structuring (cro) and the structural models

The `cro` companion (present) structured the spec for conversion against Candidate A: a 5-second hero carrying what-it-is plus the install command plus the stealth-result proof; one primary CTA (install) repeated identically; the headline written to the message-match constraint on single-source traffic; proof adjacent to every CTA instance; the mobile single-column order reaching the quickstart proof before the closing ask. No form is present, so no form-design output was requested.

`persuasion-map.md`'s two structural models bind the spec structure:

- **Fogg Behavior Model.** Motivation is already high (theme 1), so the spec does not manufacture it; ability is the binding constraint, so the spec lowers ability cost by naming the browser-only package as the shortest install path in the hero and keeping the first command trivial. The prompt (the install CTA) sits where motivation peaks and the next action is cheapest: in the hero, and again at the close after the quickstart has shown the payoff. Proof sits beside every CTA instance because an ask lands where motivation is built and the action is easy.
- **Hick's Law.** One primary CTA, documentation as the single secondary path, minimal nav. No pricing tiers exist to choose (the archetype carries no pricing block, and the business model is `[TK]`), so there is no tier-count decision to simplify away; every choice the page removes is a decision the reader does not have to make before the one that matters.

Pricing psychology is out of scope: no price exists to frame (`persuasion-map.md`). No archetype-specific pricing, app-store, or comparison-page companion applies beyond the honest comparison section, which draws on the competitive frame `competitor-profiling` wrote at intake. Motion: the `oss-project` archetype carries no mandatory motion slot. One optional slot is flagged (a short screen recording of the compound-command flow or the stealth check passing live), justified only if it shows something the static output cannot; the remotion stack was not checked at preflight, so the slot is carried as `[TK: optional core-loop screen recording]` in open items rather than filled, and the default is real static command output.

## Step 5: the section spec (Candidate A order)

Axis settings, restated for the build: **narrative shape** demo-led (solution-aware readers start at the mechanism and the demonstration); **hero form** install-command (contract-pinned; the practitioner converts on the tool); **proof strategy** interleaved (many small checkable pieces ride beside their claims); **density** compressed (free install, high motivation, security answered in place).

Each section carries: the contract job it fulfills, its shape, purpose, the claim it carries (from `message-architecture.md`), the proof element placed beside it, and the CTA treatment.

**S1. Hero.** Job J1, J2. Shape: statement plus install-command block, with the stealth-result proof in the viewport. Purpose: pass the 5-second test and put the install command in reach. Claim: hierarchy claim 1 (your automation runs on a real browser that sites do not flag as a bot). Proof: the Stealth Verification result, marked vendor-stated, independent reproduction `[TK]`. CTA: primary, the install command (the browser-only package as the shortest path); the exact command string is confirmed against the live README at build. On single-source launch traffic the headline mirrors the post's language.

**S2. Problem (one line).** Job J1. Shape: one sentence in the buyer's words. Purpose: name the pain for the reader who owns it, without agitation. Claim: the pain behind claim 1 (theme 1: automation gets flagged, challenged, or logged out on the authenticated pages that matter). Proof: none; it is the reader's own situation, in their language from `voc.md`. CTA: none.

**S3. Mechanism (how it works).** Job J4. Shape: a terse before-and-after of the CDP surface (an attached debugger a site can fingerprint, versus extension control with no debugger attached). Purpose: make the wedge legible before the demonstration. Claim: hierarchy claim 2 (Interceptor removes the CDP surface rather than patching over it). Proof: the architectural contrast itself, drawn against `undetected-chromedriver` and `playwright-stealth`, which still sit on CDP or WebDriver. Answers O5 (a stealth patch that passes today fails after the next detector update, because it masks tells instead of removing the surface). CTA: none.

**S4. Quickstart (see it work).** Job J3. Shape: an annotated real command with its real output; the compound commands (`interceptor open`, `read`, `act`, `inspect`), each returning tree plus text in one call. Purpose: the demonstration, and the heaviest `oss-project` proof. Claim: hierarchy claim 5 (one CLI, and more than stealth). Proof: the real command output, captured at build; a hello-world longer than one screen is an onboarding problem the page cannot fix. CTA: the install command repeats here if the section runs long. Within one scroll for product-aware traffic (mitigated placement under Candidate A).

**S5. Data handling and safety.** Job J4, J8. Shape: an inline callout beside the risk claim, plus a short safety-controls list. Purpose: answer the trust objections where they arise. Claim: hierarchy claim 3 (your real logged-in sessions stay intact) and its risk. Proof: real sessions and cookies stay local (proof 3); the safety controls (panic hotkey, sensitive-field masking, a bundle-ID denylist over Keychain, 1Password, System Settings, and banking apps, and TCC tracking, proof 9); the optional bridge's socket stated plainly as local-only, with the browser-only package shipping without it. Answers O2 (real-account risk) and O3 (the unauthenticated local socket), pratfall lever: state the limit, then state what bounds it. CTA: none.

**S6. Honest comparison.** Job J5. Shape: an inline before-and-after contrast plus a short concessions list. Purpose: answer "why this over the alternatives" for the solution-aware reader, after the tool has been shown working (ordering constraint 3). Claim: hierarchy claim 4 (nothing to maintain against a moving detector). Proof: the concessions themselves as the honesty proof (needs a real browser window; the bridge is mac-centric; the CI and headless story is `[TK]`); conceded weaknesses buy credibility for the claimed strengths. Draws on the competitive frame from intake. CTA: none.

**S7. Not-for line.** Job J9. Shape: a not-for list. Purpose: turn away the anti-persona honestly. Claim: the boundary from O1 and the anti-persona (batch headless scraping at scale, large-scale multi-domain crawling, pure Linux or Windows CI with no interactive desktop). Proof: the routing to Browser and BrightData, which the Interceptor skill itself makes. Satisfies shared constraint 9. CTA: none.

**S8. Why now (category validation).** Job J4 support. Shape: a short why-now line. Purpose: validate the category without claiming Interceptor's own adoption. Claim: the market is converging on non-CDP browser control on purpose. Proof: the category-validation paraphrase from `voc.md` (felarof's C++ APIs, Intuned, Browser Cash, pydoll), attributed as a paraphrase, never styled as a testimonial. Stands in for the social proof the inventory cannot support. CTA: none.

**S9. Project status (is it alive).** Job J6. Shape: a terse status line linking the repo and issues. Purpose: the aliveness signal `oss-project` adoption needs. Claim: the project is open, buildable, and public. Proof: the public repo (proof 10, HTTP 200 verified), open source and buildable from source (proof 11), and the documented limitations as active candor (proof 12). Stars, release cadence, and contributor count are `[TK]` and are named as unknown rather than invented. CTA: the GitHub secondary link.

**S10. FAQ (leftovers only).** Job J8. Shape: an FAQ. Purpose: collect the objections that do not have a home in the sections above. Claim: none new; it answers rather than asserts. Contents: maturity and the repo name `slop-browser` (O4, answered by the documented-limitations-as-honesty framing and the buildable-from-source check); the Windows and Linux support question for the browser surface (`[TK]`, carried as an open item rather than answered); the license identifier (`[TK]`). Proof: the documented-limitations honesty (proof 12) for O4; the rest are stated as open. CTA: none.

**S11. Close.** Job J7. Shape: one line restating the outcome plus the install command repeated identically. Purpose: the final ask, with the heaviest proof (the quickstart) already behind it (shared constraint 3). Claim: hierarchy claim 1 restated. Proof: a proof element within the viewport (shared constraint 2); the docs, repo, license, and `SECURITY.md` links sit here (J7). License link confirmed at build. CTA: primary, the install command, identical wording to the hero.

### The answer block (ai-seo, present)

Placed near the top of the page, immediately after the hero, as a self-contained block an AI engine can lift whole. Shaped by the `ai-seo` companion; Gate 6 checks the block the spec placed. Roughly 40 to 60 words:

> Interceptor is an open-source Chrome extension that lets an AI agent or script drive your real, logged-in browser from inside the browser UI. Because it works through the extension rather than the DevTools Protocol, the browser carries no CDP fingerprint and keeps your existing sessions. It is built for engineers automating authenticated, detection-sensitive work.

(54 words. Every clause traces to the brief; no `[TK]` claim appears in it.)

### The measurement plan (analytics, present)

Shaped by the `analytics` companion; Gate 7 checks what the spec wired, and the `foundry-log` `conversion data` field closes the loop next run.

- **Conversion event.** `cta_install_click`: the outbound click on the primary install or repo CTA, recorded by a lightweight, deferred analytics call fired on the CTA click. It ships with no render-blocking third-party script (a build requirement).
- **What the page can and cannot measure, stated honestly.** The page measures intent-to-install (the outbound click). The completed conversions (stars, clones, package downloads) happen off-page and are measured at the source (the GitHub repo's insights, the package or release download counts), not in page analytics. The spec names both so Gate 7 verifies the on-page event and the report does not imply the page tracks installs it cannot see. This is the same discipline the homepage measurement finding applied: name the tracked conversion honestly rather than claim an analytics capability the surface does not have.
- **UTM convention, per planned source.** UTM binds only sources the owner controls: a launch post (`utm_source=<post host>`, `utm_medium=social`, `utm_campaign=launch`); a newsletter or owned email if one sends (`utm_medium=email`). Referral traffic (a colleague, another project's docs) and organic search are measured by referrer and search console, not UTM, because the owner cannot stamp a link they did not place. The plan says so rather than pretending every source carries a UTM.

## Spec sign-off

This dogfood runs unattended, so the spec sign-off pause has no user to answer. Decision recorded: the recommended skeleton (Candidate A) proceeds, and the two alternatives (B, C) are recorded above with their pre-reads, exactly as the suppressed-sign-off rule prescribes. A real interactive run pauses here to show the three candidates with their MECLABS pre-reads, and the user picks one. The per-job shape confirmations are taken as the compiler's recommendations; Phase 4 revisits each with the tokens in hand, where a change is a recorded override.

- **gstack `/plan-design-review`.** The `gstack` slash commands are present. In an interactive run this seam offers `/plan-design-review` on the approved spec, whose inline mockups catch structural problems before copy is written. Unattended, it is noted as available and not run; a morning interactive rebuild can invoke it.
- **PRODUCT.md: not written this run.** The Phase 2 sign-off writes the product's root `PRODUCT.md` only with impeccable installed, and impeccable is absent this run (preflight). Two reasons compound: the write is gated on impeccable installed (its purpose is to pre-empt the interview impeccable fires when the file is missing, and with impeccable absent no command fires that interview), and the dogfood has no Interceptor product-repo checkout in the sandbox to hold a root `PRODUCT.md`. The file would be written at exactly this point if impeccable were installed, from the signed spec's CTA set and the Phase 1 belief ladder, under the singleton merge-never-clobber rule. Recorded as a skipped, gated write, not an omission; the impeccable-absent design seam is already on the preflight degraded list. OWNER-REVIEW.

**Shipped skeleton, recorded for Phase 6 and Gate 1.** Job order: hero, problem, mechanism, quickstart, data-handling-and-safety, comparison, not-for, why-now, project-status, FAQ, close. Axes: demo-led, install-command, interleaved, compressed. Phase 6 writes this to the `foundry-log` `skeleton` line, and Gate 1's anti-template check reads it against the property's future pages. First page for this property, so there is nothing yet to converge with.

## Open items carried forward (to Phase 3 and the gates)

- The exact install command string is confirmed against the live repo README at build (DOGFOOD-6) before it lands in shipped copy.
- Tool release version, license identifier, and star count are `[TK]`; the corresponding badges stay off until grounded (J2).
- Windows and Linux support and the CI or headless story for the browser surface are `[TK]` (carried from Phase 1); they bound the comparison concessions and the FAQ, and are stated as open rather than answered.
- The optional core-loop motion clip is `[TK: remotion stack unchecked]`; the default is real static command output.
- The Stealth Verification result stays vendor-stated; its independent reproduction is `[TK]`, and the page says so wherever the result appears.

## Degraded seams (for the gate report)

- **impeccable (absent).** PRODUCT.md skipped this run (above); DESIGN.md persistence, the Phase 4.5 comp critique, and the Gate 5 design detect will run on `references/design-direction.md` and `references/ship-gates.md` fallback rules, each named on the gate report when it runs.

Everything else Phase 2 needed ran live: `cro` structured the spec and scored the pre-reads, `analytics` wrote the measurement plan, `ai-seo` shaped the answer block, and `site-architecture` was correctly idle on a single-page property.

---
Provenance: compiled from `product-marketing.md`, `message-architecture.md`, `persuasion-map.md`, and `foundry-log.md` in this directory, against the contract compiler and `oss-project` contract in `skills/page-foundry/references/archetypes.md` and the MECLABS rubric in `skills/page-foundry/references/conversion-rules.md`. Every proof element is sourced or marked `[TK]`; the MECLABS scores are the heuristic's design diagnosis, not product metrics; no proof is fabricated.
</content>
</invoke>
