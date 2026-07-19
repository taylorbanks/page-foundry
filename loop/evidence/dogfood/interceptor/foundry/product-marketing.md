# Product Marketing Context: Interceptor

*Last updated: 2026-07-18*
*Method: page-foundry Phase 0 dogfood. It invokes the `marketing-skills:product-marketing` framework plus `marketing-skills:competitor-profiling` for the competitive frame, run non-interactively. Every claim traces to a named source, and every metric or quote is either sourced or marked `[TK: ...]`.*

## Sources read

- `~/.claude/skills/Interceptor/SKILL.md` (v2.0.0), the installed skill definition, read in full.
- Repo README, fetched live from `https://raw.githubusercontent.com/Hacker-Valley-Media/slop-browser/main/README.md` (resolved on `main`; `master` not needed).
- Repo root `https://github.com/Hacker-Valley-Media/slop-browser`, verified live (HTTP 200) per task input.

Both source documents agree on the core technical claims. Where the README adds detail beyond the skill (iOS surface, `.pkg` installers, network-capture scope, safety controls), that is noted inline.

> Note on method: `competitor-profiling` normally pulls live SEO and review data through Firecrawl and DataForSEO. Those tools were not available in this non-interactive run, so all quantitative traffic, backlink, rating, and adoption numbers below are marked `[TK]` rather than estimated. The competitive frame here rests on documented, checkable product characteristics only.

---

## Product Overview

**One-liner:** A Chrome extension that lets an AI agent drive your real, logged-in browser from inside the browser UI, with zero CDP fingerprint.

**What it does:** Interceptor controls the actual Chrome or Brave window you are already using, through an extension rather than the Chrome DevTools Protocol. Because there is no debugger attached and no automation flag set, the browser presents no CDP fingerprint and keeps your real cookies and sessions. A single CLI (`interceptor`) exposes compound commands (`interceptor open`, `interceptor read`, `interceptor act`, `interceptor inspect`) plus passive network capture, a record-and-replay session monitor, a scene graph for canvas-rendered editors, and an optional macOS bridge for OS-level input and native-app control.

**Product category:** Browser automation and agent-browser tooling. The comparison set a buyer searches within is CDP automation frameworks and their stealth patches (Puppeteer, Playwright, Selenium, `playwright-stealth`, `undetected-chromedriver`) and agent-browser layers (`browser-use`).

**Product type:** Open-source developer tool, distributed as source plus two macOS `.pkg` installers (a browser-only package and a full package that adds the native bridge). Runs as a local CLI plus a manually loaded browser extension.

**Business model:** `[TK: business model]`. The repo is public and open source, but license identifier, any paid or hosted tier, and monetization are not stated in the sources read. `[TK: license identifier, MIT/Apache/other not confirmed in SKILL.md or README]`.

---

## Positioning Statement

For engineers and AI-agent builders who automate authenticated, real-browser sessions and keep hitting bot detection or forced logouts, **Interceptor** is a Chrome extension that drives your actual logged-in browser from inside the UI, which delivers automation that carries zero CDP fingerprint and keeps your real sessions intact. Unlike CDP-based tools such as Puppeteer, Playwright, and Selenium that attach a debugger a site can detect, Interceptor acts through the browser the way a person does.

---

## Target Audience (ICP and segments with entry states)

The sources describe capabilities, so the segments below are inferred from what the product supports. Firmographics are not grounded in any source and are marked open.

**Segment A: AI-agent builders working behind login walls.**
Entry state: their agent runs on a CDP or headless browser, and the target site either flags it as a bot or logs the session out, so the agent cannot act on authenticated pages. They reach for Interceptor to keep the agent inside a real, logged-in session that passes detection.

