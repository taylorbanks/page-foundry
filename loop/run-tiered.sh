#!/usr/bin/env bash
# pf-v3-overnight runner v2 — tiered-model policy. Operator-owned; the loop may not edit.
# Supersedes run.sh. Same limit-survival + deterministic-release design, plus a MODEL
# QUALITY FLOOR that never degrades silently. Doctrine: loop/MODEL-POLICY.md.
#
# THE POLICY IN ONE SENTENCE: the orchestrator model has a hard floor (Opus); when the
# floor is exhausted the loop PAUSES and waits for it to reset, because a limit comes back
# but quality lost to a weaker orchestrator does not — degradation is only ever an explicit,
# recorded owner choice, never automatic.
#
# ORCH_MODELS is the owner's ordered list of ACCEPTABLE orchestrator models. Default is
# opus alone: nothing below the floor runs orchestration. To trade quality for progress
# (accept Sonnet rather than wait), the owner adds it here, explicitly; any iteration then
# run below the floor is logged DEGRADED and the AUDIT re-reviews it with a floor model.
# Mechanical subwork stays delegated to Sonnet subagents inside PROMPT.md regardless — that
# is capability-tiering, not orchestrator degradation.
ORCH_MODELS=(opus)              # floor first; owner-editable, opus is the documented floor
WAIT_SLEEP=1800                 # 30m between floor-reset checks while paused
WAIT_CAP=48                     # 48 x 30m = 24h max pause before escalate-and-stop
#
# (release/isolation posture unchanged — see the release block and PROMPT.md Standing Rules)
set -u
cd "$(dirname "$0")/.." || exit 2
LOOP=loop
LOG="$LOOP/logs"
mkdir -p "$LOG" "$LOOP/evidence"
MAX_ITER=60
STOP_AFTER="23:59"
PROMISE="PF-V3-SHIPPED-COMPLETE-WITH-EVIDENCE-9f3a"
ITER=0
MODEL_IDX=0
FLOOR="${ORCH_MODELS[0]}"
CURRENT="${ORCH_MODELS[$MODEL_IDX]}"
WAITS=0

log(){ echo "[runner $(date '+%H:%M:%S')] $*" | tee -a "$LOG/runner.log"; }

echo 0 > "$LOG/.noprog"; rm -f "$LOG/.lastheads"; FASTFAIL=0
log "start pid=$$ max_iter=$MAX_ITER stop_after=$STOP_AFTER floor=$FLOOR orch_models=(${ORCH_MODELS[*]})"

# is a fast failure specifically a model/usage exhaustion (recoverable by reset), vs a
# generic transient? Names the real CLI phrasings, including the two that bit us 2026-07-18.
is_exhaustion(){ grep -qiE "usage limit|session limit|rate limit|limit reached|reached your .* limit|resets [0-9]|out of (extra )?usage|model .* (limit|unavailable|not available)|switch models" "$1"; }

