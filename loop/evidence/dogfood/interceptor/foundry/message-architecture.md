# message-architecture.md: Interceptor (page-foundry Phase 1 dogfood)

Message architecture for the Interceptor page, built in Phase 1 from `product-marketing.md`, `voc.md`, and `persuasion-map.md` in this directory. The hierarchy order follows the ranked themes in `voc.md`; the objection map is built from the brief's Switching Dynamics and bounded by its anti-persona; the proof inventory carries every real proof and marks the rest `[TK]`. This is a build run and not a rewrite, so there is no `rewrite-diagnosis.md` and no closing diff against a current page.

## Positioning

For engineers and AI-agent builders who automate authenticated, real-browser sessions and keep getting flagged as a bot or logged out, Interceptor is a Chrome extension that drives your own logged-in browser from inside the UI, giving you automation with no CDP fingerprint and your real sessions intact, unlike Puppeteer, Playwright, and Selenium, which attach a debugger a site can detect.

The named alternative (Puppeteer, Playwright, Selenium) is profiled in the brief's competitive frame, so the sentence names nothing the frame did not cover.

## Message hierarchy

Priority follows the `voc.md` theme ranking. The lead claim answers the top-ranked theme (detection and blocking); the mechanism claim answers theme 2 (CDP is the tell); the rest follow in theme order. Each claim is specific enough that a reader could check it and find it wrong.

1. **Lead: your automation runs on a real browser that sites do not flag as a bot.** Interceptor drives the actual Chrome or Brave window through an extension, with no debugger attached and no automation flag set, so the browser carries no CDP fingerprint. Check: the Stealth Verification table (BrowserScan Normal, Pixelscan Definitely Human, CreepJS 0% headless, Fingerprint.com notDetected), vendor-stated in `SKILL.md`, independent reproduction `[TK]`. Answers theme 1.

2. **The reason it holds: Interceptor removes the CDP surface rather than patching over it.** CDP is the signal detectors key on, and connecting at all is the tell. Interceptor takes that surface away instead of masking tells one at a time the way a stealth patch does. Check: the contrast with `undetected-chromedriver` and `playwright-stealth`, which still sit on CDP or WebDriver (brief differentiation section). Answers theme 2.

3. **Your real logged-in sessions stay intact.** It uses your existing cookies and logged-in state, so it reaches authenticated pages without a fresh login and without pointing a detectable bot at your account. Check: real-session capability in `SKILL.md` and README (proof 3). This claim rests on the product capability, not on the session-loss theme, which is Low confidence in `voc.md`; see the ordering note below.

4. **Nothing to maintain against a moving detector.** Because the mechanism is the absent CDP surface and not a set of patches, there is no evasion patchset to keep updating as detectors change. Check: the maintenance-burden theme in `voc.md` (theme 3) states the cost the architecture avoids, and the claim is falsifiable by any detector that flags the browser, which is why the vendor-stated table matters and its independent reproduction is tracked as `[TK]`.

5. **One CLI, and more than stealth.** A single `interceptor` command gives you compound calls like `open`, `read`, `act`, and `inspect`. Beyond the browser it does passive network capture, a record-and-replay session monitor, a scene graph for driving canvas editors, and an optional native bridge for OS-level control. The stealth tools do not bundle any of that. Check: each capability traces to `SKILL.md` or README (proof inventory 4 to 9).

### Ordering note (decision recorded per the Phase 1 rule)
The session and login-loss theme (theme 5) carries the newest quote in `voc.md` (2026-05-30) but is Low confidence, a single source. The ranking rule keeps it out of the lead however recent its quote reads. It informs claim 3 (real sessions), which stands on its own product proof regardless of the theme's weight, so that claim's placement is by product strength and not by the theme's recency. Themes 3 and 4 (stealth-maintenance burden, cat-and-mouse arms race) set claim 4 and the O5 objection answer.

## Objection map

Each objection is a reason this exact buyer says no, drawn from the brief's Switching Dynamics (every Habit and Anxiety force) and bounded by the anti-persona. The answer is the proof or copy move that meets it.

**O1. The buyer already runs a Playwright or Selenium suite in headless CI, and Interceptor needs a real browser window.** (Habit: existing suites, mature tooling and docs, CI-native pipelines, team muscle memory. Anxiety: the real-browser and extension requirement, an unclear CI-headless story.)
Answer: do not claim a wholesale replacement. Name the job Interceptor wins, the authenticated, detection-sensitive, real-session work where headless CDP gets flagged or logged out, and route batch headless CI elsewhere. The anti-persona turns away pure Linux or Windows CI with no interactive desktop, so this is a deliberate scope line and not a gap the copy hides. Honesty bound: the CI, headless, and cross-platform story for the browser surface is `[TK]` in the brief and stays `[TK]` on the page; the page does not imply a headless mode it cannot confirm.

**O2. Running automation against a real logged-in account could get it flagged or banned.** (Anxiety: real-account risk. Theme 5: session and login loss.)
Answer: the browser presents no automation signal, so the session reads as a person using their own browser (Stealth Verification table, vendor-stated, independent reproduction `[TK]`). Pair the no-fingerprint claim with the safety controls as proof: a panic hotkey, sensitive-field masking, a bundle-ID denylist covering Keychain, 1Password, System Settings, and banking apps, and TCC tracking (proof 9). Do not overstate; the table is vendor-stated and the page says so.

