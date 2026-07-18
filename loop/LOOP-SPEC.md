# Loop Spec — pf-v3-overnight

> The contract. Kit generated from this. Assumptions made while the owner sleeps are marked OWNER-REVIEW.

**Objective**: Ship page-foundry v3.0 — the plan in `plans/v3.0.md` executed across milestone issues #11–#19, #21 (tracking #20) — so that by morning the skill compiles conversion contracts instead of stamping templates, leaves evidence for every companion invocation, integrates impeccable, and produces the handoff 3.0 package; proven by a real dogfooded page that passes its own gates, and released as 3.0.0 only if the mechanical test gate is green. The goal behind the goal: tomorrow the owner rebuilds this skill's own homepage plus another project's page as objective tests — the loop's output must survive that.
**Owner**: Taylor (reviews morning report `plans/v3.0-overnight-report.md`; escalations in `loop/ESCALATION.md`).
**Created**: 2026-07-17 · **Engine**: Fable 5 (session default for `claude -p`), delegating mechanical execution to Sonnet/Opus subagents via the Agent tool; Fable/Opus judge inside review iterations · **Runtime**: portable bash Ralph (`loop/run.sh`, detached, `env -u CLAUDECODE`) — the only runtime where 5-hour-limit survival is mechanical: a limit error sleeps 15 min and retries, resuming the moment the window resets.
**Classification**: Iterative (failures repeat and carry information; backlog is decomposable into small verifiable increments) with a scheduled wrapper for limit-window resumption.

## The five components

| Component | Design |
|---|---|
| Trigger | `loop/run.sh` while-loop; 30s between iterations; 15min sleep on usage-limit/API errors (does not consume an iteration); hard stop when `loop/STOP` exists, cap reached, or wall clock passes 06:30 local |
| Find work | `loop/fix_plan.md`, top-most unchecked item not marked BLOCKED; items are pre-decomposed to ≤ ~45 min so a limit never lands mid-step; an iteration may split an item further but then must complete the first slice |
| Execute | Fresh context per iteration: `cat loop/PROMPT.md | claude -p --dangerously-skip-permissions`; inside, Fable orchestrates and may fan mechanical work to Sonnet/Opus subagents; state lives only in files + git |
| Verify | Per-iteration: `bash loop/verify.sh` (mechanical: voice_scan self-test + scans on changed files, installer lifecycle, pack leak check) + item-specific acceptance from the issue; behavioral changes require a micro-dogfood; REVIEW iterations (seeded in the backlog) re-audit prior commits with fresh eyes; final AUDIT iteration compares milestone state to plan before any release prep |
| Record | Small commits pushed to main (each gated); `loop/progress.md` heartbeat per iteration; `loop/lessons.md` on any failure/rejection; issue comments as evidence; green tags `v3-night-N` after each passing REVIEW |

## Success gate (the work is right)

All of: (1) milestone v3.0 issues closed, each with an evidence comment (commit shas + what proves it); (2) `bash loop/verify.sh` exits 0; (3) DOGFOOD-FULL produced a real page in `loop/evidence/dogfood/` with its gate report and 390/1440 renders captured via Interceptor, page passes its own gates; (4) `plans/v3.0-overnight-report.md` exists covering work done, autonomous decisions with justifications, and OWNER-REVIEW assumptions; (5) README/CHANGELOG/TESTS/orientation current with no claims for unbuilt features. Judged by the AUDIT iteration (fresh context, plan vs repo vs milestone), not by the iteration that did the work.

## Stop gate (the loop ends)

- Iteration cap: 60
- Retries per work item: 3 — then mark BLOCKED in fix_plan with the failure, add an ESCALATION.md entry, move on; > 5 BLOCKED items → stop and escalate
- Wall clock: no new iterations after 06:30 local; runner exits
- Completion promise: iteration writes `loop/DONE` containing exactly `PF-V3-SHIPPED-COMPLETE-WITH-EVIDENCE-9f3a` ONLY when the success gate is met with evidence; runner exits on seeing it
- No-progress rule: 3 consecutive iterations with no commit and no fix_plan change → stop + escalate

## Invariants & scope

- NEVER commit: `taylor-voice.md`, `~/.npmrc` contents, anything under `loop/logs/`. Voice overlay (`owner: Taylor Banks`) in `~/.claude/skills/page-foundry/references/voice.md` preserved on any global sync.
- NEVER: run `npm publish` or `git tag v3.0.0` or `gh release create` from an iteration (the runner's deterministic finalization block owns release, gated on `loop/RELEASE-READY` + verify.sh green); touch Brave or claude-in-chrome MCP (Interceptor only); deploy homepage copy claiming features that do not exist; delete or weaken tests to pass gates; edit `loop/PROMPT.md` Standing Rules or `loop/run.sh` or `loop/verify.sh` (operator-only files); create new repos or post outside taylorbanks/page-foundry.
- Permissions: `--dangerously-skip-permissions` on the owner's machine, accepted for this commissioned overnight run (OWNER-REVIEW); blast radius bounded by the NEVER list + release moved into deterministic bash.

## Verifier inventory

Exists: `loop/verify.sh` (voice_scan self-tests incl. FAIL-case exit 1 / clean exit 0 / pattern WARNs; `node bin/page-foundry.js` version+install+update+uninstall lifecycle in a temp dir incl. voice-overlay preservation; `npm pack` leak check = 0 for taylor-voice/docs/.skill/.agents); voice_scan on changed md/html; TESTS.md behavioral specs (enforced by REVIEW iterations reading them); Interceptor render verification for dogfoods; `gh` milestone state. Missing and accepted: no CI — REVIEW/AUDIT iterations are the independent judge (fresh context, different eyes than the author iteration).

## Escalation

On stop-without-success: write `loop/ESCALATION.md` (obstacle, attempts with commit refs, rejection reasons, recovery options) and ensure `plans/v3.0-overnight-report.md` exists in best-effort form naming what shipped and what did not. Owner finds out by reading the report at morning coffee; nothing is silently green.

## Recovery

Last-known-good: `v3-night-N` tags (created after each passing REVIEW). Procedure: `git tag | grep v3-night | tail -1` → `git reset --hard <tag>`; read last two `loop/logs/iter-*.log` + ESCALATION.md; add the failure as a lesson; re-seed fix_plan from the open milestone issues; relaunch `loop/run.sh`.

## Budget expectations

Fresh context per iteration ≈ 200–600k tokens (plan + issue reads + work + subagents); 25–45 productive iterations expected before 06:30. Owner runs ultracode posture (cost explicitly subordinated to correctness). Spend visible in `loop/logs/iter-*.log` sizes and `loop/progress.md`. Cache posture: cold per iteration by design (fresh context is the feature; correctness over cache).
