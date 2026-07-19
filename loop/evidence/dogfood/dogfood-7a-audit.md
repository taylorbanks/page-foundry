# dogfood-7a-audit.md: Interceptor page, offline gate audit

DOGFOOD-7a runs the render-independent gates over the built page
(`loop/evidence/dogfood/interceptor/pages/interceptor/index.html` and its
`theme.css`), read-only, with no screen needed. The screen was locked at this
iteration (`CGSSessionScreenIsLocked=Yes`), so the render-dependent gates (1
re-score, 4, 5) and the 390 and 1440 renders defer to the render slice per
lessons 30 and 35. This file is the partial gate report; the render slice
consolidates it into the final gate-report table with the foundry-log entry.

The audit method for every claim: trace it to a real source and cite the line.
The two real sources are the Interceptor skill (`~/.claude/skills/Interceptor/SKILL.md`)
and the live product repo (`~/projects/interceptor/`, README plus `docs/native/`).

## Result at a glance

| Gate | Result | One line |
|---|---|---|
| 2 Voice (verbatim half) | PASS | build faithful to the snapshot; title and meta exact-match |
| 3 Accessibility (static half) | PASS | contrast clean; one minor landmark finding (no `<footer>`) |
| 6 AI discovery | PASS | JSON-LD valid, llms.txt present, OG file real at 1200x630 |
| 7 Measurement | PASS | plan present and honest; on-page wiring deferred to deploy |
| 8 Integrity | FAIL | one fabricated feature, two stale claims, two `[TK]` to resolve |

Gate 8 failing is the dogfood doing its job. The page does not yet pass its own
gates; the fixes are enumerated below and owned by the render-slice split.

## Gate 2, voice, verbatim half: PASS

Rendered text extracted from the built HTML (comments, scripts, styles dropped,
tags stripped) and diffed against `foundry/copy/copy-approved.md`.

- Every snapshot body line appears in the build. Three lines read as a shape
  rather than a sentence and were confirmed token by token instead: the hero
  stealth card (label plus four checked rows), the hero nav, and the footer nav.
  Every word is verbatim and in reading order; only card and nav markup sits
  between the words. This is the list-render boundary the build notes flagged
  for this gate, now confirmed.
- `<title>` and meta description match the snapshot's labeled entries character
  for character (title 56 chars, meta 145 chars, both inside the Phase 3 length
  budget).
- The word scan, the pattern pass, and the humanizer pass are recorded clean in
  the DOGFOOD-4 and DOGFOOD-5b process records; `verify.sh` re-runs the scanner
  self-test and scans the built files.

Note on scope: Gate 2's own no-fabricated-specificity line overlaps Gate 8 and
is answered there. The page carries no testimonial quote, so the quote-search
line is satisfied trivially.

## Gate 3, accessibility, static half: PASS, one minor finding

Computed from the markup and `theme.css` tokens. The interactive checks (real
focus visibility, tab order in a browser) defer to the render slice, which
Gate 3's own executor note allows.

- One `h1`; heading levels run 1,2,2,3,3,2,... with no skip greater than one.
- Landmarks: `<main>` present, `<nav>` present (hero and footer navs, each with
  an `aria-label`). MINOR FINDING: no `<footer>` element. The closing links sit
  in a `<nav aria-label="Footer links">` inside the last `<section>`. Wrapping
  them in a `<footer>` landmark improves screen-reader landmark navigation. This
  is an HTML fix, not a copy fix; it rides with the render-slice rebuild.
- Real `a` and `button` elements; the checkmark glyphs and the middot separators
  are `aria-hidden` with real text beside them, so no icon-only control lacks a
  name.
