# 13p micro-dogfood: OG image and favicon produced in Phase 5, checked at Gate 6

Backlog item 13p (order-audit F3, separable). The gap: Gate 6 checked for a real OG image (1200x630) and a favicon, and no phase produced either. The new Phase 5 bullet makes both build deliverables; the Gate 6 lines are now mechanical checks against what Phase 5 shipped. This walk exercises the generated-card path end to end on the Logship fixture (the same fictional dev tool as the 13k grid fixture) and then runs the Gate 6 checks against a conforming head and a drifted one.

## Production (the new Phase 5 bullet, generated-card path)

Inputs, exactly what the bullet allows: `fixture/theme.css` (brand tokens: field, ink, accent, display face) and `fixture/copy-approved-excerpt.md` (the labeled entries; card text is copy).

- `fixture/og.html`: the card source, a fixed 1200x630 stage styled only from the theme tokens, carrying only snapshot copy (the product name and the H1). Per the bullet it lives in the run artifact directory, since only the capture deploys.
- Capture, with the screenshot tooling Gate 5 names (headless Chrome):

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new \
  --disable-gpu --force-device-scale-factor=1 --hide-scrollbars \
  --window-size=1200,630 --screenshot=assets/og.png "file://$PWD/fixture/og.html"
```

- `fixture/favicon.svg`: the token-derived letterform mark (initial in the display face on the brand field); `xmllint --noout` reports valid XML, and no render step was needed to produce it.
- `assets/apple-touch-icon.png` (180x180): captured from `fixture/icon-180.html`, the same mark on a square stage, per the with-render-tool clause.

Both captures were opened and looked at: the card shows the accent eyebrow LOGSHIP (the source string `Logship`, uppercased by CSS), the H1 in the display face on the brand field, and the accent rule; the icon is the letterform mark.

## Gate 6 mechanical checks, verbatim output

Check 1, the `og:image` filename resolves to a shipped file:

```
fixture/head-match.html -> https://logship.example/assets/og.png -> assets/og.png EXISTS: pass
fixture/head-drift.html -> https://logship.example/assets/og-hero.png -> assets/og-hero.png MISSING: FAIL
```

The drifted head points at a file the build never produced, which is exactly the meta tag the new gate line fails.

Check 2, the file measures 1200x630 (`sips`):

```
  pixelWidth: 1200
  pixelHeight: 630
```

The touch icon measured 180x180 the same way.

Check 3, card text traces to the snapshot: both card strings (`Logship`; `One command turns raw logs into a report`) found in `fixture/copy-approved-excerpt.md` by plain text search, the same mechanic Gate 2 uses for quotes. A card string this search cannot find is wording that skipped the voice gate and takes the Phase 3 step 5 re-trigger.

Check 4, favicon linked: the conforming head carries `rel="icon"` pointing at the shipped `favicon.svg` plus the `apple-touch-icon` link; the drifted head carries neither, and grep returns 0 for it.

## What this proves, against the item's acceptance

- Produced, not just verified: real `og.png` and `favicon.svg` files exist on disk, made from the run's own tokens and snapshot copy with tooling the skill already names; nothing was declared without an artifact behind it.
- The integrity rule holds: the card stages nothing. It is typography over brand tokens carrying approved copy; no product screenshot, no invented proof, no fabricated scene.
- The Gate 6 lines are now mechanical: file existence, pixel dimensions, and a text search, each shown above with the failing counterexample.

Not exercised here: the brand-supplied path (a brief handing over its own image, sized rather than generated) and the no-render-tool ask, which are doctrine branches with no artifact to produce; DOGFOOD-FULL runs the generated path again inside a full build.
