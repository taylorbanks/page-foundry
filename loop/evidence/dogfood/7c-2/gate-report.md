# gate-report.md: Interceptor dogfood (DOGFOOD-7c-2, render gates, consolidated)

The consolidated ship-gate report of record for the Interceptor dogfood page
(`loop/evidence/dogfood/interceptor/pages/interceptor/index.html`). Gates 1, 4, and 5
are this slice's fresh work on the rendered page; Gates 2, 3, 6, 7, and 8 were run in the
earlier dogfood slices and are carried here with their evidence pointers so the page has
one gate report. DOGFOOD-FULL completes here.

## Render tooling this run: headless-Chrome fallback (screen locked)

The intended path is `loop/pf-render.sh` for 1440 and the iframe wrapper for 390, both
through Interceptor. The machine screen is locked this run (`CGSSessionScreenIsLocked=Yes`
in `ioreg -n Root -d1`, unambiguous per lesson 44; `stat -f %Su /dev/console` is `taylor`,
Chrome is running). A locked screen denies the window server, so Interceptor's
`captureVisibleTab` hangs and `pf-render.sh` cannot activate Chrome. Both captures were
taken with headless Chrome (`--headless=new`, temp user data dir, a separate offscreen
process that renders without the locked GUI), the documented AUDIT-F2 fallback (lesson 35).
The pixels are real: the real page, rendered by the real Chrome engine, captured through a
headless mode because the screen is locked. Each capture was wrapped to kill the process
once the output file appeared (lesson 41). The 390 view is a real 390px iframe inside a
430px window (`renders/wrap390.html`), so the mobile media queries fire at a true 390 and
the 500px window floor does not apply (lesson 27).

OWNER-REVIEW: the success gate names "390/1440 renders captured via Interceptor." This
run's captures are the headless fallback because the screen is locked. The pixels are
faithful, but a morning rerun with the screen unlocked would capture the same views through
Interceptor proper. Flagged in the overnight report; the same flag stands on every dogfood
render slice this run.

## Consolidated gate table

| Gate | Verdict | Evidence |
|---|---|---|
| 1 Conversion audit (MECLABS) | PASS with an accepted flag and a recorded finding | this file, Gate 1 below; `foundry/conversion-audit.md` (pre-build record) |
| 2 Voice scan and verbatim copy | PASS | `dogfood-7a-audit.md`, `dogfood-7b-fixes.md`, `7c-1/dogfood-7c-1-fe.md`; re-diffed this slice (CSS-only edit, text unchanged) |
| 3 Accessibility | PASS | `dogfood-7a-audit.md` (Gate 3 dispositions); focus-state render this slice |
| 4 Performance | PASS with a real-ship font open item | this file, Gate 4 below |
| 5 Render review | PASS after one fix | this file, Gate 5 below; `renders/` |
| 6 AI discovery (schema, llms.txt, head) | PASS | `dogfood-7a-audit.md`; `pages/interceptor/llms.txt`, JSON-LD in `index.html` |
| 7 Measurement | N/A (no analytics wired in the dogfood; open-source acquisition, no form) | `dogfood-7a-audit.md` |
| 8 Integrity (no fabricated proof) | PASS after the 7a and 7b corrections | `dogfood-7a-audit.md`, `dogfood-7b-fixes.md` |

## Gate 1: Conversion audit, rendered re-score

The pre-build audit (`foundry/conversion-audit.md`) scored the draft twice: builder self
31, independent cold 18, a 13-point divergence it attributed to two elements deferred to
the build under the integrity rule (the install affordance and the real quickstart output).
It set a falsifiable prediction: on the rendered page, I, F, and V recover and A stays near
3, which would show the divergence was a pre-build `[TK]` artifact. It also set the failure
condition: "if the rendered re-score does not move I, F, and V up, that is a real defect to
open."

The rendered re-score of record was produced by a fresh general-purpose agent (opus) given
only the built `index.html`, the two render captures, and the brief (`product-marketing.md`),
with the spec, the message architecture, the persuasion map, the drafting context, and both
prior scores withheld. Its verbatim return is in `renders/rescore-independent.txt`.

Formula: C = 4M + 3V + 2(I − F) − 2A, each factor 1 to 5.

| Factor | Pre-build self | Pre-build cold | Rendered cold (record) | Predicted at build | Actual move |
|---|---|---|---|---|---|
| M motivation | 5 | 4 | 4 | hold | held 4 |
| V value | 5 | 4 | 4 | up to 5 | held 4 |
| I incentive | 3 | 2 | 2 | up to 3 | held 2 |
| F friction | 3 | 4 | 3 | up to 3 | up to 3 |
| A anxiety | 2 | 3 | 3 | near 3 | held 3 |
| C | 31 | 18 | 20 | toward 31 | 20 |