- Contrast, computed against the named tokens (WCAG 2.2 AA):
  - `--text` on `--ink` 15.76, `--text` on `--surface` 14.46, `--text-dim` on
    `--ink` 7.71, `--text-dim` on `--surface` 7.07, `--text-dim` on `--surface-2`
    6.47. All clear the 4.5 body floor.
  - The install CTA link (`--signal` on `--surface`) 8.56. The status glyph
    (`--status-ok` on `--surface`) 7.27. The focus ring and kicker glyph
    (`--signal` on `--ink`) 9.33, clears the 3.0 non-text floor.
  - Two pairs fall under 3.0: `--line` on `--ink` (1.48) and `--line` on
    `--surface` (1.35). These are the 1px hairline section dividers and the
    container borders on the readout, contrast, and install panels. They are
    exempt from WCAG 2.2 SC 1.4.11: a decorative divider is not required to
    identify a component or understand content, and the panels are also set off
    by their `--surface` fill and their headings, so the border is not the only
    cue. ACCEPTED with that reason, not a fix.
- `:focus-visible` is defined (2px `--signal` outline, 2px offset); hover states
  raise underline thickness, so no state signals by color alone.
- `prefers-reduced-motion` is honored and the one motion moment animates
  `transform` only, per the DOGFOOD-5b comp fix.
- Zero `<img>` elements, so the informative-image alt and dimension lines read
  N/A. The OG image is a meta reference and the favicon is a link.

## Gate 6, AI discovery and meta: PASS, one minor note

- JSON-LD parses and is valid `SoftwareSourceCode` (name, description,
  `codeRepository`, Organization author). `programmingLanguage` and a license URL
  are omitted honestly: the sources do not state the primary language and a
  non-standard `Other` license has no SPDX URL. Omission beats a guess.
- `llms.txt` present at the page root, facts sourced to the brief.
- `robots.txt` absent. Absence disallows no crawler, so the crawler-allow line
  passes. MINOR NOTE: an explicit allow-all `robots.txt` is a nice-to-have the
  render-slice rebuild can add; it is not a gate failure.
- The answer block survived the build as a self-contained 54-word block right
  after the hero, machine-extractable, no `[TK]` inside it.
- `<title>` and meta description match the snapshot exactly and stay inside the
  length budget (checked under Gate 2).
- Open Graph and Twitter card complete. `og:image` is an absolute URL, the file
  ships in `assets/`, and it measures 1200x630 (confirmed with `sips`).
  `twitter:card` is `summary_large_image`. The canonical and OG origin is the
  reserved placeholder `interceptor.example`; the owner sets the real origin at
  deploy (OWNER-REVIEW, documented in the page head and build notes).
- Canonical set; `favicon.svg` present and linked.
- On-page audit (seo-audit): N/A degraded, the skill is absent; the mechanical
  head checks above ran regardless.
- `/pricing.md`: N/A, `oss-project` carries no public pricing block.

## Gate 7, measurement: PASS, wiring deferred to deploy

- The Phase 2 spec carries a measurement plan (`page-spec.md`, measurement
  section): a `cta_install_click` outbound-click intent event fired by a
  deferred, non-blocking analytics call, with off-page installs measured at the
  source (GitHub insights, release download counts) rather than claimed on-page.
  The UTM convention binds only owner-controlled sources. The plan is present and
  honest, which is the Phase 2 bar this gate verifies.
- The built static page wires no analytics provider, because a dogfood has no
  domain and no analytics account to point at. Wiring a call to an invented
  endpoint would be fabrication. So the on-page event is consciously deferred to
  deploy (OWNER-REVIEW), recorded here rather than silently skipped.

## Gate 8, integrity: FAIL

Traced clean (each cited to a real source):

- The stealth checks (`BrowserScan Normal`, `Pixelscan Definitely Human`,
  `CreepJS 0% headless`, `Fingerprint.com notDetected`) match the real
  `SKILL.md` verification table (lines 298 to 302) and are labeled vendor-stated
  on the page.
- The compound commands (`interceptor open`, `read`, `act`, `inspect`) are real
  (`SKILL.md` lines 100 to 109, README lines 100 to 132).
