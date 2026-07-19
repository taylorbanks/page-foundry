# tokens/plan-c-signal-structural.md: Interceptor (Phase 4 candidate)

Candidate token plan C, from the same `frontend-design` invocation. It contrasts with A on **density** (a denser, more graphic structure against A's compressed calm) and with both A and B on **temperature within dark** (a cool teal signal against A's warm amber). It is recorded for the log and for the copy-fit fallback, and it is the plan Phase 4.5 could bounce back to if the winner failed the comp critique.

## Direction in one line

A blueprint-dark control surface: a faint graph-paper grid, cool cyan-teal signal, and the capabilities laid out as weighted tiles, reading like the schematic of a system that sits between the agent and the browser.

## Scene sentence and named anchors

- **Scene sentence.** An infrastructure engineer scans this on a wide monitor between two other dashboards, wanting to see the whole system at a glance before reading any one part.
- **Named anchors:** the Linear changelog pages, the Vercel dark dashboard, and an oscilloscope or logic-analyzer UI. Structured, technical, cool.

## Palette

| Token | Hex | Job |
|---|---|---|
| `--ink` | `#0B0F14` | Page ground, coolest of the three darks. |
| `--surface` | `#131A22` | Tiles and panels. |
| `--surface-2` | `#1B2530` | Nested output. |
| `--grid-line` | `#182029` | The faint blueprint grid, drawn at low opacity so it never competes with content. |
| `--line` | `#28313D` | Structural hairlines. |
| `--text` | `#DCE3EA` | Primary text, contrast 13.9:1 on `--ink`. |
| `--text-dim` | `#8D99A8` | Secondary, contrast 6.2:1. |
| `--signal` | `#46C6C0` | The single cool accent: CTA, active tile edge, status. Disciplined, one teal, no glow. |
| `--signal-ink` | `#07231F` | Text on a `--signal` fill, contrast 8.4:1. |

Color strategy **Committed**, but the blueprint grid raises the ambient color presence above A's restrained read.

## Type

- **Display: Archivo** (a grotesque with tight, structural forms), 600 and 700, for the schematic feel.
- **Body: IBM Plex Sans**, 400 and 500.
- **Code: IBM Plex Mono**, 400.
- Five sizes on 1.25 (a tighter ratio for the denser layout): 16 / 20 / 25 / 31 / `clamp(31px, 4.5vw, 44px)`.

## Layout grid

Denser and wider than A, to hold the tile structure.

| Breakpoint | Container max | Columns | Gutter | Side padding |
|---|---|---|---|---|
| Mobile (up to 640px) | fluid, 100% | 1 | n/a | 16px |
| Tablet (641 to 1024px) | 840px | 8 | 20px | 20px |
| Desktop (1025px and up) | 1120px | 12 | 24px | 24px |

The "more than stealth" capabilities render as weighted tiles (network capture large, record-and-replay and scene graph medium, the bridge small), a near-bento arrangement justified only because the capabilities genuinely differ in weight.

## Spacing, radius, border

4pt scale, tighter rhythm (sections 48 to 64px). Radius 6px on tiles, 2px on inline code. The blueprint grid is a 24px repeating background at 4% opacity, with corner registration marks as the recurring motif.

## Signature element

**Corner registration marks and the blueprint grid.** Small right-angle ticks at panel corners, the way a technical drawing marks alignment, over a faint 24px grid. It signals "schematic of a system" and it is the memorable element.

## Critique against the generic default and why this one loses

The generic dark-structural page is a grid background, glowing cyan accents, and glassmorphic tiles. This plan disciplines that (flat teal, no glow, low-opacity grid), but it still carries three real problems that cost it the selection:

1. **It fights the spec's density axis.** Phase 2 chose **compressed** density for a free install with already-high motivation; a tile-dense blueprint layout adds visual weight the conversion argument does not want, and padding a short arc costs conversions.
2. **It sits closest to the dark-neon slop zone** the anti-slop list names for "bolder": cyan-on-dark with a grid is the saturated default the list says to reject first. Disciplining it is possible but it starts nearer the tell than A does.
3. **Bento cannot be the distinctive element** on its own (`references/design-direction.md`), so the weighted tiles carry less differentiation than A's running-prompt-plus-readout signature.

Recorded, per the Phase 4.5 bounce rule, as the direction to reconsider only if the winner proves wrong at the comp stage.

## Mechanics

Same `web-design-guidelines` mechanics. The blueprint grid is drawn as a `background` only and stays static under `prefers-reduced-motion`. Its contrast is a non-issue since it sits under text at 4% opacity. Tiles carry `:focus-visible` and 44px targets. The grid image is CSS, so it adds no transfer weight; budget holds.

---
Provenance: `frontend-design` invoked as the primary path; contrasts on density and cool-temperature; not selected, with the conversion-grounded reasons above and in `tokens/selection.md`.
