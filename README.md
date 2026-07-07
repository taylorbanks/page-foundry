# page-foundry

A gated pipeline for product homepages, landing pages, and sales pages. One brief in; one shipped page out, or a complete copy-and-design handoff package for a design tool. Built for people who ship many pages across many products and want every one converting, accessible, fast, honest, and in their own voice.

## Why it exists

Agents write pages fine. Without structure they will not: hold one voice across fifty pages, apply conversion research instead of guesswork, refuse to invent testimonials, catch copy that quietly disqualifies qualified buyers, or stop a page from shipping because a contrast ratio failed. page-foundry is that structure. Every gate in it exists because a real page failed without it.

## What it does

Seven phases with hard gates between them. Preflight detects companion skills across every install channel (skills CLI, Claude Code plugins, project and global directories), checks them for updates, and installs or updates only with your approval, only from pinned sources. Intake produces a durable product-marketing brief per product; a PRD is source material, never the brief. Then message architecture, a page spec against one of eight archetypes, copy under a mechanical voice gate whose rules live in an editable file, design direction with persistent per-property tokens, and build or handoff.

Eight ship gates follow: conversion audit (MECLABS-scored, with a red-team read per buyer entry state), voice scan at zero tolerance, accessibility, performance, render review, AI discovery (schema, llms.txt), measurement, and integrity: no fabricated proof, ever. Every run writes to a per-property log that the next run reads; open items and learnings carry forward, and conversion data must change a decision or the run says why it did not.

Archetypes: oss-project, saas-homepage, campaign-landing, mobile-app, course-sales, membership-community, newsletter-capture, personal-home, plus a mapper with composition rules for pages that straddle. Modes: `build` (ships static HTML), `explore` (contrasting design variants first, pick, then build), `handoff` (a verbatim-copy-protected package for Claude Design or any design tool, with acceptance criteria).

## Install

```bash
npx skills add taylorbanks/page-foundry
```

Or as a Claude Code plugin: `claude plugin marketplace add taylorbanks/page-foundry`, then `claude plugin install page-foundry@page-foundry`. For claude.ai, upload the `.skill` file from the latest release.

## First run

Run `/page-foundry` with no arguments for orientation. Then say "set up my voice": a short wizard rewrites the voice rules file, which also drives the mechanical scanner, so writing guidance and enforcement cannot drift apart. Until then a neutral default register applies.

## Built on

page-foundry is an orchestrator. It exists because these projects do the heavy lifting, and it would be a lesser tool without every one of them:

- [marketingskills](https://github.com/coreyhaines31/marketingskills) by [Corey Haines](https://www.corey.co): the product-marketing context architecture this skill's brief format is compatible with, plus the copywriting, CRO, customer-research, pricing, and psychology skills that power Phases 0 through 3 and the conversion gate.
- [Anthropic's skills](https://github.com/anthropics/skills): frontend-design, the design philosophy behind Phase 4 and the reason output does not look like every AI page; theme-factory; web-artifacts-builder; and skill-creator, which was used to build this skill.
- [web-design-guidelines](https://github.com/vercel-labs/agent-skills) by Vercel Labs: the accessibility, typography, imagery, and UX rule set wired into the design phase and the render gate.
- [gstack](https://github.com/garrytan/gstack) by Garry Tan: design consultation, the variant shotgun behind explore mode, and visual review.
- [Remotion](https://www.remotion.dev): hero demo clips and motion assets in Phases 2 and 5.
- The [MECLABS Institute](https://meclabs.com) Conversion Sequence heuristic: the scoring rubric inside the conversion gate.
- The [skills CLI and skills.sh](https://skills.sh) by Vercel: the distribution rails this repo ships on.

All of these are optional at runtime; the skill degrades to condensed built-in rules when they are absent. They are foundational in every other sense. Install them.

## Security

Skills execute with your agent's permissions. Read SKILL.md and `scripts/voice_scan.py` before installing; the script is standard-library Python, no network calls, no subprocesses, no dependencies. The skill installs companions only from the pinned sources named in its table, only with your explicit approval, never from search results. See SECURITY.md for reporting. Written by a security practitioner who assumes you will not take any of that on faith.

## License

MIT. See LICENSE.