**Segment B: QA and release engineers doing real-browser deploy verification and regression.**
Entry state: they need to confirm a deploy renders correctly in real Chrome with real sessions, and a headless CDP browser either misses rendering issues or gets challenged. Interceptor's `VerifyDeploy` and `Reproduce` workflows target exactly this. The `monitor` record-and-replay system lets them turn a real user session into a replayable regression script.

**Segment C: Developers automating canvas-rendered editors.**
Entry state: they are automating Google Docs, Slides, Sheets, Canva, Figma, or Excalidraw, where the app draws to `<canvas>` and there are no DOM selectors to target. Interceptor's scene graph and canvas commands read and drive these editors where DOM automation cannot.

**Segment D: Builders who need OS-level or native-app automation alongside the browser.**
Entry state: web automation alone is not enough; they need OS-trusted synthetic input, a native macOS accessibility tree, or control of a native app. The optional macOS bridge and the newer iOS surface (driving apps on a Developer-Mode iPhone via an on-device XCUITest runner) serve this.

**Segment E: Individual operators automating their own accounts.**
Entry state: a solo developer or power user wants an agent to act as themselves on sites where they are already logged in (for example LinkedIn or ChatGPT, both of which have dedicated commands), without handing over credentials to a separate automated browser.

Open questions on ICP (interview left open, none inferable from source):
- `[TK: buyer role]`: is the primary buyer an individual developer, a QA lead, an AI-platform team, or a growth/ops person?
- `[TK: company size and stage]`: indie/hobbyist vs startup vs enterprise.
- `[TK: industry]`: no industry signal in the sources.
- `[TK: primary segment priority]`: which of A to E is the wedge to lead the page with. The skill's own mandated workflows lean toward B (deploy verification), but that is a signal about the author's use, not confirmed market demand.

---

## Problems and Pain Points

**Core problem:** Modern sites detect and block automated browsers. CDP-driven tools expose a detectable fingerprint (the attached debugger, automation flags, and related signals), so agents get challenged, rate-limited, or logged out on exactly the authenticated pages that matter most.

**Why current approaches fall short:**
- CDP frameworks attach a debugger the site can fingerprint.
- Stealth patches on top of CDP chase individual detection signals and can fall behind as detectors update. `[TK: current pass/fail state of specific stealth patches against specific detectors, not benchmarked in sources]`.
- Headless and separate-instance browsers do not carry your real logged-in session, so they hit login and re-auth friction, and can miss real rendering.

**What it costs them:** time lost to being blocked and to re-authenticating, brittle scripts that break when a detector changes, and flows that simply cannot run behind a login. `[TK: quantified cost, no time or dollar figures in sources]`.

**Emotional tension:** the frustration of an automation that works locally and then gets flagged in the wild, and the unease of pointing a detectable bot at a real account.

---

## Differentiation (the checkable technical wedge)

Every item below traces to `SKILL.md` and/or the README.

- **Extension-based control with no CDP.** Interceptor runs as a Chrome extension that operates through the real browser UI. It attaches nothing to the debugger and sets no automation flag, which is why the browser carries no CDP fingerprint. This is the root claim the rest depends on.
- **Documented bot-detection results.** The skill's Stealth Verification table reports: BrowserScan = Normal, Pixelscan = Definitely Human, Sannysoft = all pass, CreepJS = 0% headless, Fingerprint.com = notDetected, AreYouHeadless = not headless. (Vendor-stated in `SKILL.md`; independent reproduction is `[TK]`.)
- **Real sessions preserved.** It uses your existing cookies and logged-in state, so it reaches authenticated pages without a fresh login.
- **Passive network capture with no CDP fingerprint.** It captures fetch, XHR, SSE, WebSocket, and BeaconAPI traffic by patching JavaScript context, not by attaching CDP. An explicit CDP-attached mode exists as an opt-in that leaves the debugger banner, so the default stays clean.
- **Compound commands.** `interceptor open`, `read`, `act`, and `inspect` each return tree plus text (and network, for `inspect`) in one call, collapsing multi-step flows.
- **Record and replay.** The `monitor` system records a real user session and exports it as a replayable plan script for regression.
- **Scene graph and canvas.** Rich editors that render to `<canvas>` (Google Docs, Slides, Canva, Figma, Excalidraw) are readable and drivable where DOM selectors do not exist.
- **Optional macOS bridge and iOS surface.** The bridge adds OS-trusted input, native macOS accessibility trees, `ScreenCaptureKit` capture of occluded windows, Apple Events, and on-device speech and vision. The iOS surface drives apps on a Developer-Mode iPhone via an on-device XCUITest runner over WiFi. A unified `e1`/`e2` ref system spans DOM and native UI.
- **Honest limitations documented in the skill.** The source openly records current bugs (screenshot ignores scroll position, `--clip` broken in the current build, `eval` CSP-blocked on strict sites, duplicate tabs confuse routing). This is a credibility asset for a security-literate audience and should inform voice.

