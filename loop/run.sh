#!/usr/bin/env bash
# pf-v3-overnight runner — portable bash Ralph. Operator-owned; the loop may not edit.
# Survives 5-hour usage-limit windows: limit/API errors sleep 15m and retry without consuming an iteration.
#
# ISOLATION POSTURE (why --dangerously-skip-permissions is accepted here):
# Owner-commissioned unattended run on the owner's own machine, scoped to one repo.
# Blast radius is bounded by mechanism, not hope: (1) the only irreversible action
# (npm publish / tag / release) is NOT executable by the model — this script performs
# it deterministically, only if loop/RELEASE-READY + loop/DONE exist AND verify.sh
# re-passes here; delete loop/RELEASE-READY to make release impossible. (2) PROMPT.md
# Standing Rules forbid: secrets/private-file commits, Brave / claude-in-chrome, global
# edits outside the final overlay-preserving sync, test weakening, homepage claims for
# unbuilt features. (3) Every iteration is gated by loop/verify.sh incl. a forbidden-
# file tracking check, and pushes small commits so any damage is a one-commit revert.
# (4) Kill switches: touch loop/STOP (clean) or pkill (hard). A disposable sandbox was
# rejected because the work REQUIRES this repo, gh auth, the global skill dir, and the
# local Chrome+Interceptor — isolation would break the commissioned job.
set -u
cd "$(dirname "$0")/.." || exit 2
LOOP=loop
LOG="$LOOP/logs"
mkdir -p "$LOG" "$LOOP/evidence"
MAX_ITER=60
STOP_AFTER="06:30"   # local; no NEW iterations after this
PROMISE="PF-V3-SHIPPED-COMPLETE-WITH-EVIDENCE-9f3a"
ITER=0

log(){ echo "[runner $(date '+%H:%M:%S')] $*" | tee -a "$LOG/runner.log"; }

log "start pid=$$ max_iter=$MAX_ITER stop_after=$STOP_AFTER"

while :; do
  # ---- stop gates ----
  [ -f "$LOOP/STOP" ] && { log "STOP file present; exiting"; break; }
  if [ -f "$LOOP/DONE" ] && grep -q "$PROMISE" "$LOOP/DONE"; then log "DONE promise found"; break; fi
  [ "$ITER" -ge "$MAX_ITER" ] && { log "iteration cap $MAX_ITER reached"; break; }
  NOW=$(date '+%H:%M')
  if [[ "$NOW" > "$STOP_AFTER" && "$NOW" < "12:00" ]]; then log "wall clock past $STOP_AFTER; exiting"; break; fi
  # no-progress rule: 3 consecutive iterations without a new commit
  if [ "$ITER" -ge 3 ]; then
    N1=$(git rev-parse HEAD 2>/dev/null)
    N2=$(sed -n '1p' "$LOG/.lastheads" 2>/dev/null || echo "")
    if [ "$N1" = "$N2" ] && [ -f "$LOG/.noprog" ] && [ "$(cat "$LOG/.noprog")" -ge 2 ]; then
      log "no progress for 3 iterations; escalating + exiting"
      [ -f "$LOOP/ESCALATION.md" ] || echo "No-progress stop at iter $ITER, $(date). Read last 3 logs in loop/logs/." > "$LOOP/ESCALATION.md"
      break
    fi
  fi

  ITER=$((ITER+1))
  log "iteration $ITER begin"
  HEAD_BEFORE=$(git rev-parse HEAD 2>/dev/null)

  # ---- execute: fresh context, session-default model (Fable) ----
  OUT="$LOG/iter-$ITER.log"
  timeout 3900 env -u CLAUDECODE claude -p --dangerously-skip-permissions < "$LOOP/PROMPT.md" > "$OUT" 2>&1
  RC=$?

  # ---- limit / transient handling: retry without consuming budget ----
  if grep -qiE "usage limit|rate limit|limit reached|limit will reset|overloaded|529|too many requests" "$OUT"; then
    log "usage/rate limit detected on iter $ITER (rc=$RC); sleeping 15m, iteration not counted"
    ITER=$((ITER-1))
    sleep 900
    continue
  fi
  [ $RC -eq 124 ] && log "iteration $ITER hit 65m timeout (state is in git; next iteration resumes)"

  # ---- record progress signal ----
  HEAD_AFTER=$(git rev-parse HEAD 2>/dev/null)
  echo "$HEAD_AFTER" > "$LOG/.lastheads"
  if [ "$HEAD_AFTER" = "$HEAD_BEFORE" ]; then
    P=$(cat "$LOG/.noprog" 2>/dev/null || echo 0); echo $((P+1)) > "$LOG/.noprog"
  else
    echo 0 > "$LOG/.noprog"
  fi
  log "iteration $ITER end rc=$RC head=$HEAD_AFTER"
  sleep 30
done

# ---- deterministic finalization: release only if the model earned it AND gates re-pass here ----
if [ -f "$LOOP/RELEASE-READY" ] && [ -f "$LOOP/DONE" ] && grep -q "$PROMISE" "$LOOP/DONE"; then
  log "RELEASE-READY + DONE present; re-running mechanical gate"
  if bash "$LOOP/verify.sh" >> "$LOG/runner.log" 2>&1; then
    V=$(node -p "require('./package.json').version")
    log "gate green; publishing v$V"
    npm publish --access public >> "$LOG/runner.log" 2>&1 && log "npm publish ok" || log "npm publish FAILED (report to owner)"
    git tag "v$V" 2>/dev/null && git push origin "v$V" >> "$LOG/runner.log" 2>&1 && log "tag v$V pushed"
    rm -f page-foundry.skill; (cd skills && zip -qr ../page-foundry.skill page-foundry)
    gh release create "v$V" page-foundry.skill --title "page-foundry v$V" \
      --notes "v3.0: conversion contracts, evidence-based orchestration, impeccable integration, handoff 3.0. Overnight report: plans/v3.0-overnight-report.md. Full details: CHANGELOG.md." >> "$LOG/runner.log" 2>&1 \
      && log "gh release created" || log "gh release FAILED (report to owner)"
  else
    log "finalization gate RED; NOT publishing. Owner releases in the morning."
  fi
else
  log "no RELEASE-READY+DONE pair; release left for morning per spec"
fi
log "runner exit after $ITER iterations"