**O3. The macOS bridge exposes an unauthenticated local socket, so any local process running as the user can drive OS-level input.** (Anxiety: the UNIX socket with no auth and the named supply-chain risk.)
Answer: state it plainly, because the source states it first and candor is the lever for this buyer (pratfall, per `persuasion-map.md`). The bridge is optional, and the browser-only package ships without it, so a reader who does not want OS-level control never loads that surface. The socket is local-only. This is a real limitation carried under the integrity rule, not softened.

**O4. This reads early-stage: the repo is named `slop-browser`, it documents its own bugs, and its maturity is unknown.** (Anxiety: repo name, documented current bugs, setup friction from manual extension load, `.pkg` installers, and TCC grants.)
Answer: the documented limitations are the honesty proof for an audience that reads code before trusting it (proof 12, pratfall again). It is open source and buildable from source, so the reader checks the claims instead of taking them on faith. Adoption and stability signals (stars, contributors, release cadence) are `[TK]` and are not invented to look bigger. Setup friction is met by leading with the shortest path, the browser-only package, and a documented first command.

**O5. My stealth patch works fine for me today.** (The "this doesn't apply to me" objection for a qualified buyer in a good position. Themes 3 and 4: stealth-maintenance burden, cat-and-mouse arms race.)
Answer: the patch that passes a detector today fails after the next detector update, because it masks individual tells rather than removing the surface they read. The buyer's own watering holes say this: stealth measures get caught over time, and the market is tool-hopping to keep up (`voc.md` themes 3 and 4). The wedge is that there is no surface left to catch up with. Anti-persona bound from the other side: a buyer doing batch headless scraping at scale with residential proxies is genuinely not the reader here, and the page sends them to Browser or BrightData rather than pretending to serve them.

### Switching forces accounting
Every Habit and Anxiety force in the brief lands above: existing suites, mature tooling, CI-native pipelines, and muscle memory in O1; real-account risk in O2; the unauthenticated socket and supply-chain risk in O3; repo name, documented bugs, and setup friction in O4. One force is not yet closable, the Windows and Linux support question for the browser surface: it is `[TK]` in the brief, so it goes to the run's open items rather than getting an answer the sources cannot support.

## Proof inventory

Real, checkable proof (may be cited on the page):
1. Extension-based, no-CDP architecture with zero CDP fingerprint (`SKILL.md`, README).
2. Stealth Verification table: BrowserScan Normal, Pixelscan Definitely Human, Sannysoft all pass, CreepJS 0% headless, Fingerprint.com notDetected, AreYouHeadless not headless (`SKILL.md`, vendor-stated).
3. Uses real logged-in sessions and cookies (`SKILL.md`, README).
4. Passive network capture of fetch, XHR, SSE, WebSocket, BeaconAPI with no CDP fingerprint (README, `SKILL.md`).
5. Record-and-replay session monitor exporting a replayable plan script (`SKILL.md`).
6. Scene graph and canvas support for Google Docs, Slides, Canva, Figma, Excalidraw (`SKILL.md`, README).
7. Optional macOS bridge: OS-trusted input, native accessibility trees, `ScreenCaptureKit` capture, Apple Events, on-device speech and vision (`SKILL.md`, README).
8. iOS surface driving Developer-Mode iPhone apps via an on-device XCUITest runner over WiFi (README).
9. Safety controls: panic hotkey, sensitive-field masking, bundle-ID denylist, TCC tracking (README).
10. Public repo live at `https://github.com/Hacker-Valley-Media/slop-browser` (task-verified HTTP 200).
11. Open source, buildable from source, browser-only and full `.pkg` installers (`SKILL.md`, README).
12. Limitations documented candidly, usable as an honesty proof (`SKILL.md`).

Marked `[TK]` (never stated as fact without grounding first):
- `[TK: GitHub stars, forks, watchers]`
- `[TK: install or download counts, active users]`
- `[TK: named users or logos]`
- `[TK: testimonials]` (voice-of-customer is in `voc.md`; none are manufactured)
- `[TK: head-to-head detection benchmark vs playwright-stealth and undetected-chromedriver on live detectors]`
- `[TK: independent reproduction of the Stealth Verification table]`
- `[TK: license identifier and business model]`
- `[TK: CI, headless, Windows, and Linux support for the browser surface]`
- `[TK: maintainer or company identity beyond the Hacker-Valley-Media org]`

## Run inputs carried forward
- The customer-research theme ranking was reviewed and finalized this phase. `voc.md` was not thin (twelve verbatim quotes across Hacker News, GitHub, and Stack Overflow, five ranked themes, three at High confidence), so no additional discovery pass was triggered. The finalization note is recorded in `voc.md`.
- Open item raised this phase: the Windows and Linux support question for the browser surface has no sourced answer, and it is carried to the run's open items for Phase 2 and Gate 8.

---
Provenance: built from `product-marketing.md`, `voc.md`, and `persuasion-map.md` in this directory. Every claim traces to a brief field or a ranked theme; every proof is sourced or marked `[TK]`. No proof is fabricated.