---

## Competitive Frame

Per-competitor read from `competitor-profiling`, run without live SEO/review data. Each entry covers what the alternative does well, its detectability or limitation relative to Interceptor's wedge, and the wedge Interceptor drives. Quantitative traffic, rating, and adoption figures are `[TK]` for every competitor because Firecrawl and DataForSEO were unavailable.

### Raw Puppeteer / Playwright / Selenium (CDP or WebDriver automation)
- **Does well:** mature, large ecosystems, cross-platform, headless-friendly, CI-native, deep documentation, wide hiring pool, first-class parallelization and cloud grids.
- **Limitation vs Interceptor:** they drive the browser through CDP or WebDriver, which attaches a debugger or sets automation signals a site can fingerprint. They typically run a fresh, separate browser without your logged-in session.
- **Wedge Interceptor drives:** no attached debugger and no automation flag, so no CDP fingerprint, plus it runs inside your real logged-in browser.
- `[TK: head-to-head detection benchmark on live sites]`, `[TK: SEO/adoption metrics]`.

### playwright-stealth / puppeteer-extra-stealth
- **Does well:** patch many known automation tells on top of a familiar framework; easy to adopt if you already run Puppeteer or Playwright; active community evasion knowledge.
- **Limitation vs Interceptor:** they still sit on top of CDP, so they mask individual signals rather than removing the underlying automation surface, and can lag when detectors change.
- **Wedge Interceptor drives:** it removes the CDP surface itself instead of masking tells one at a time.
- `[TK: current pass rate of each patch against CreepJS/Fingerprint.com/BrowserScan]`, `[TK: maintenance cadence comparison]`.

### undetected-chromedriver
- **Does well:** popular Selenium-based path tuned to evade common anti-bot systems; low-friction for existing Selenium users; well known in the scraping community.
- **Limitation vs Interceptor:** it still automates via WebDriver and Chromedriver and patches signals, so a detectable automation surface remains, and it does not natively use your real logged-in browser profile the way an in-browser extension does.
- **Wedge Interceptor drives:** in-browser extension control with real sessions and no WebDriver surface.
- `[TK: comparative detection results]`, `[TK: Python-vs-CLI ergonomics fit for target buyer]`.

### browser-use
- **Does well:** popular agent-browser layer that gives LLM agents a high-level way to act on web pages; good developer momentum in the agent space; abstracts page interaction for agents.
- **Limitation vs Interceptor:** it generally sits on a CDP or automation browser underneath, so it inherits that fingerprint and the separate-session model; its focus is agent ergonomics, not stealth.
- **Wedge Interceptor drives:** the same agent-friendly compound commands, but on a real, undetected, logged-in browser, and with capabilities browser-use does not target (passive network capture, scene graph, record-and-replay, native OS bridge).
- `[TK: feature-by-feature comparison]`, `[TK: adoption metrics]`.

