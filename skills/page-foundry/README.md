# page-foundry

**One brief in, a finished page out.** page-foundry produces homepages, landing pages, and sales pages that convert, hold one voice across every product you ship, stay accessible and fast, and never fabricate proof. It runs the best marketing and design skills available behind one command, then checks the output so an AI page never ships looking like one.

**Install:** unzip the `.skill` into `~/.claude/skills/page-foundry/` (Claude Code) or upload the `.skill` file (claude.ai). Run `/page-foundry` with no arguments for orientation: three modes (build, explore, handoff), eight page types, and example invocations.

**First run:** set the voice. Say "set up my voice" and the wizard writes `references/voice.md`, which also drives the scanner (`scripts/voice_scan.py`), so your writing guidance and the enforcement stay in sync. Until then a neutral default applies.

**What it makes:** open source project, SaaS homepage, campaign landing page, mobile app, course or workshop sales page, membership or community, newsletter signup, or personal site. Build mode ships static HTML you own; explore mode gives you design directions to pick from; handoff mode packages copy and design for a design tool.

**Companions (two tiers):** seven are core and required: product-marketing, customer-research, marketing-psychology, cro, copywriting (coreyhaines31/marketingskills), frontend-design (Anthropic), and humanizer. Preflight stops until they are installed; only an explicit per-run override proceeds without one, and that output is loudly marked partial. Enhancers (more marketingskills companions, Anthropic's web-artifacts-builder, garrytan/gstack for design variants and visual review) improve results and degrade to built-in condensed rules when missing.

Methodology credits: conversion structure informed by published landing-page research and the MECLABS Conversion Sequence heuristic, with Corey Haines' marketing skills doing the marketing work. License: MIT.