Rendered independent C = 4(4) + 3(4) + 2(2 − 3) − 2(3) = 16 + 12 − 2 − 6 = 20.

**The prediction was one of three.** Only F recovered (4 to 3), on the install affordance
now being present. I held at 2, V held at 4, A held at 3. The rendered cold score of record
is 20, still 11 points under the builder self of 31. Per the completion note this is a real
finding, recorded here rather than smoothed over.

**What the finding means, honestly.** Most of the 13-point pre-build divergence was not a
deferred-`[TK]` artifact. About 2 points of it were (the F recovery once the install
affordance landed). The remaining gap is builder optimism on I, V, and A against factors the
build cannot change without fabrication:

- I held at 2 because a free open-source tool offers no honest act-now stimulus, and the
  persuasion map deliberately rejected manufactured scarcity and urgency for this
  hype-averse buyer. Raising I would mean inventing a false incentive, which fails Gate 8.
  I=2 is the honest ceiling; the pre-build disposition already accepted it as such, and the
  rendered read confirms it is stable, not a `[TK]` artifact.
- V held at 4 because the core stealth claim is vendor-stated with no published independent
  reproduction, and adoption proof is zero. The real quickstart output (now present, and
  after this slice's fix fully legible) lifted value credibility but not past the
  unproven-core-claim ceiling. Reaching V=5 needs independent reproduction or adoption
  proof; neither exists, and inventing either fails Gate 8.
- A held at 3 because the license is now stated, but residual doubt (an unreproduced core
  claim, no social proof, automation against real logged-in accounts) is real and managed
  by candor, not removed.

**Disposition.** I=2 is FLAGGED and accepted as the honest ceiling (same disposition as
pre-build; manufacturing an incentive fails the integrity gate). The rendered conversion
score of the page is 20. That is the correct number for a rigorous oss launch page whose
central claim is not yet independently reproduced and that refuses to fabricate proof. The
defect the completion note anticipated is not a fixable copy defect. It is a self-score
optimism of about 11 points, corrected here by the cold read of record, and a doctrine gap:
the conversion-audit recovery framing can read a build-unfixable honest ceiling as a page
defect and so pressure a future run toward fabrication, the exact failure lesson 34 warns
about. That doctrine gap is filed (see the run records) and left to the owner, not closed by
touching this page.

Checklist carried from the pre-build audit and re-confirmed on the rendered page: one
primary CTA (the signed `.pkg` download) present and identical in the hero and the close;
proof within one viewport of each CTA (the stealth readout beside the hero CTA, the
quickstart above the close CTA); 5-second test passes cold on the rendered headline and
subhead; no form, so form checks are N/A.

## Gate 4: Performance

- Total transfer the page loads: `index.html` 18.6KB plus `theme.css` 5.7KB plus
  `assets/favicon.svg` 0.5KB, about 24.8KB. Well under the ~1MB target. `assets/og.png`
  (34KB) is a social-scraper card referenced only in the head meta, not loaded on the page.
  PASS.
- CSS and JS: `theme.css` 5.7KB plus the inline build-composition `<style>`, and no external
  or executable JavaScript (the one `<script>` is `application/ld+json`, data not code, not
  render-blocking). Well under the ~200KB target. PASS.
- Images: no on-page raster images. The favicon is vector. Nothing needs explicit
  `width`/`height` on the page; the OG card carries its 1200x630 in the meta. PASS.
- Fonts: the page renders on the system fallback stacks (`ui-monospace` for the mono display,
  `system-ui` for the body), because the self-hosted IBM Plex `woff2` files are not bundled
  in this dogfood. With nothing to swap to, there is no font-swap reflow this run, so no CLS
  from fonts. PASS in this state. Real-ship open item (already named in `build-notes.md`):
  bundling two `woff2` files needs a preload plus a metric-matched `size-adjust` fallback on
  the `@font-face` blocks in `theme.css`, which currently declare `font-display: swap` but
  no `size-adjust`. The `size-adjust` value cannot be computed without the actual `woff2` to
  measure, so it is honestly deferred to the ship that bundles the fonts, not invented here.
- No render-blocking third-party scripts; no analytics wired. PASS.
- Layout stability (CLS): the one animation is the hero readout rise, transform-only (a 6px
  `translateY` to none), which is composited and does not shift layout; the opacity fade that
  did threaten first-paint legibility was removed at the comp stage (`comp/rounds.md` round
  1). Nothing loads in above existing content. PASS.
- LCP element: the hero H1 text block, "Automate a real browser sites don't flag." It is the
  largest in-viewport element, a text block rendered immediately on the system font, never a
  script-injected node. Named here per the gate. With a 25KB static page and no
  render-blocking resource, LCP lands at first paint, well under the ~2s target. A full
  Lighthouse run is deferred to the unlocked rerun (headless under a locked screen is not a
  reliable field-metrics environment); the mechanics above are the static read.

## Gate 5: Render review

- Captures: `renders/render-1440.png` (1440 wide, full page) and `renders/render-390.png`
  (true 390 via the iframe wrapper). Both reviewed at both widths.
- Squint test, both widths: with the page blurred, the hero H1 reads as the primary element,
  the vendor-stated stealth readout card as the secondary, and the section groupings hold,
  all identifiable within 2 seconds, hero first then section by section. Rhythm comes from
  space (64px minor sections, 96px major pivots, the answer block bound under the hero with no
  rule), not from uniform ruled bands. PASS.
- Grid and recomposition: the 960px container with a centered 68ch measure holds at 1440; the
  hero is a 7fr/5fr two-column grid above 1025px and stacks below it; the mechanism contrast
  is two columns above 1025px and stacks on mobile; the readout is two columns only in the
  720 to 1024 tablet band. The composition recomposes per breakpoint rather than only
  reflowing, which the 390 capture confirms. PASS.
- One fix this slice (the render caught what a token plan cannot, lesson 33): the two
  terminal blocks in the quickstart used `theme.css`'s `overflow-x: auto`, which clipped the
  real captured output's longest line ("...Avoid use in operations.") off the right edge at
  1440 AND at 390, so the heaviest oss-project proof was truncated on both widths. Fixed by
  soft-wrapping the terminal blocks (`white-space: pre-wrap; overflow-wrap: anywhere` in the
  page's build-composition `<style>`), which is the faithful render since a real terminal
  soft-wraps long lines at the column width, and which shows every character. Short structured
  lines (`Tab:`, `[e1] link`, the `---` separator) are unaffected. The re-render confirms the
  command and the full output are legible at both widths, and the overflow probe reads
  `output=386/386` (scroll width equals client width, no overflow). The edit is CSS only, so
  the Gate 2 verbatim snapshot still holds (the rendered text is byte-identical; the
  previously-clipped line is present in the extracted text).
- Focus-state render: `renders/render-1440-focus.png` shows the `:focus-visible` ring
  (a 2px `--signal` amber outline at a 2px offset, values from `theme.css`) on the install CTA
  link and the first nav link. The ring is clearly visible and high-contrast on the dark
  ground, and it is a shape change, never color-only. PASS.
- Design detect, degraded (impeccable absent, preflight): the deterministic detector did not
  run, so the built page was critiqued by hand against the anti-slop list in
  `references/design-direction.md`. Zero anti-slop findings. Item by item: the readout is real
  vendor-stated data in a labeled card, which the list explicitly allows, rather than the
  big-stat gradient hero the list rejects; the mono display face carries a stated CLI-identity
  reason; the radii are deliberately varied (4px panel, 6px code, 999px pill) rather than one
  uniform value; the imagery is real terminal output rather than stock or generated art; the
  section markers are a typographic amber prompt glyph and functional check glyphs in a
  labeled data card, so emoji markers stay off the page; and the one motion moment is
  transform-only and earned. The page carries a flat dark ground with two functional accents,
  so the gradient, glass, and card-shadow tells stay absent. Per the header doctrine, zero
  findings is a floor: it
  means no known tell fired, and the squint test and the screenshot critique above ran in
  full beside it. The scan is marked degraded; a morning rebuild with impeccable installed is
  the stronger test of this seam.
- comp-record present: `comp/rounds.md` records the Phase 4.5 comp critique across two rounds
  with fix-now, next-round, and accepted dispositions, and its league verdict. Present.

## Net

The render gates pass. Gate 5 caught and fixed one real truncation-of-proof defect. Gate 1's
rendered re-score is 20 with I=2 accepted as an honest ceiling, and it records a real finding:
the pre-build recovery prediction held for F only, and the residual gap to the builder self of
31 is integrity-constrained optimism, not a fixable copy defect. The page passes its own gates.
The one carried caveat is the render tooling: headless fallback because the screen is locked,
so the success gate's "via Interceptor" line wants a morning unlocked rerun (OWNER-REVIEW).
