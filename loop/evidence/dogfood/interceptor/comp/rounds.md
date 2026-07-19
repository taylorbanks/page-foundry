# comp/rounds.md: Interceptor (Phase 4.5 comp stage record)

The comp stage for the Interceptor dogfood. The comp is `comp/index.html`, revised in place across two rounds (the ceiling). It renders the winning Plan A tokens (`../pages/interceptor/theme.css`), the confirmed shapes from `tokens/selection.md`, the approved draft copy from `copy/approved-draft.md`, and every section in the spec order. impeccable is absent this run (preflight), so the critique is walked by hand and its findings are written here, each tagged fix-now, next-round, or accepted with a reason. This is the documented without-impeccable path.

## Render tooling this run: headless-Chrome fallback (screen locked)

The intended path is `loop/pf-render.sh` for 1440 and the iframe wrapper for 390, both via Interceptor (lesson 30). Tonight the machine screen is locked (`CGSSessionScreenIsLocked` present, confirmed twice; Chrome AppleEvents time out with -1712; `interceptor screenshot` hangs the full 45s). Interceptor's capture uses `chrome.tabs.captureVisibleTab`, which needs the window server and a frontmost Chrome, and a locked screen denies both. `pf-render.sh` activates Chrome first, so it cannot get past the lock either. This is not lesson 30's inactive-tab case; it is a genuine environment block.

So both captures were taken with headless Chrome (`--headless=new`, a separate offscreen process that does not need the locked GUI session), the same documented fallback the AUDIT-F2 walk used for its comp captures. The renders are real: the real comp, rendered by the real Chrome engine (150.0.7871.125), just captured through a different Chrome mode because the screen is locked. Nothing is staged or hand-drawn.