### Commercial anti-bot / scraping services (for example BrightData)
- **Does well:** residential and mobile proxy networks, managed unblocking, and scraping infrastructure built for high-volume, multi-domain data collection at scale, with SLAs and support.
- **Limitation vs Interceptor:** a different job. These services fetch data at scale from the outside; they are not about driving your own real, logged-in, interactive browser session on your own machine. Cost and account model differ.
- **Wedge Interceptor drives:** local, interactive, authenticated automation as yourself, rather than large-scale external data harvesting. (Interceptor's own skill routes batch and at-scale scraping away to Browser and BrightData, so this is a boundary, not a head-to-head.)
- `[TK: pricing comparison]`, `[TK: scale ceiling of Interceptor for volume scraping]`.

---

## Proof Inventory

Real, checkable proof (traces to a source). These may be cited on a page.

1. Extension-based, no-CDP architecture with zero CDP fingerprint. Source: `SKILL.md`, README.
2. Stealth Verification table: BrowserScan Normal, Pixelscan Definitely Human, Sannysoft all pass, CreepJS 0% headless, Fingerprint.com notDetected, AreYouHeadless not headless. Source: `SKILL.md` (vendor-stated).
3. Uses real logged-in sessions and cookies. Source: `SKILL.md`, README.
4. Passive network capture of fetch, XHR, SSE, WebSocket, BeaconAPI without a CDP fingerprint. Source: README, `SKILL.md`.
5. Record-and-replay session monitor that exports a replayable plan script. Source: `SKILL.md`.
6. Scene graph and canvas support for Google Docs, Slides, Canva, Figma, Excalidraw. Source: `SKILL.md`, README.
7. Optional macOS bridge: OS-trusted input, native accessibility trees, `ScreenCaptureKit` capture, Apple Events, on-device speech and vision. Source: `SKILL.md`, README.
8. iOS surface driving Developer-Mode iPhone apps via an on-device XCUITest runner over WiFi. Source: README.
9. Safety controls: panic hotkey, sensitive-field masking, bundle-ID denylist (Keychain, 1Password, System Settings, banking apps), TCC tracking. Source: README.
10. Public repo live (HTTP 200) at `https://github.com/Hacker-Valley-Media/slop-browser`. Source: task-verified, README fetch succeeded.
11. Open source, buildable from source, distributed as browser-only and full `.pkg` installers. Source: `SKILL.md`, README.
12. Limitations documented candidly (screenshot scroll, `--clip` broken, `eval` CSP, duplicate-tab routing). Source: `SKILL.md`. Usable as an honesty and credibility proof.

Unverifiable items (do not state as fact without grounding first):

- `[TK: GitHub stars / forks / watchers count]`
- `[TK: install or download counts, active users]`
- `[TK: named customers or logos]`
- `[TK: testimonials or user quotes]` (voice-of-customer belongs in `voc.md`, produced separately; none are manufactured here)
- `[TK: head-to-head detection benchmark numbers vs playwright-stealth / undetected-chromedriver on live sites]`
- `[TK: speed, latency, or throughput benchmarks]`
- `[TK: contributor count, release cadence, community size]`
- `[TK: license identifier]`
- `[TK: maintainer or company identity beyond the "Hacker-Valley-Media" org]`
- `[TK: SEO/traffic/backlink metrics for Interceptor and every competitor]`
- `[TK: independent third-party reproduction of the Stealth Verification results]`

---

## Switching Dynamics (Four Forces)

**Push (away from current tool):** automation gets flagged, challenged, or logged out on authenticated pages; stealth patches need constant upkeep as detectors change; separate-instance browsers add re-auth friction and miss real rendering.

**Pull (toward Interceptor):** no CDP fingerprint by architecture, real sessions kept intact, one CLI with compound commands, plus capabilities the others do not bundle (passive network capture, record-and-replay, scene graph, native OS bridge).

**Habit forces (what keeps someone on their current tool):**
- Existing test suites and scripts already written against Puppeteer, Playwright, or Selenium; rewriting is real work.
- Mature ecosystems, documentation, and a large hiring pool lower the perceived cost of staying.
- CI-native, headless, cross-platform pipelines already provisioned (Selenium Grid, hosted Playwright, cloud runners).
- Team muscle memory and a familiar Python or Node API surface.
- Interceptor needs a real Chrome or Brave window running with the extension loaded, which does not drop cleanly into an existing Linux headless CI job.

**Anxiety forces (what makes someone hesitate to switch):**
- Requires a real browser running with the extension loaded manually through developer mode; the CI-headless story is unclear. `[TK: supported CI / headless / cross-platform story]`.
- Automation runs against your real logged-in accounts, which feels riskier than a throwaway session.
- The optional macOS bridge exposes a UNIX socket with no authentication; any local process running as you can drive OS-level input, and the source names a supply-chain risk. This needs a clear, honest treatment on the page.
- Repo name `slop-browser` and unknown maturity; `[TK: adoption and stability signals]` make it read as early-stage.
- Manual extension load, `.pkg` installers, and macOS TCC permission grants add setup friction.
- Documented current bugs (screenshot scroll, `--clip`) signal an early build.
- Mac-centric bridge and iOS surface; `[TK: Windows/Linux support for the browser surface]`.

*(These Habit and Anxiety forces feed the objection map in the next phase.)*

---

## Anti-Persona (who this page is allowed to turn away)

- Anyone needing batch headless scraping at scale with residential proxies. The Interceptor skill itself routes that work to Browser and BrightData. This page should send them there rather than pretend to serve them.
- Teams doing large-scale, multi-domain crawling and data harvesting for volume, where proxy rotation and managed unblocking matter more than acting as a real logged-in user.
- Pure Linux or Windows CI pipelines with no interactive desktop and no real browser session to attach to. `[TK: confirm whether any headless or server mode exists]`.
- Users who specifically want an isolated, disposable browser instance separate from their real profile, rather than automation that acts as themselves.

---

## Brand Voice

**Tone:** technical, precise, plainspoken, security-aware. Credible to engineers who will read the code before they trust it. The source's candor about limitations sets the register: state what it does, name what it does not, cite the check.

**Style:** declarative and specific. Show the command, show the result. Prefer a concrete capability over an adjective.

**Personality (inferred, four adjectives):** exacting, honest, low-hype, builder-to-builder. `[TK: confirm brand personality with owner]`.

**Anti-references (what the page must never sound or look like):**
- A generic AI-SaaS landing page with vague benefit copy and stock gradients.
- Hype-heavy scraping marketing that promises it beats every bot check.
- A gray-hat "beat any bot check" aesthetic that reads as a botting product.
- An enterprise buzzword deck with no runnable commands on the page.
- `[TK: confirm visual anti-references and any brand assets with owner]`.

---

## Goals

- `[TK: primary business goal]`: not stated in sources (adoption, contributors, funnel to a paid tier all unknown).
- `[TK: key conversion action]`: likely install-from-source or a GitHub visit, but not confirmed.
- `[TK: current metrics]`: none available.

---

## Open Questions Carried Forward (for the interview and next phases)

1. `[TK: primary segment to lead with]` (A to E above).
2. `[TK: buyer role, company size, stage, industry]`.
3. `[TK: business model, license, pricing]`.
4. `[TK: adoption proof]` (stars, installs, users, named customers, testimonials).
5. `[TK: benchmark comparisons]` vs stealth patches and undetected-chromedriver on live detectors.
6. `[TK: CI / headless / Windows / Linux support]` for the browser surface.
7. `[TK: independent verification]` of the Stealth Verification table.
8. `[TK: brand personality and visual anti-references]` confirmation.
9. `[TK: maintainer or company identity and support model]`.
10. `[TK: competitor SEO/traffic/review metrics]` (needs Firecrawl and DataForSEO).
