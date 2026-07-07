# page-foundry

A pipeline skill for product homepages, landing pages, and sales pages: one brief in, one gated page (or design-tool handoff package) out. Built for repeatability across many products without converging on generic AI-page output or drifting from the owner's voice.

**Install:** unzip the `.skill` into `~/.claude/skills/page-foundry/` (Claude Code) or upload the `.skill` file (claude.ai). Run `/page-foundry` with no arguments for an orientation: three modes (build, explore, handoff), eight archetypes, and example invocations.

**First run:** set the voice. Say "set up my voice" and the wizard rewrites `references/voice.md`, which also drives the mechanical scanner (`scripts/voice_scan.py`). Until then a neutral default register applies.

**Companions (all optional, all improve results):** coreyhaines31/marketingskills (product-marketing, copywriting, cro, and friends), Anthropic's frontend-design / theme-factory / web-artifacts-builder, and garrytan/gstack for design variants and visual review. The skill detects what is installed at preflight and degrades to built-in condensed rules.

Methodology credits: conversion benchmarks and structure informed by published Unbounce/landing-page research, the MECLABS Conversion Sequence heuristic, and Corey Haines' marketing skills architecture. License: set one before redistributing.
