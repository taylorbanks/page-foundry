# dogfood-7b-fixes: offline Gate 8 copy corrections

DOGFOOD-7b took the five findings from the 7a Gate 8 audit and corrected them
offline, as one planned voice-chain re-entry, then re-froze the snapshot and
rebuilt the affected page lines. Every corrected claim was re-verified against
the live product repo (`~/projects/interceptor/`) before the freeze, per the #26
discipline. The screen was not needed for any of this; F-E and the render gates
stay with DOGFOOD-7c.

## What changed, and the live-repo line that backs it

- **F-A (high, fabricated feature).** Removed the S5 bullet `Masking on sensitive
  fields`. A repo-wide search for `mask` returns only record-and-replay value
  masking in generated plans (`extension/src/content/monitor.ts`
  `maskedValue()`, `cli/commands/monitor.ts` line 577) and CoreGraphics event
  modifier flags, not a live safety control. S5 now lists the two real controls,
  the panic hotkey and the frontmost-app denylist (README lines 1261 to 1262).
  The S5 list went from three items to two.
- **F-B (medium, stale claim).** Corrected the S10 FAQ to the real support
  matrix: browser-only runs on macOS and Windows (README line 206), Linux
  browser-only support was contributed (README line 1323, PR 83), and the signed
  `.pkg` is macOS-only (README line 79), so Windows and Linux install from
  source. There is no headless mode without a window.
- **F-C (medium, stale claim).** Corrected S6's `[TK]`: CI flow tests are a named
  browser-only use case (README line 79), and there is no headless mode without a
  window by design, because the tool drives a real browser. A repo-wide `headless`
  search in the README returns zero hits, confirming no headless mode is claimed.
- **F-D (low, offline placeholder).** Reworded the S1 stealth readout line from
  `Independent reproduction is [TK]` to a plain statement, that independent
  reproduction is not yet published. The stealth checks stay labeled
  vendor-stated.
- **S7 refinement.** The not-for line `A pure Linux or Windows CI job with no
  desktop` became `A headless CI job with no desktop browser`, so it names the
  headless, no-desktop case rather than Linux or Windows, which the corrected
  matrix now supports.

## Non-copy HTML fixes in the same rebuild

- Wrapped the closing links in a `<footer>` landmark (Gate 3 minor finding).
- Added an explicit allow-all `robots.txt` at the page root (Gate 6
  nice-to-have).

## Verification

- Voice scan: `index.html`, `copy-approved.md`, `robots.txt`, `llms.txt` all
  PASS, 0 FAIL, 0 WARN.
- Gate 2 verbatim re-diff: all five corrected passages appear word for word in
  the rendered page and match the frozen snapshot; all five old strings are gone;
  the only `[TK]` left in the rendered body is the S4 quickstart output pane,
  correctly deferred to 7c.
- `bash loop/verify.sh`: GREEN.

## Still open (owned by DOGFOOD-7c, needs an unlocked screen)

- F-E: the S4 quickstart output pane still holds `[TK]`. Capture real output
  against a live page, or cut the pane. Never invent output.
- The render gates (Gate 1 re-score, Gate 4 performance, Gate 5 render review and
  design detect) and the 390 and 1440 renders.
