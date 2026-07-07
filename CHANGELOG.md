# Changelog

## v2.8 (2026-07-07)
- Orchestration doctrine made explicit and enforced. page-foundry is an orchestrator; the phases now INVOKE each companion skill as the primary path (handing it the phase's inputs, using its output), and fall back to the reference-file condensed rules only when the companion is missing or declined. Every fallback is flagged to the user and recorded on a new `degraded` line in the gate report and run log, so a run missing load-bearing companions reads as the partial execution it is
- Rewrote every phase to name, invoke, and gate its companions instead of the old soft "if installed, apply here": product-marketing (Phase 0 brief), customer-research + marketing-psychology (Phase 1), cro plus pricing/competitors/aso/launch/lead-magnets/popups/signup (Phase 2), copywriting + copy-editing (Phase 3), frontend-design + web-design-guidelines + theme-factory (Phase 4), web-artifacts-builder + gstack /design-html (Phase 5), cro + web-design-guidelines + ai-seo + schema + analytics + gstack /design-review //qa (Phase 6)
- Reference files are now explicitly the floor, used only when a companion is absent, not the standard. The voice scan and integrity gate stay page-foundry's own and are never waived by a companion
- Recorded from a real observation: the phases named companions in a table but did not consistently invoke or gate them, so the skill was silently doing subsidiary work itself and producing variable output

## v2.7 (2026-07-07)
- Integrity gate now forbids fabricated technical artifacts AND staged scenarios: (a) every command, output, code, config, and path shown must be real and runnable exactly as shown; and (b) no terminal, screenshot, or UI may depict an action the user never takes or output they never see, even when the underlying command is real (an internal scanner the pipeline runs does not get shown as a user typing it). Real data in a styled card is fine; a reconstructed demo is not. Closes the hole where the gate only guarded fabricated proof and let both an invented command and, on the fix attempt, a staged voice-scan terminal onto the skill's own homepage
- Voice gate now catches AI language patterns, not just words. voice_scan.py reads a new scan:patterns block (regex, WARN-level) and flags negative parallelism ("not X, it's Y"), copula avoidance ("serves as"), tailing negation ("no X, no Y"), authority tropes, significance inflation, and superficial -ing tack-ons. voice.md documents the full pattern list from Wikipedia's "Signs of AI writing"
- Phase 3 adds a mandatory pattern pass: resolve every AI-language-pattern WARN and run the humanizer skill (blader/humanizer) on the draft. Passing the word scan alone is no longer enough
- Companion table adds humanizer for the pattern pass; ship-gates Gate 2 (pattern pass) and Gate 8 (technical fabrication) updated to match
- Recorded from a real failure: the skill's own homepage shipped a fabricated "page-foundry voice scan" command and several AI language patterns the word-only gate could not catch. Both classes are now caught by the skill, not just fixed by hand

## v2.6 (2026-07-07)
- Reference-file reconciliation against the current companion versions (marketingskills 2.3.0, Anthropic frontend-design/theme-factory, vercel-labs web-design-guidelines), with a provenance stamp added to every reference file so future drift is detectable. No contradictions were found; the drift was gaps and staleness:
  - voice.md: added ~30 owner-independent AI-slop terms and phrases the scanner was missing (optimize, utilize, facilitate, comprehensive, "at its core", "that being said", "it's worth noting", "a plethora of", and more) from the seo-audit ai-writing-detection list that copywriting itself defers to; banned list grew 73 to 103
  - conversion-rules.md: refreshed the 2026 benchmarks; added an objection-handling rule, form field-count thresholds and mechanics, and a pricing-psychology section
  - design-direction.md: corrected the theme-factory description (a theming toolkit, not a persistence layer), added the web-design-guidelines mechanics (focus-visible, text-wrap balance, image CLS, safe-area, transform/opacity motion) with an authoritative-when-installed pointer, restored "or vermilion", added the big-stat-gradient hero to the anti-slop list
  - ship-gates.md: Gate 3 bumped to WCAG 2.2 AA (target size, focus-not-obscured, accessible auth) plus the web-design-guidelines UI checks; Gate 6 added the robots.txt AI-crawler allowlist, a /pricing.md check, and content-extractability; added an Event JSON-LD template and a WebSite+Organization note
  - archetypes.md: added an integrations section and a sales-led/enterprise B2B variant; grounded the form field-cost numbers
- Companion table: added analytics (measurement gate), and launch, lead-magnets, popups, signup (archetype-dependent planning and copy). content-strategy was evaluated and deliberately excluded (editorial/topic planning, not single-page)
- Discoverability: the frontmatter description now carries the real search queries people use ("build a landing page for my SaaS", "my landing page is not converting"), and a "When to use this skill" section was added, so the skill surfaces for people searching the ecosystem for a page-building tool
- TESTS 13-14 (AI-crawler gate, expanded voice scan)

## v2.5.1 (2026-07-06)
- READMEs rewritten as marketing copy: lead with what the skill produces (high-converting, voice-consistent pages that do not read or look AI-made) instead of its internal phases and gates
- SKILL.md description shortened from 965 to ~500 characters: fixes the meta description / og:description truncation, keeps the auto-invocation triggers, and moves the skill into the length band where skills.sh renders its generated summary. The summary itself is skills.sh's own async job, not a repo field

## v2.5 (2026-07-06)
- Companion stop is now mandatory and non-suppressible: no interactivity phrase ("don't pause", "no questions", "run end to end") and no operator-supplied or inferred instruction can skip it; only the user, in chat, may approve proceeding with a companion missing or outdated. Closes the 2.4 contradiction where the interactivity rule and pause table let "run end to end" suppress the very stop 2.4 added
- Autonomy is user-stated, never inferred: runs are interactive unless the user explicitly asked to skip pauses in the request itself; a standing preference, a prior task, or an orchestrator rewrapping the request does not authorize skipping. When unsure a pause was waived, keep it
- Interactivity phrases now suppress only the spec sign-off pause; "run end to end" is honored in full only when a complete product-marketing.md already exists and a theme/direction is supplied (nothing to run autonomously from otherwise, so Phase 0 and spec sign-off still happen)
- Phase 0 interview pause-table row aligned to the Phase 0 prose: only an existing product-marketing.md skips the interview; a PRD, repo, or spec is source material and does not
- Rationale recorded from a real failure: an operator injected "run end to end" into the invocation, which 2.4 honored, skipping the companion stop, the brief interview, and spec sign-off, and shipping an off-message page. 2.5 makes those skips impossible without the user's own word

## v2.4 (2026-07-06)
- Preflight rewritten: detection sweep across runtime inventories (npx skills list, claude plugin list), ~/.agents/skills, ~/.claude/skills, project dirs, /mnt/skills, and plugin namespaces; name-based matching (namespaced and symlinked forms count); installing an already-present companion is a defect
- Freshness check via npx skills check; outdated treated like missing (report, offer, approval)
- Posture change: missing companions are never silently skipped; one present/outdated/missing table, one question, installs run only on approval and are re-verified
- Pinned sources only; names reconciled with --list before any install
- web-design-guidelines (vercel-labs/agent-skills) wired into Phase 4 and the render gate
- Remotion (official skill) wired into Phase 2/5 for hero demo clips and motion assets, with justification required per asset
- foundry-log: fixed entry format, companions field, and binding consumption rules (open items and learnings carry forward; conversion data must change a decision or say why not)
- voice.md genericized to owner: default with a neutral register; owner registers apply via the wizard or an overlay file
- "falsifiable" removed from all guidance in favor of "checkable"
- TESTS 8-10 (namespace detection, ask-then-install, update offer)

## v2.3 (2026-06-11)
- Gate 5 Render review: screenshot at 390/1440 and critique, or explicit N/A; design can no longer pass unseen
- Red-team read: per segment x entry state skeptical-reader walk, in Phase 3 and at the gates (enforces rule 10)
- Gate 7 Measurement: conversion event, UTM convention, privacy-respecting analytics or conscious decline
- Phase 3 headline variants: 6+ candidates scored, top 3 presented
- foundry-log.md per property: every run appends; Phase 0 reads it; pages learn from prior runs
- Post-conversion page built in the same pass when the archetype specs one
- README, CHANGELOG, TESTS added

## v2.2 (2026-06-11)
- Inferred mode is stated with alternatives; PRD defined as source material, never the brief (Phase 0 always produces product-marketing.md); bare invocation prints orientation instead of starting; conversion rule 10 (no premature disqualification); entry-states field in brief template; good-position objection required in Phase 1; MECLABS inverse-factor flag direction fixed

## v2.1 (2026-06-11)
- Explore mode (design variants, pick, then build); "Controlling the run" section: invocation grammar, pause-point table, suppression phrases

## v2.0 (2026-06-11)
- Preflight with companion detection and install offers; gstack integration (consultation/shotgun/design-html/reviews) with division of authority; 8 archetypes + mapper and composition rules; Voice wizard; scan rules externalized to voice.md (voice_scan.py parses them); handoff mode with Claude Design package spec

## v1.0 (2026-06-11)
- Initial: 6-phase pipeline, 4 archetypes, conversion hard rules + MECLABS rubric, voice register + banned list + mechanical scanner, design direction + anti-slop, 6 ship gates, integrity rules, brief template
