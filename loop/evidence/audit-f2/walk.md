# AUDIT-F2 micro-dogfood: one comp round, walked on a real page

Fixture walk of the new Phase 4.5 comp stage (SKILL.md), 2026-07-18. The standing page `docs/index.html` for the page-foundry property plays the comp; its live theme is `docs/theme.css` (the Slab direction). This walk exercises the without-impeccable path deliberately, to prove the `comp/rounds.md` record format; the clone at `~/projects/impeccable` stays untouched. Labeled a fixture throughout: the page is shipped, so findings are recorded, and nothing is edited here (docs restyle decisions belong to #22 and the 19b truth pass).

## Branch exercised first: no scene sentence on record

The docs property predates the brief-discipline artifacts, so the walk enters through the new step 2 branch: write the scene sentence and anchors from the theme and the positioning before the first round.

Scene sentence (derived from the `theme.css` header comment and the README positioning): a developer who has shipped three AI-looking pages this month reads this after dark at a desk, terminal open beside the browser, skeptical, deciding in one scroll whether this tool is different. The dark-versus-light call it forces: the page answers a dark-mode reader with a white print-manifesto ground, a deliberate contrast against the dark-dashboard default of its own category.

Named anchors (fixture derivation; a real run names these with the user at Phase 4): Berkeley Graphics and Teenage Engineering, both real properties known for exactly this slab, spec-sheet, type-led register. League question per the new doctrine: set beside those two, does this page belong?

## Captures (both real, tooling caveats recorded)

- `comp-1440.png`: headless Chrome, `--window-size=1440,3400 --screenshot`, layout verified sane at that width.
- `comp-390-wrap.png`: 600px-wide capture of an iframe wrapper page (`wrap390.html`, iframe fixed at 390px) because two tools failed honestly first:
  1. Headless Chrome (`headless=new`) floors the window width at 500. A probe page measured `innerW=500` under `--window-size=390`, so a naive "390 screenshot" is a 500px layout cropped to 390, and every line of text clips at the right edge. That artifact fabricates an overflow finding the page does not have. An iframe's viewport is its own box, so media queries inside honor 390 for real; the blank strip right of x=390 in the capture is the wrapper surround.
  2. `sips --cropOffset` on this macOS silently center-crops (tested twice, both flag orders), which cut the left edge instead; the uncropped wrapper capture is the honest artifact.

## Round 1 record, in the `comp/rounds.md` format the doctrine specifies

### Round 1 · 2026-07-18 · reviewed against: scene sentence + anchors (Berkeley Graphics, Teenage Engineering) + squint test

- Hero, both widths: holds. The oversized grotesque with knockout-outline words dominates the squint read, the install command block reads second, the red eyebrow chip grounds it. On-league. (accepted, no change)
- Showcase section (`THREE REAL PAGES`), 1440: the three example thumbnails render at three different internal scales, and the two stacked right cards read near-illegible at capture scale. The anchors would align module scale before shipping this. (next-round: align the internal scale of the three cards, or give the two small cards a treatment that stops pretending to be readable pages)
- StreamPatron thumbnail, both widths: the card crop cuts its hero sentence mid-line (`and let them` then the clipped `help keep it`). Reads as a broken render rather than a deliberate crop. (fix-now in a real run: recrop the source capture; recorded only, page untouched here)
- Mid-page rhythm, 1440: section padding is a constant, so the manifesto quote section and the orchestrator section carry the same visual weight; the craft rule wants rhythm from contrast. (next-round: one deliberate density break, inside existing tokens)
- Squint test, 390: h1 then the red section headers carry the scan; CTA visible without scrolling past the hero. Holds. (accepted, no change)
- Copy-fit input, per the routing rule: none surfaced; the copy sits inside its shapes at both widths. Nothing routed to the copy-fit pass.
- Conversion-structure guard, per the deferral rule: none of the findings above touches CTA placement, contract repetition, or proof density; nothing to defer to MECLABS arbitration.

League verdict, round 1: close but not there. The hero, the slab grid, and the gate-report card belong beside the anchors; the showcase module's scale mismatch and the mid-sentence thumbnail crop are the two things neither anchor would ship. This is an execution verdict, so the bounce authority stays unexercised, which is correct: the direction is not the problem.

Exit ruling for the fixture: the walk ends after round 1 with the verdict recorded, a legal exit under step 4 (the record answers the question either way and is what Gate 5 reads). A real run would spend round 2 verifying the two fixes.

## Overlap notes

- The impeccable detect findings on this page (numbered section markers, wide border accents) are #22's accepted-or-restyle question; this round did not re-adjudicate them.
- The two fix-now/next-round findings above are routed to #22 as additional docs observations rather than acted on here.

## What this proves about the shipped doctrine

1. The missing-scene-sentence branch produces a usable reference from theme plus brief in one paragraph.
2. The round record format holds real findings with the three tags, the copy-routing line, and the deferral guard, without impeccable.
3. The league question separates ceiling findings (module scale, rhythm) from floor checks (the detector caught none of these); the stage adds judgment the gates did not already own.
4. The 390 capture path for comps and Gate 5 has a real trap: a headless "390" screenshot at window floor 500 fabricates overflow. The Gate 5 line now warns about it; DOGFOOD-FULL must render 390 through real viewport emulation or an iframe wrapper page.
