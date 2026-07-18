# Model policy: quality floor, never silent degradation

The problem this solves: an autonomous loop that string-matches limit errors and falls back to a cheaper model keeps *running* when its best model is exhausted, and silently produces worse work. For a loop whose whole job is building a skill that refuses to silently degrade, that is the exact failure to avoid. This policy makes the loop obey the doctrine it is building.

## The four rules

1. **The orchestrator has a hard quality floor.** The model that does the thinking, authoring, and reviewing has a minimum acceptable capability. For this loop the floor is **Opus**. Nothing below the floor runs orchestration. (Mechanical subwork the prompt delegates to Sonnet subagents is capability-tiering, not orchestrator degradation, and is fine — the floor governs the loop's own reasoning, not every token it spends.)

2. **On floor exhaustion the loop PAUSES; it does not degrade.** A usage limit resets; quality lost to a weaker orchestrator does not come back. So when the floor model is exhausted the runner waits for it to reset (30-minute checks, up to 24h), retrying the floor each cycle, and resumes itself the moment the model returns. Wall-clock is spent; quality is not.

3. **Degradation is an explicit, recorded owner choice, never automatic.** The runner's `ORCH_MODELS` list is the floor first and nothing else by default. An owner who would rather make slower progress on a weaker model than wait adds it to the list, in the runner, by hand. The loop never lowers its own floor.

4. **Anything run below the floor is labeled and re-reviewed.** Every iteration records its model (`loop/logs/models.log`, the runner log, and the DEGRADED marker in `ESCALATION.md`). Work produced below the floor does not count until a floor-model REVIEW/AUDIT iteration re-checks it, and the deterministic release blocks on unreviewed degraded work. Silent is the enemy; labeled is acceptable.

## How the runner implements it

`run-tiered.sh` (supersedes `run.sh`):
- `ORCH_MODELS=(opus)` — ordered acceptable models, floor first.
- A fast failure whose message names an exhaustion (`reached your … limit`, `session limit`, `model unavailable`, …) does not count as an iteration. The runner advances to the next model in `ORCH_MODELS` only if the owner put one there; otherwise it **pauses and waits** for the floor to reset, retrying the floor from the top after each wait.
- After 24h of a floor with no reset, it escalates and stops with a report — it never quietly drops to a lesser model to "make progress."
- Release is additionally gated: if any degraded-model work shipped, release blocks until a floor-model review flag is present.

## To operate

- **Default (recommended):** leave `ORCH_MODELS=(opus)`. Opus out → loop pauses → loop resumes when Opus resets. You do nothing.
- **Explicitly accept a lower floor:** edit `ORCH_MODELS=(opus sonnet)` in `run-tiered.sh` and relaunch. Sonnet iterations are logged DEGRADED and the AUDIT re-reviews them; release blocks until reviewed.
- **Watch:** `loop/logs/models.log` shows the model per iteration; a `DEGRADED` line in `ESCALATION.md` means the floor was breached (by your configuration) and re-review is owed.

## The reusable lesson (destined for the loop-writer skill)

"Retry on limit" is table stakes; the harder rule is *what you retry with*. A loop that silently substitutes a weaker model has converted an availability problem into a quality problem the operator cannot see. Give the orchestrator a floor, pause below it, and make any degradation an explicit and re-reviewed choice.
