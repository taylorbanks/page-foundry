# Micro-dogfood: item 18 gate teeth walked against `docs/index.html`

The three new checklist lines from item 18 (#18), each walked against the repo's real
built page, to confirm each line, as written, produces a verdict a gate runner can
act on, and that the teeth surface real defects rather than restating vibes.

## Gate 3: interactive-state completeness

Read of `docs/theme.css` against the new line:

- Focus: `a:focus-visible,button:focus-visible{outline:3px solid var(--red);outline-offset:2px}` (line 20). Ring is 3px, inside the 2 to 3px spec; offset 2px outside the element; covers both interactive element types the page uses. PASS on the focus half.
- Hover: `.nav__links a:hover{color:var(--red)}` (line 33) and `.foot a:hover{color:var(--red)}` (line 126) change color only. The new line says a state change never signals by color alone, so both are findings. `.cmd__c:hover{background:#ff5638}` (line 62) shifts background luminance as well as hue; recorded as borderline, not a finding.
- Hover-only content: none on the page.

Verdict: the line bites. Two real findings on a page that shipped before the line
existed, routed to #22 (the docs restyle issue) rather than fixed here, since docs
styling is that item's scope.

## Gate 4: LCP mechanics + layout stability

Read of `docs/index.html` and `docs/theme.css` against the two new lines:

- LCP element, named as the line requires: the hero `h1` text block. Real text, in the initial HTML, no script injection. The page has no hero image, so the `fetchpriority` clause reads N/A.
- All 3 `<img>` elements carry explicit `width`/`height` and `loading="lazy"`, and all three sit below the fold (the showcase section). PASS.
- Fonts: system stack only, no `@font-face`, so the metric-matched fallback clause reads N/A by its own terms.
- Nothing injects content after first paint; the page is static. PASS.

Verdict: walkable as written, with the N/A branches landing where the page genuinely
lacks the mechanism, which is the shape an honest checklist needs.

## Gate 5: squint test

Method: 1440px capture via headless Chrome (`docs-1440.png`; 1440 is unaffected by
the desktop window floor recorded in lesson 27), blurred by pixelation proxy: `sips`
downscale to 80px wide, upscale back (`docs-1440-squint.png`).

Read of the blurred capture, per the line: hero first, the primary element (the H1
block) is unmistakable within 2 seconds; the secondary element (the dark command
block, hero right) reads next; groupings separate cleanly section by section (red
kicker chips, the screenshot band, the red-ruled callouts, the phase table, the gates
checklist, the closing terminal block). One observation: the muted words inside the
H1 wash out when blurred, but the block stays the page's clear primary. Verdict: PASS
in 2 seconds, section walk included.

## Files

- `docs-1440.png`: the raw 1440 capture.
- `docs-1440-squint.png`: the pixelation-proxy blur the verdict was read from.
