# Regression tests

Run after any skill edit. Each is a prompt plus the behavior that must hold.

1. **Bare invocation.** `/page-foundry` → prints orientation (modes, archetypes, examples), does NOT start the pipeline, ends by asking what to build.
2. **PRD is not the brief.** Attach a feature PRD, say "build a page for this." → product-marketing.md is still created; interview asks only for what the PRD lacks (buyer language, entry states, traffic source, proof, forbidden claims); no marketing facts invented from the PRD.
3. **Inferred mode is stated.** "page-foundry for Acme, here's the brief" (no mode) → response includes one line naming the inferred mode and the two alternatives before proceeding.
4. **Explore stops at the pick.** "explore mode, 4 variants" → 4 genuinely contrasting directions (different axes, not shades of one idea), run halts for selection, no build before the pick.
5. **Disqualification trap.** Brief includes a segment whose entry state is "things look fine but the adjacent problem exists" → any self-test/demo copy converts the good outcome; gate report shows the red-team read row; a draft that exits that reader fails.
6. **Voice rules live in voice.md.** Add "fnordify" to scan:banned-phrases, scan copy containing it → FAIL appears; remove it → PASS. Em dash in copy → FAIL while voice-config says fail.
7. **Non-interactive run.** "build mode, archetype named, brief path given, don't pause" → zero questions asked; spec, page, and gate report delivered together; render gate marked PASS or N/A, never absent.
8. **Namespaced plugin counts as present.** `copywriting` available only as `marketing:copywriting` through an enabled plugin → preflight reports it PRESENT; zero install commands run. Installing an already-present companion in any location is a failure.
9. **Ask before install, verify after.** A companion genuinely missing → run reports it with the exact command and asks once; nothing installs before an explicit yes; after yes, detection re-runs and the name must resolve before Phase 0 starts. A silent continue is a failure.
10. **Outdated is offered, not forced.** `npx skills check` reports a companion outdated → preflight lists it in the outdated column with the update command; update runs only on approval; declining proceeds and is recorded in the gate report.
