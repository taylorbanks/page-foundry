# page-foundry

**Every product you ship needs a page, and every page has to convert.** page-foundry turns one brief into a finished homepage, landing page, or sales page: researched, written in your voice, fast, accessible, and honest. Not a page that looks like every other AI page. A page that performs.

One command puts a marketer, a copywriter, a conversion specialist, and a designer on every page you build, then checks the result so slop cannot ship.

## The problem it solves

You ship a lot of pages. New product, new landing page, new launch, new course. An agent will write each one, and each one comes out a little different: a different voice, a different structure, conversion by guesswork, and the same generic look every other AI is producing right now. Some of those pages will quietly talk a qualified buyer out of buying. None of them will stop themselves from inventing a testimonial you never got.

page-foundry fixes the process, not the sentence. The same voice across fifty pages. Conversion decisions from published research instead of taste. Copy a real buyer would believe. And a hard line against fabricated proof.

## What you get

- **A page that converts by method, not luck.** Structure and copy follow conversion research: one clear action, message matched to the traffic, proof sitting next to every claim. The finished page is scored against the MECLABS Conversion Sequence before it ships.
- **One voice across everything.** Your writing rules live in a file that a scanner enforces, so page forty sounds like page one. No drift, no re-explaining your brand every time.
- **Output that does not read or look AI-made.** A voice scan rejects the vocabulary that marks machine-written copy; the design phase rejects the visual defaults (the purple gradient, the three identical icon cards, the stock blobs) that make an AI page obvious in a glance.
- **Proof stays honest.** It will not invent a testimonial, a logo, a download count, or a statistic. If your proof is thin, it builds the page around what is real and tells you what to go collect.
- **Accessible and fast, checked not promised.** Contrast, keyboard access, semantic markup, a page-weight budget, and a load target are gates the page has to clear, not good intentions.
- **A page you own.** Static HTML you host anywhere, or a clean copy-and-design package for a design tool. You are not locked into a platform.

## Whatever page you need

Eight page types, each with a structure that fits how that page actually gets bought: open source project, SaaS homepage, campaign landing page, mobile app, course or workshop sales page, membership or community, newsletter signup, personal site. A page that straddles two gets composed from both.

Three ways to run it:

- **build**: one brief in, a finished page out.
- **explore**: contrasting design directions first; you pick, then it builds the winner.
- **handoff**: a complete copy-and-design package for Claude Design or any design tool, with acceptance criteria.

## How it gets that quality

page-foundry is an orchestrator. It does not reinvent marketing; it runs the best skills that already exist, in the right order, and refuses to ship what does not pass. Positioning, copy, conversion, and psychology come from a proven marketing skill set. Design direction comes from real design guidelines, not a model's guess at "modern." Every page then runs a set of checks that a page failing on voice, conversion, accessibility, honesty, or performance cannot get past. That last part is the point: the tests exist so that "an AI wrote it" never shows.

## Install

Star the repo if this is useful to you (it helps other builders find it), then add the skill:

```bash
npx skills add taylorbanks/page-foundry
```

Also available as a Claude Code plugin (`claude plugin marketplace add taylorbanks/page-foundry`, then `claude plugin install page-foundry@page-foundry`), or as a `.skill` upload on claude.ai from the latest release.

## First run

Run `/page-foundry` with no arguments for a quick orientation. Then say "set up my voice": a short wizard writes your voice rules, which also drive the scanner, so your writing guidance and the enforcement can never drift apart. Until then a neutral default applies.

## Built on

These projects do the heavy lifting. page-foundry does the sequencing and the checking, and it is a lesser tool without any of them. All optional at runtime; the skill degrades to built-in condensed rules when they are absent. Install them anyway.

- [marketingskills](https://github.com/coreyhaines31/marketingskills) by [Corey Haines](https://www.corey.co): the product-marketing, copywriting, CRO, customer-research, pricing, and psychology skills that do the marketing work.
- [Anthropic's skills](https://github.com/anthropics/skills): frontend-design, the reason the output does not look like every AI page; theme-factory; web-artifacts-builder; and skill-creator, used to build this one.
- [web-design-guidelines](https://github.com/vercel-labs/agent-skills) by Vercel Labs: the accessibility, typography, and UX rules the design phase and the render check follow.
- [gstack](https://github.com/garrytan/gstack) by Garry Tan: design consultation, the variant shotgun behind explore mode, and visual review.
- [Remotion](https://www.remotion.dev): hero demo clips and motion, when a page earns them.
- The [MECLABS Institute](https://meclabs.com) Conversion Sequence heuristic: the scoring behind the conversion check.
- The [skills CLI and skills.sh](https://skills.sh) by Vercel: the rails this ships on.

## Security

Skills run with your agent's permissions. page-foundry ships one executable: `scripts/voice_scan.py`, standard-library Python, no network, no subprocess, no dependencies. Read it before you install. The skill installs companions only from the pinned sources in its table, only with your approval, never from search results. See SECURITY.md for reporting. Written by a security practitioner who assumes you will not take any of that on faith.

## License

MIT. See LICENSE.
