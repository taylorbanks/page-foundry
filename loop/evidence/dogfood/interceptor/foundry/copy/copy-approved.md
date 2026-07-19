# copy-approved.md: Interceptor (frozen snapshot)

The frozen copy for the Interceptor page, in page order, as the copy-fit pass fitted it to the chosen design direction (Plan A) after the Phase 4.5 comp rounds. This is the snapshot the gates read: Gate 2 diffs the built page's rendered text against it, and Gate 6 diffs the built head against the `<title>` and meta description below. Phase 5 builds this verbatim.

What the copy-fit pass changed from `approved-draft.md`: the hero finalist was confirmed against the real hero form (`hero-candidates.md`, copy-fit re-pick); the S5 safety controls and the S7 disqualifiers were presented as lists to meet their confirmed shapes (`tokens/selection.md`: S5 short safety list, S7 not-for list), same words re-presented, which took the one planned voice-chain re-entry. No claim was rewritten and nothing was trimmed: the compressed density held the draft at both widths in the comp.

Every proof element is sourced to the brief or marked `[TK]`; no proof is fabricated. The exact install command and the quickstart output are `[TK]` until DOGFOOD-6 captures them against the live tool, at which point they resolve and re-snapshot here per the Phase 3 step 5 re-entry rule.

---

**`<title>`:** Interceptor: real-browser automation, no CDP fingerprint

**meta description:** Interceptor drives your real, logged-in Chrome from inside the browser UI, with no CDP fingerprint, so sites don't flag your automation as a bot.

---

## S1. Hero

# Automate a real browser sites don't flag

Interceptor is a Chrome extension that drives your own logged-in browser from inside the browser UI, so your agents and scripts run with no CDP fingerprint and your real sessions stay intact.

`[TK: browser-only install command, confirmed against the repo README at build]`

Stealth checks, vendor-stated: BrowserScan Normal, Pixelscan Definitely Human, CreepJS 0% headless, Fingerprint.com notDetected. Independent reproduction is `[TK]`.

Docs · GitHub · Community

## Answer block (placed right after the hero)

Interceptor is an open-source Chrome extension that lets an AI agent or script drive your real, logged-in browser from inside the browser UI. Because it works through the extension rather than the DevTools Protocol, the browser carries no CDP fingerprint and keeps your existing sessions. It is built for engineers automating authenticated, detection-sensitive work.

## S2. Problem

You automate an authenticated page, the run works on your machine, and then the real site flags it as a bot or logs it out.

## S3. Mechanism

Most automation tools drive Chrome through the DevTools Protocol. That attached debugger is itself the signal detectors read, so connecting is already the tell. Interceptor works as an ordinary Chrome extension instead. Nothing attaches to the debugger and no automation flag is set, so the browser has no CDP surface for a site to fingerprint. It takes that surface away rather than patching over it one tell at a time. A patch that passes a detector today can fail after the next detector update, because it hides a tell instead of removing the surface those tells live on. That is why `playwright-stealth` and `undetected-chromedriver`, which still sit on CDP or WebDriver, keep needing upkeep.

## S4. Quickstart

The whole surface is one command. `interceptor open <url>` returns a page's structure and its visible text together in a single call, so an agent takes in a page without a second round trip. `read`, `act`, and `inspect` follow the same shape.

Here is the tool doing real work, command and output captured from the live build:

`[TK: real quickstart command and its real output, captured at build (DOGFOOD-6)]`

There is more here than stealth. Interceptor also does passive network capture of fetch, XHR, SSE, and WebSocket traffic, record-and-replay of real sessions as scripts, a scene graph for canvas editors like Google Docs and Figma, and OS-level control through an optional macOS bridge.

## S5. Data handling and safety

Interceptor drives the browser you are already signed into, so your cookies and logged-in sessions stay on your machine and never move to a separate automated profile. There are real controls around that:

- A panic hotkey to stop a run
- Masking on sensitive fields
- A bundle-ID denylist that keeps automation away from Keychain, 1Password, System Settings, and banking apps

Every macOS permission the tool takes is tracked.

One limit, stated plainly: the optional macOS bridge opens a local socket with no authentication, so any process running as you could drive OS-level input through it. The browser-only package ships without the bridge, so if you do not want OS-level control you never load that surface.

## S6. Honest comparison

Against a CDP framework or a stealth patch, the difference is maintenance. There is no evasion patchset to keep current, because there is no CDP surface to hide. What you give up is real, and worth saying: Interceptor needs a real Chrome or Brave window open, the macOS bridge is Mac-centric, and the CI and headless story for the browser surface is `[TK]`. If your work is batch headless scraping at scale, a stealth patch or a proxy service is the better fit.

## S7. Not for

Interceptor is not for everyone. This is the wrong tool if you need:

- Large-scale multi-domain crawling
- Batch headless scraping behind residential proxies
- A pure Linux or Windows CI job with no desktop

Interceptor's own docs point that work to Browser and BrightData. It is built for interactive, authenticated automation on a browser you actually use.

## S8. Why now

You are not the only one moving off CDP. A visible group of builders is now shipping non-CDP browser control on purpose, at the rendering-engine level and as in-browser extensions, because CDP is what gets detected. Examples raised in the same discussions include felarof's C++ rendering-engine APIs, Intuned, Browser Cash, and pydoll. Interceptor is one answer to a problem the field has started to name out loud.

## S9. Project status

Interceptor is open source and builds from source. The repo is public at github.com/Hacker-Valley-Media/slop-browser, with open issues and current limitations documented in the open. That documented bug list is a credibility signal for a reader who checks the code first. Star count, release cadence, and contributor numbers are `[TK]` here, so this page does not quote them.

## S10. FAQ

**The repo is named `slop-browser`. Is this a serious tool?** The name is self-deprecating; the code is open, and its own limitations (a scroll-position bug in screenshots, a broken `--clip`, `eval` blocked by strict CSP) are written down in the docs rather than hidden. You can read it and build it before you trust it.

**Does it run on Windows or Linux, or in headless CI?** The browser-only surface targets Chrome or Brave on your desktop. Windows and Linux support and a headless CI mode are `[TK]` and not claimed here.

**What is the license?** `[TK: license identifier]`. The repo is public; confirm the license in its `LICENSE` file before you depend on it.

## S11. Close

Point your automation at a real browser and stop fighting bot detection. The stealth checks and the quickstart above are the proof, and the install is one command.

`[TK: browser-only install command, confirmed against the repo README at build]`

Docs · GitHub · License · Security
