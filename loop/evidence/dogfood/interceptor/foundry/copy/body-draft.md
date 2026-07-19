# body-draft.md: Interceptor (page-foundry Phase 3 dogfood)

Copywriting's first draft, produced by invoking `marketing-skills:copywriting` to write the body section by section against `page-spec.md` (Candidate A order, sections S1 to S11) and `message-architecture.md`, in the register of `references/voice.md`. This is the draft before copy-editing and the voice chain; it carries the roughness those passes exist to resolve (a few AI-pattern WARNs, one or two sentences that do not earn their place, one vague phrase for the Specificity sweep). It is FAIL-free on the scanner (no banned words, no em or en dashes); the WARNs are resolved in `process.md` and the result is `approved-draft.md`. Every claim traces to the message architecture; every proof element is sourced or marked `[TK]`.

## Meta (drafted first, voiced like the rest)

- **`<title>`:** Interceptor: real-browser automation, no CDP fingerprint
- **meta description:** Interceptor is a Chrome extension that drives your real, logged-in browser from inside the UI. It carries no CDP fingerprint, so sites do not flag your automation as a bot.

## S1. Hero

**Headline:** Automate a real browser sites don't flag

**Subhead:** Interceptor is a Chrome extension that drives your own logged-in browser from inside the browser UI, so your agents and scripts run with no CDP fingerprint and your real sessions stay intact.

**Install (primary CTA):** `[TK: browser-only install command, confirmed against the repo README at build]`

**Proof beside the CTA:** Stealth checks, vendor-stated: BrowserScan Normal, Pixelscan Definitely Human, CreepJS 0% headless, Fingerprint.com notDetected. Independent reproduction is `[TK]`.

**Secondary links:** Docs · GitHub · Community

## Answer block (ai-seo, placed right after the hero)

Interceptor is an open-source Chrome extension that lets an AI agent or script drive your real, logged-in browser from inside the browser UI. Because it works through the extension rather than the DevTools Protocol, the browser carries no CDP fingerprint and keeps your existing sessions. It is built for engineers automating authenticated, detection-sensitive work.

## S2. Problem (one line)

You automate an authenticated page, the run works on your machine, and then the real site flags it as a bot or logs it out.

## S3. Mechanism (how it works)

Most automation tools drive Chrome through the DevTools Protocol. That attached debugger is itself the signal detectors read, so connecting is already the tell. Interceptor works as an ordinary Chrome extension instead. Nothing attaches to the debugger and no automation flag is set, so there is no CDP surface left for a site to fingerprint. It's not a stealth patch layered on top of CDP, it's the CDP surface taken away. A patch that passes a detector today can fail after the next detector update, because it hides one tell at a time instead of removing the surface those tells live on. That is why `playwright-stealth` and `undetected-chromedriver`, which still sit on CDP or WebDriver, keep needing upkeep.

## S4. Quickstart (see it work)

The whole surface is one command. `interceptor open <url>` opens the page, reads its structure, and returns the visible text in a single call, so an agent takes in a page without a second round trip. `read`, `act`, and `inspect` follow the same shape.

Here is the tool doing real work, command and output captured from the live build:

`[TK: real quickstart command and its real output, captured at build (DOGFOOD-6)]`

There is more here than stealth. Interceptor also does passive network capture of fetch, XHR, SSE, and WebSocket traffic, record-and-replay of real sessions as scripts, a scene graph for canvas editors like Google Docs and Figma, and OS-level control through an optional macOS bridge.

## S5. Data handling and safety

Interceptor drives the browser you are already signed into, so your cookies and logged-in sessions stay on your machine and never move to a separate automated profile. A panic hotkey stops a run at once. Sensitive fields are masked. A bundle-ID denylist keeps automation away from your most sensitive apps, and every macOS permission the tool uses is tracked.

One limit, stated plainly: the optional macOS bridge opens a local socket with no authentication, so any process running as you could drive OS-level input through it. The browser-only package ships without the bridge, so if you do not want OS-level control you never load that surface.

## S6. Honest comparison

Interceptor's advantage over a CDP framework or a stealth patch is maintenance. There is no evasion patchset to keep current, because there is no CDP surface to hide. What you give up is real, and worth saying: Interceptor needs a real Chrome or Brave window open, the macOS bridge is Mac-centric, and the CI and headless story for the browser surface is `[TK]`. If your work is batch headless scraping at scale, a stealth patch or a proxy service is the better fit.

## S7. Not-for line

Interceptor is not for everyone. If you need large-scale multi-domain crawling, or batch headless scraping behind residential proxies, or a pure Linux or Windows CI job with no desktop, this is the wrong tool, and Interceptor's own docs point that work to Browser and BrightData. It is built for interactive, authenticated automation on a browser you actually use.

## S8. Why now (category validation)

You are not the only one moving off CDP. A visible group of builders is now shipping non-CDP browser control on purpose, from custom rendering-engine APIs to in-browser extensions, because CDP is what gets detected. Examples raised in the same discussions include felarof's C++ rendering-engine APIs, Intuned, Browser Cash, and pydoll. This matters more than it might seem. Interceptor is one answer to a problem the field has started to name out loud.

## S9. Project status (is it alive)

Interceptor is open source and builds from source. The repo is public at github.com/Hacker-Valley-Media/slop-browser, with open issues and current limitations documented in the open. The documented bug list serves as a credibility signal for a reader who checks the code first. Star count, release cadence, and contributor numbers are `[TK]` here, so this page does not quote them.

## S10. FAQ (leftovers only)

**The repo is named `slop-browser`. Is this a serious tool?** The name is self-deprecating; the code is open, and its own limitations (a scroll-position bug in screenshots, a broken `--clip`, `eval` blocked by strict CSP) are written down in the docs rather than hidden. You can read it and build it before you trust it.

**Does it run on Windows or Linux, or in headless CI?** The browser-only surface targets Chrome or Brave on your desktop. Windows and Linux support and a headless CI mode are `[TK]` and not claimed here.

**What is the license?** `[TK: license identifier]`. The repo is public; confirm the license in its `LICENSE` file before you depend on it.

## S11. Close

Point your automation at a real browser and stop fighting bot detection. The stealth checks and the quickstart above are the proof, and the install is one command.

`[TK: browser-only install command, confirmed against the repo README at build]`

**Links:** Docs · GitHub · License · Security