- The no-CDP mechanism and the sessions-stay-local claim are real and central to
  both sources.
- The documented limitations (a screenshot that ignores scroll position, a
  broken `--clip` flag, `eval` blocked on strict-CSP sites) match `SKILL.md`
  lines 288 and 290 verbatim.
- The category-validation names (felarof's C++ APIs, `Intuned`, `Browser Cash`,
  `pydoll`) are a `voc.md` paraphrase (line 53), attributed as a paraphrase and
  never styled as a testimonial.
- The panic hotkey and the bundle-ID denylist over Keychain, 1Password, System
  Settings, and banking apps are real (README lines 1261 and 1262,
  `docs/native/safety.md`). The license `Other` classification is real
  (reconciled at DOGFOOD-6a).

Findings (the page fails Gate 8 until these resolve):

- **F-A, high, fabricated feature.** S5 lists `Masking on sensitive fields` as a
  safety control. No such feature exists: a repo-wide search for `mask` finds
  only an unrelated dyld symbol-interposition detail (`docs/native/agent.md`).
  The real controls are the panic hotkey and the frontmost-app denylist gate,
  and the denylist is already the third bullet. A claimed safety feature that
  does not exist, on a security tool's page, is the exact defect this skill
  exists to catch. FIX: remove the bullet. Provenance: the brief
  (`product-marketing.md` line 144) mis-summarized the README frontmost-app gate
  as `sensitive-field masking`, and it propagated to the page.
- **F-B, medium, stale factual claim.** The S10 FAQ answer says Windows and Linux
  support are `[TK]` and not claimed here. That is false: browser-only `Works on
  macOS and Windows` (README line 206) and Linux browser-only support was
  contributed (README line 1323, PR 83). The signed `.pkg` is macOS-only (README
  line 79); Windows and Linux install from source. FIX: correct the FAQ to the
  real support matrix.
- **F-C, medium, stale factual claim.** S6 says the CI and headless story for the
  browser surface is `[TK]`. CI flow tests are a named browser-only use case
  (README line 79), and there is no true headless-without-a-window mode by
  design, because the tool drives a real browser. FIX: state the CI use case and
  the no-headless-window reality instead of `[TK]`.
- **F-D, low, resolvable offline.** S1 says `Independent reproduction is [TK]`.
  This is genuinely unknown, so reword to a plain statement (the results are the
  vendor's own; independent reproduction is not yet published) rather than leave
  a placeholder token on a shipped page.
- **F-E, blocked on the screen.** S4 shows a quickstart output pane holding a
  `[TK]` marker. Real output exists but needs a live capture, which the locked
  screen blocks. Capture it in the render slice, or cut the output pane if the
  screen stays locked; do not invent output.

Nuance, not a hard finding: S7's not-for line names `a pure Linux or Windows CI
job with no desktop`. The `with no desktop` qualifier is accurate (no
headless-no-window mode), so the line is defensible; refine its wording
alongside F-B and F-C for consistency.

F-B and F-C are the DOGFOOD-6a lesson (lesson 37) applied to platform and CI
claims: 6a reconciled the repo name and license against the live repo but not
the platform claims, and those drifted as the repo gained Windows and Linux
browser-only support. Gate 8 at ship is exactly where the drift is caught.

## Fixes and who owns them

Offline copy corrections (one voice-chain re-entry, re-freeze, rebuild, re-diff):
F-A, F-B, F-C, F-D, the S7 refinement, plus the `<footer>` landmark and the
optional `robots.txt` in the same rebuild. None need the screen.

Screen-blocked: F-E (the quickstart capture) plus the render gates (Gate 1
independent re-score on the rendered page, Gate 4 performance, Gate 5 render
review and design detect) plus the 390 and 1440 renders.

The backlog splits accordingly: an offline fix slice, then a render slice that
carries the consolidated gate-report table and the foundry-log entry. DOGFOOD-FULL
is done only when the render slice passes the page's own gates.
