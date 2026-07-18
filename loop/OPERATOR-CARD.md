# Operator Card — pf-v3-overnight

## Start

```
cd /Users/taylor/projects/page-foundry
nohup bash loop/run-tiered.sh > loop/logs/nohup.out 2>&1 &   # tiered-model runner; see loop/MODEL-POLICY.md
```

Preconditions: git clean at start (runner assumes committed baseline), `gh` authed, npm automation token in `~/.npmrc` (expires ~2026-10), Chrome + Interceptor up for dogfood items. Baseline: `git log --oneline -1` recorded in loop/logs/runner.log line 1.

## Watch (first 3 iterations supervised)

Healthy: each iteration picks ONE fix_plan item (`loop/progress.md` grows one line), `VERIFY GREEN` appears in the iteration log, a small commit lands and pushes, fix_plan checkbox flips with a sha. REVIEW iterations tag `v3-night-N`.
Smells: same item failing across logs without a BLOCKED mark; commits touching docs/ homepage copy early (claims!); iteration logs > 20 min of one tool hammering; `loop/DONE` existing before AUDIT/REPORT are checked off.
Where: `tail -f loop/logs/runner.log` · `ls -t loop/logs/iter-*.log | head -1 | xargs tail -50` · `git log --oneline -10` · `gh issue list --milestone v3.0` · `cat loop/progress.md`.

## Tune (guitar rule)

Every observed bad behavior → a permanent line appended to PROMPT.md **by you** (Standing Rules are operator-owned; iterations may not edit them). One rule per failure. Same sign three iterations running → the fix is structural: split items smaller in fix_plan or strengthen verify.sh.

## Kill

- `touch /Users/taylor/projects/page-foundry/loop/STOP` (clean: current iteration finishes, runner exits, no release)
- Hard: `pkill -f "loop/run.sh"` then `pkill -f "claude -p"`.
- Release tripwire: delete `loop/RELEASE-READY` at any time to guarantee no publish.

## Recover (broken morning)

1. `git tag | grep v3-night | tail -1` → last green tag; `git reset --hard <tag>` if needed (work stays in reflog).
2. Read `loop/ESCALATION.md` + the last two iter logs; add the failure to PROMPT.md as a rule.
3. Re-seed fix_plan from `gh issue list --milestone v3.0 --state open` if it drifted.
4. Relaunch. npm publish is idempotent-safe here: if 3.0.0 already published, the runner's publish fails loudly and nothing else breaks.

## Review debt

The report (`plans/v3.0-overnight-report.md`) is the map, not the territory: budget 30–45 min tomorrow reading actual diffs (`git log --oneline v2.9.1..HEAD`, spot-read 3 full diffs). Your objective tests (rebuild own homepage + another project's page) are the real acceptance — the loop knows this and was told its output must survive them.

## Costs & health

~200–600k tokens/iteration (fresh context by design), 25–45 productive iterations expected. Limit windows cost wall-clock, not budget (runner sleeps). Spend visible in iter log sizes. Ultracode posture: correctness over cost, per owner.

## Known risks accepted (owner-review)

- `--dangerously-skip-permissions` on the owner's machine — bounded by Standing Rules + deterministic-release design + NEVER list, not by sandboxing. Chosen because the loop needs repo+gh+Interceptor+global-skill access that a sandbox would break.
- Continuous pushes to main (no worktree): every commit is gated by verify.sh + scanner; small-green-commits was judged safer unattended than a 7am mega-merge. Tags v3-night-N are the rollback points.
- The 06:30 wall clock and the 60-iteration cap are estimates; if the milestone is bigger than one night, the loop ships what is green, leaves release for morning, and the report says exactly where it stopped.

## Accepted preflight warnings (deliberate)

1. Linter "no completion promise in LOOP-SPEC" — false positive; the promise string is in the Stop gate section (`PF-V3-SHIPPED-COMPLETE-WITH-EVIDENCE-9f3a`).
2. PROMPT references `taylor-voice.md` — as a NEVER-touch guardrail, not an orientation file; its absence from the kit is the point.
3. PROMPT references `loop/ESCALATION.md` — created on demand at first escalation, by design.


## Model policy (loop/MODEL-POLICY.md)

The orchestrator floor is Opus. When Opus is exhausted the loop PAUSES and waits for it to reset (30-min checks, 24h cap), then resumes itself — it never silently drops to a weaker model. To trade quality for progress, edit `ORCH_MODELS=(opus sonnet)` in `run-tiered.sh` explicitly; those iterations are logged DEGRADED and the AUDIT re-reviews them, and release blocks until reviewed. Watch the per-iteration model in `loop/logs/models.log`.