while :; do
  [ -f "$LOOP/STOP" ] && { log "STOP file present; exiting"; break; }
  if [ -f "$LOOP/DONE" ] && grep -q "$PROMISE" "$LOOP/DONE"; then log "DONE promise found"; break; fi
  [ "$ITER" -ge "$MAX_ITER" ] && { log "iteration cap $MAX_ITER reached"; break; }
  NOW=$(date '+%H:%M')
  if [[ "$NOW" > "$STOP_AFTER" && "$NOW" < "12:00" ]]; then log "wall clock past $STOP_AFTER; exiting"; break; fi
  if [ "$ITER" -ge 3 ]; then
    N1=$(git rev-parse HEAD 2>/dev/null); N2=$(sed -n '1p' "$LOG/.lastheads" 2>/dev/null || echo "")
    if [ "$N1" = "$N2" ] && [ "$(cat "$LOG/.noprog" 2>/dev/null || echo 0)" -ge 2 ]; then
      log "no progress for 3 iterations; escalating + exiting"
      [ -f "$LOOP/ESCALATION.md" ] || echo "No-progress stop at iter $ITER, $(date)." > "$LOOP/ESCALATION.md"
      break
    fi
  fi

  ITER=$((ITER+1))
  DEG=""; [ "$MODEL_IDX" -gt 0 ] && DEG=" DEGRADED(below floor $FLOOR)"
  log "iteration $ITER begin model=$CURRENT$DEG"
  echo "iter $ITER model=$CURRENT$DEG $(date '+%H:%M')" >> "$LOG/models.log"
  HEAD_BEFORE=$(git rev-parse HEAD 2>/dev/null)
  OUT="$LOG/iter-$ITER.log"; T0=$(date +%s)
  timeout 3900 env -u CLAUDECODE claude -p --model "$CURRENT" --dangerously-skip-permissions < "$LOOP/PROMPT.md" > "$OUT" 2>&1
  RC=$?
  DUR=$(( $(date +%s) - T0 ))

  # ---- model exhaustion: escalate the model tier, or pause the whole loop; never degrade silently ----
  if [ $RC -ne 0 ] && [ "$DUR" -lt 120 ] && is_exhaustion "$OUT"; then
    log "model $CURRENT exhausted on iter $ITER (${DUR}s): $(grep -oiE "reached your [a-z0-9 ]*limit|session limit|usage limit" "$OUT" | head -1)"
    ITER=$((ITER-1))                          # this iteration did no work; do not count it
    if [ $((MODEL_IDX+1)) -lt ${#ORCH_MODELS[@]} ]; then
      MODEL_IDX=$((MODEL_IDX+1)); CURRENT="${ORCH_MODELS[$MODEL_IDX]}"
      log "OWNER-CONFIGURED DEGRADE: falling to $CURRENT (below floor $FLOOR). Work done here is tagged and the AUDIT re-reviews it with a floor model."
      echo "DEGRADED to $CURRENT at $(date): floor $FLOOR exhausted, ORCH_MODELS permits fallback. Iterations from here need floor-model re-review." >> "$LOOP/ESCALATION.md"
      continue
    fi
    # all configured models exhausted → PAUSE, do not degrade
    WAITS=$((WAITS+1))
    if [ "$WAITS" -gt "$WAIT_CAP" ]; then
      log "paused ${WAIT_CAP}x without a floor-model reset; escalating + stopping"
      echo "PAUSED-OUT: orchestrator floor ($FLOOR) exhausted and did not reset within $((WAIT_CAP*WAIT_SLEEP/3600))h ($(date)). The loop refused to degrade. Resume by relaunching when the model is back, or (explicit choice) widen ORCH_MODELS in run-tiered.sh." >> "$LOOP/ESCALATION.md"
      break
    fi
    log "PAUSED (no degradation): all configured orchestrator models exhausted; waiting ${WAIT_SLEEP}s for $FLOOR to reset (pause $WAITS/$WAIT_CAP). The loop will resume itself on reset."
    sleep "$WAIT_SLEEP"
    MODEL_IDX=0; CURRENT="$FLOOR"             # retry from the top; the floor may have reset while we waited
    continue
  fi

  # ---- generic rolling limit / transient (not a hard model exhaustion) ----
  if grep -qiE "overloaded|529|too many requests|api error|internal server" "$OUT" || { [ $RC -ne 0 ] && [ "$DUR" -lt 90 ]; }; then
    log "transient failure on iter $ITER (rc=$RC, ${DUR}s); sleeping 15m, not counted (fastfail $FASTFAIL)"
    tail -1 "$OUT" >> "$LOG/fastfail-samples.log"
    ITER=$((ITER-1)); FASTFAIL=$((FASTFAIL+1))
    [ "$FASTFAIL" -gt 20 ] && { log "20+ transient fast-fails; escalating"; echo "Persistent transient fast-failure, $(date). Samples: loop/logs/fastfail-samples.log" >> "$LOOP/ESCALATION.md"; break; }
    sleep 900; continue
  fi
  FASTFAIL=0; WAITS=0
  [ $RC -eq 124 ] && log "iteration $ITER hit timeout (state in git; next iteration resumes)"

  HEAD_AFTER=$(git rev-parse HEAD 2>/dev/null); echo "$HEAD_AFTER" > "$LOG/.lastheads"
  if [ "$HEAD_AFTER" = "$HEAD_BEFORE" ]; then P=$(cat "$LOG/.noprog" 2>/dev/null || echo 0); echo $((P+1)) > "$LOG/.noprog"; else echo 0 > "$LOG/.noprog"; fi
  log "iteration $ITER end rc=$RC model=$CURRENT head=$HEAD_AFTER"
  sleep 30
done

# ---- deterministic finalization: release only if earned AND gates re-pass here AND no degraded work is unreviewed ----
if [ -f "$LOOP/RELEASE-READY" ] && [ -f "$LOOP/DONE" ] && grep -q "$PROMISE" "$LOOP/DONE"; then
  if grep -q "DEGRADED to" "$LOOP/ESCALATION.md" 2>/dev/null && ! grep -q "DEGRADED-WORK-REVIEWED" "$LOOP/DONE"; then
    log "release blocked: degraded-model work shipped without a floor-model re-review flag in DONE; owner releases after review"
  elif bash "$LOOP/verify.sh" >> "$LOG/runner.log" 2>&1; then
    V=$(node -p "require('./package.json').version"); log "gate green; publishing v$V"
    npm publish --access public >> "$LOG/runner.log" 2>&1 && log "npm publish ok" || log "npm publish FAILED (report to owner)"
    git tag "v$V" 2>/dev/null && git push origin "v$V" >> "$LOG/runner.log" 2>&1 && log "tag v$V pushed"
    rm -f page-foundry.skill; (cd skills && zip -qr ../page-foundry.skill page-foundry)
    gh release create "v$V" page-foundry.skill --title "page-foundry v$V" \
      --notes "v3.0: conversion contracts, evidence-based orchestration, impeccable integration, handoff 3.0. Report: plans/v3.0-overnight-report.md." >> "$LOG/runner.log" 2>&1 && log "gh release created" || log "gh release FAILED"
  else
    log "finalization gate RED; NOT publishing."
  fi
else
  log "no RELEASE-READY+DONE pair; release left for the owner per spec"
fi
log "runner exit after $ITER iterations"
