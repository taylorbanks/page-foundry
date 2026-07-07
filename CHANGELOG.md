# Changelog

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