- `comp-1440.png` / `comp-1440-r2.png`: `--window-size=1440,4200`. A true 1440 layout (the headless window floor is 500, well under 1440, so lesson 27's floor trap does not apply here).
- `comp-390.png` / `comp-390-r2.png`: the comp inside a real 390px iframe (`wrap390.html`) captured at a 560px outer window. The iframe's viewport is its own box, so the mobile media queries fire at a true 390, sidestepping the 500px window floor (lesson 27). The blank strip right of x=390 is the wrapper surround, not page overflow.

OWNER-REVIEW: the success gate names "390/1440 renders captured via Interceptor." Tonight's captures are headless-Chrome fallback because the screen is locked; the pixels are faithful, but a morning rerun with the screen unlocked would capture the same views through Interceptor proper. Flagged in the overnight report. Fonts fall back to the fallback stacks in both captures because the self-hosted IBM Plex files land at build (DOGFOOD-6); the mono and sans fallbacks are metric-close, so the composition reads as intended.

## Reference for the critique (from Plan A)

- **Scene sentence.** An engineer reads this at night on a second monitor, terminal already open on the first, deciding in two minutes whether this tool is worth loading the extension before their agent run breaks again.
- **Named anchors.** The GitHub repository page in dark mode, the Fly.io docs of 2024 (dark, monospace-forward, dense but calm), and the `ripgrep` or `fd` README as rendered on GitHub. The page should sit beside these without looking louder than any of them.
- **Squint test**, hero first, per `references/design-direction.md`.

## Round 1 · reviewed against: scene sentence + anchors (GitHub dark, Fly.io docs, ripgrep README) + squint test

- **Hero readout, both widths (fix-now).** The four stealth-check rows, which are the hero's in-viewport proof under the proof-adjacency constraint, render near-invisible. Cause: the `rise` load animation in `theme.css` fades `opacity` 0 to 1 over 500ms with `both` fill, so at first paint the proof is not there, and any capture that races the 500ms window sees it faded. The 390 iframe timing exposed it plainly; the 1440 direct capture happened to land after the fade. This is both a capture-fidelity problem and a real first-paint problem: the one earned motion moment was hiding the very proof the hero depends on. Fixed by making the animation transform-only (a subtle rise, `opacity` held at 1), so the proof is legible at t=0 while the motion moment stays. Edit in `theme.css` (the design record), recorded there in a comment.
- **Vertical rhythm, 1440 (fix-now).** Every section carried the same 64px block padding and a hairline top border, so the page read as a uniform stack of ruled bands. Plan A's own spacing rule calls equal monotone spacing a defect and asks 64 to 96px with variation. Fixed in the comp: major pivots (mechanism, quickstart, data-handling, close) go to 96px, minor sections hold 64px, and the answer block binds under the hero with no rule so it reads as the hero's answer rather than a floating paragraph. Rhythm now comes from space, closer to how the Fly.io docs and the ripgrep README separate matter.
- **Hero headline wrap, both widths (route to copy-fit).** `Automate a real browser sites don't flag` wraps to three lines, and the break falls inside the phrase so `a real` and `browser sites` read as false units. This is copy sitting badly in its rendered shape, which the routing rule sends to the copy-fit pass, not a comp edit. Carried to `copy/hero-candidates.md` step 1: re-pick or confirm the finalist against the real hero form.
- **Mechanism before-and-after, both widths (accepted).** The two-column contrast renders as intended: `cdp.surface` struck through in the CDP-framework column, a clean statement in the Interceptor column, stacking on mobile. On-shape, holds.
- **Quickstart density, both widths (accepted).** The command block, the nested `--surface-2` output pane with its labeled `[TK]` slot, and the two-column capability list carry the densest section without crowding. Holds.
- **Kicker restraint (accepted).** The running amber prompt appears on the hero install block, the two structural pivots (`how it works`, `quickstart`), the quickstart code line, and the close block, four instances that read as a motif rather than an eyebrow before every heading. This is the restrained-dosage read of Plan A's signature, taken at build time against the anti-slop rule and the scanner's absorbed repeated-kicker check (which flags three or more kickers-before-headings); two kicker-before-heading pairs stay under that floor and read as intentional. Holds.
- **Squint test, both widths (accepted).** Hero H1 dominates, the install block reads second, the readout third; the CTA is above the fold at 390. Hierarchy holds.
- **League question, round 1.** Set beside the GitHub dark repo, the Fly.io docs, and the ripgrep README, the comp belongs: calm, no gradient, no stat-row hype, one restrained accent. The readout-visibility and rhythm defects were the two things that kept it a step below the anchors, and both are execution, not direction, so the bounce authority stays unexercised. Correct: the direction is not the problem.
- **Conversion-structure guard.** None of the fixes touches CTA placement, contract-required repetition, or proof density. The readout fix makes the proof more present, which serves conversion rather than trading against it. Nothing deferred to MECLABS arbitration.

## Round 2 · verifies round 1 (no new fronts)

- **Hero readout (verified).** Both widths now paint the four rows solid at capture: `BrowserScan: Normal`, `Pixelscan: Definitely Human`, `CreepJS: 0% headless`, `Fingerprint.com: notDetected`, with the `--status-ok` glyphs and the `[TK]` reproduction line in place. The proof is present at first paint. Resolved.
- **Vertical rhythm (verified).** The 96px pivots and the hero-bound answer block break the uniform-band read; whitespace now separates the major moves from the short connective sections. Resolved.
- **No new findings opened.** Per the step 4 ceiling, round 2 verified the round 1 fixes and did not start new work.

## League verdict

On-league after two rounds. The hero, the compressed instrument surface, the mechanism contrast, and the real status readout sit beside the named anchors without looking louder. The one remaining item, the hero headline wrap, is copy, and it is the copy-fit pass's first input, not a comp defect. The comp is the surface the copy-fit pass fits against and Phase 5 builds from.

## Degraded seam

impeccable absent, so `/impeccable critique` did not run and the critique was walked by hand, with the findings written here in the round format the doctrine specifies. Gate 5's design detect will likewise run degraded (recorded on the gate report at DOGFOOD-7). A morning rebuild with impeccable installed is the stronger test of this seam.

## Post-copy-fit render

`comp-1440-fit.png` is the comp after the copy-fit pass applied its two shape fits (S5 safety controls and S7 disqualifiers presented as lists, matching their confirmed shapes). It confirms the fitted list shapes render clean at 1440 and that nothing else moved. The frozen copy is `copy/copy-approved.md`; the re-pick record is `copy/hero-candidates.md`.
