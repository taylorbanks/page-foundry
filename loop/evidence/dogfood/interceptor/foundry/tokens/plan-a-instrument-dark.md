# tokens/plan-a-instrument-dark.md: Interceptor (Phase 4 candidate, WINNER)

Candidate token plan A, produced by invoking the `frontend-design` skill (core companion, present) as the primary path, with `web-design-guidelines` (present) authoritative on the accessibility, typography, imagery, and interaction mechanics and `references/design-direction.md` supplying the marketing-page and anti-slop layer. This is the recommended direction; the selection reasoning against B and C is in `tokens/selection.md`.

## Direction in one line

A dark instrument panel for a command-line tool: monospace-led, quiet, with a single warm signal accent that appears only on the primary action and the live status readout. The page reads like the tool's own output, not like a marketing site dressed as one.

## Scene sentence and named anchors

Required by `references/design-direction.md` (brief discipline) and read again at the Phase 4.5 comp critique.

- **Scene sentence.** An engineer reads this at night on a second monitor, terminal already open on the first, deciding in two minutes whether this tool is worth loading the extension before their agent run breaks again.
- **Named anchors** (real products, not adjectives): the GitHub repository page in dark mode, the Fly.io docs of 2024 (dark, monospace-forward, dense but calm), and the `ripgrep` or `fd` README as rendered on GitHub. The page should sit beside these without looking louder than any of them.

## Palette

Named hex values. Neutrals are tinted toward the brand slate hue (cool, roughly OKLCH hue 250) at 0.005 to 0.015 chroma, per the brand-tinted-neutral rule; pure gray is not used. Two accents only, each with a stated job.

| Token | Hex | Job |
|---|---|---|
| `--ink` | `#0D1017` | Page ground. Cool near-black, slate-tinted. |
| `--surface` | `#151A22` | Raised panels: the hero readout, the code block frame. |
| `--surface-2` | `#1C222C` | Nested surfaces: an output pane inside the code block. |
| `--line` | `#2A3240` | Hairline borders, 1px. The only structural stroke. |
| `--text` | `#E6EAF0` | Primary text. Contrast 14.8:1 on `--ink` (AA and AAA). |
| `--text-dim` | `#9BA6B4` | Secondary text and captions. Contrast 6.9:1 on `--ink`, slate-tinted rather than pure gray. |
| `--signal` | `#F2A63C` | The one warm accent: primary CTA fill, the command prompt marker, the socket-limitation callout rule. Sodium-amber, an instrument-readout color, not a neon. |
| `--signal-ink` | `#0D1017` | Text on a `--signal` fill. Dark on amber, contrast 9.1:1. |
| `--status-ok` | `#74B49B` | Status glyphs only, in the stealth-check readout (a calm sea-green, deliberately not acid). Never used for CTAs or links. |

Color strategy is **Restrained** (`colorize.md` dosage): the page is neutral almost everywhere, and the amber is rare enough that it reads as a signal. The one place the warm accent is allowed to carry weight is the single limitation callout, where the pratfall lever from `persuasion-map.md` wants the reader's eye on the honest admission.

Micro-bans honored: no gray text on colored backgrounds (`--text-dim` sits on `--ink`/`--surface`, both near-neutral, and is slate-tinted); no accent border stripe wider than 1px (the amber appears as a leading glyph and full-fill button, never a fat left rule); no bounce or elastic easing.

## Type

- **Display and headings: IBM Plex Mono**, weights 600 and 700. Reasoned, not costume: the product is a single CLI, so a monospace headline is the tool speaking in its own type, and Plex Mono is a designed, characterful face rather than a system default. This is a full commitment to the terminal identity per the design-direction "commit fully or not at all" rule.
- **Body: IBM Plex Sans**, weights 400 and 500. A humanist sans drawn to pair with Plex Mono; it is not Inter and the pairing has a stated reason (same type family lineage, so the mono headings and sans body share proportions).
- **Code and command output: IBM Plex Mono**, weight 400.
- **Loading.** Two self-hosted files at most (Plex Mono 400/600, Plex Sans 400/500 subset), `font-display: swap`, a metric-matched fallback set with `size-adjust` so the swap does not shift layout, and only the critical weight preloaded. Fallback stacks: `"IBM Plex Mono", ui-monospace, "SF Mono", Menlo, monospace` and `"IBM Plex Sans", system-ui, -apple-system, sans-serif`.

**Five sizes, one ratio (1.333).** Body fixed at 16px; `clamp()` on the two display sizes only, maximum under 2.5x the minimum; measure held to 45 to 75ch at every viewport.

| Token | Size | Use |
|---|---|---|
| `--fs-body` | 16px | Body, list items, output text. |
| `--fs-lead` | 20px | Section-opening sentence, the answer block. |
| `--fs-h3` | 27px | Section headings. |
| `--fs-h2` | 36px | (reserved; the compressed page uses it rarely) |
| `--fs-h1` | `clamp(36px, 6vw, 48px)` | The hero statement only. |

## Layout grid

Container widths chosen for a text-and-code page, not a wide marketing canvas: reading comfort over spread. Gutters come from the 4pt scale. Every candidate carries a grid; this one is deliberately narrow to keep the code blocks and prose within a 45 to 75ch measure.

| Breakpoint | Container max | Columns | Gutter | Side padding |
|---|---|---|---|---|
| Mobile (up to 640px) | fluid, 100% | 1 | n/a | 16px |
| Tablet (641 to 1024px) | 720px | 6 | 24px | 24px |
| Desktop (1025px and up) | 960px | 12 | 32px | 32px |

The prose and code measure never uses the full 12 desktop columns: text sits in a centered 8-of-12 band (about 640px) so the line length stays readable, while the hero readout and the mechanism before-and-after may span the full 960px. Persisted as `--container-max: 960px`, `--grid-cols: 12`, `--gutter: 32px` in `theme.css`.

## Spacing, radius, border

- **Spacing** from the 4pt scale only: 4, 8, 12, 16, 24, 32, 48, 64, 96px. Related siblings 8 to 12px apart; sections 64 to 96px apart on desktop, 48px on mobile. Equal monotone spacing is treated as a defect.
- **Radius**, deliberately varied rather than uniform: panels and inputs 4px, the code block 6px, the status pills fully rounded (999px) as the one intentional shape contrast. A single radius on everything is on the anti-slop list.
- **Border**: 1px `--line` hairlines only. No shadows on a dark instrument surface; depth comes from the `--surface` to `--surface-2` step, not from drop shadows (identical card shadows everywhere is a tell).

## Signature element

**The amber command prompt as a running mark.** A single `›` glyph in `--signal` precedes every section kicker and sits inside the hero install block, so the whole page reads as a sequence of prompts the reader could type. It is one character, it carries the brand color at the page's rare-accent dosage, and it ties the marketing page to the tool's actual interface. Paired with it, the hero carries a **live status readout**: the four stealth-check results (`BrowserScan: Normal`, `Pixelscan: Definitely Human`, `CreepJS: 0% headless`, `Fingerprint.com: notDetected`) rendered as a compact monospace readout grid with `--status-ok` glyphs, labeled vendor-stated with the independent-reproduction `[TK]` shown in place. This is real data in a clearly-labeled card, which the integrity rule and `references/design-direction.md` both allow; it is not a staged terminal of a command the user never runs.

## Critique against the generic default

The generic AI answer for a dev-tool page is a dark hero with a purple-to-blue gradient, a big centered headline in Inter, a stat row (stars, downloads) in gradient text, and a three-column feature grid of line icons below. This plan rejects each: no gradient anywhere (flat `--ink`), no Inter (Plex Mono display with a stated CLI reason), no stat row (the stars and downloads are `[TK]`, so leading on them would be fabrication, and the real proof is the status readout and the quickstart), and no icon-card grid (capabilities are named in prose and in the quickstart, where they are checkable). The risk this plan carries is costume-brutalism: a monospace headline can read as a pose. The mitigation is that everything mono here has a functional reason (the tool is a CLI, the readouts are real output shapes), and the body is a proper humanist sans rather than more monospace, so the page is legible, not a terminal cosplay.

## Mechanics (web-design-guidelines authoritative, present this run)

`web-design-guidelines` governs the mechanics below; they are encoded in `theme.css` and checked at Gates 3 and 5.

- Contrast meets WCAG 2.2 AA inside the palette from the start: `--text` 14.8:1, `--text-dim` 6.9:1, `--signal-ink` on `--signal` 9.1:1, `--status-ok` on `--surface` 5.2:1. The amber CTA uses `--signal-ink` text, never `--text-dim`.
- Every interactive element carries a visible `:focus-visible` ring, 2px offset outside the element in `--signal` at 3:1 against its surround, and a hover state that raises contrast rather than only shifting hue. Nothing is hover-only. Tap targets reach 44px; the copy-command button pads to 44px even though its glyph is smaller.
- Motion respects `prefers-reduced-motion` with a static fallback. Only `transform` and `opacity` animate, never `transition: all`. The single earned motion moment is a 500ms staggered reveal of the hero readout rows on load (10 rows cap, 50ms stagger, under 500ms total); no scroll-triggered fade-and-rise on other sections.
- Images and media carry explicit `width`/`height` or `aspect-ratio` to hold CLS; the hero readout is text, so LCP is text paint, well under 2.5s. Fonts load with `swap` and `size-adjust`.
- Copy blocks survive long content: `min-width: 0` on the flex and grid children holding text, no fixed text-container widths, `text-wrap: balance` on the hero headline to kill widows, and 30 to 40% expansion headroom on the CTA label and the section kickers.
- Performance budget: this direction ships in well under 200KB of CSS and JS (no framework, two font files, one small copy-button script) and under 1MB total, since it carries no hero image, only text and real command output captured at build.

## Per-breakpoint recomposition notes

Written after the shape confirmations (`tokens/selection.md`), because density follows shape. Breakpoints are content-driven. Gate 5 checks that the decision named here was executed at the width it names.

### Hero (S1), the highest-priority composition

- **Mobile (390px, the floor).** Single column. Order top to bottom: the `›` kicker, the H1 statement (`text-wrap: balance`, wrapping to three lines at this width without a widow), the one-sentence subhead, the install-command block full-width with the copy button reaching 44px and sitting inside the block on the right, then the status readout as a single stacked column of four labeled rows. The primary CTA here is the install block itself, and it sits above the fold on a phone; the `Docs / GitHub / Community` links drop to a wrapped row below the readout. `env(safe-area-inset-*)` respected so nothing hides under a notch.
- **Content breakpoint (about 720px, where the readout stops fitting one column comfortably).** The status readout re-forms from one column into a two-by-two grid; the install block stays full-measure; the headline holds two lines. This width is screenshotted at the comp stage because the readout recomposition happens here rather than at a device edge.
- **Desktop (1025px and up, 960px container).** The hero uses the full container width, not the narrow text band: the H1 and subhead sit left in an 7-of-12 band, the status readout sits right in a 5-of-12 panel on `--surface` with a hairline border, and the install-command block spans full width beneath both. The `›`-marked kicker sits above the H1. The install block is the visual and functional focal point; the readout is the in-viewport proof beside it, satisfying the proof-adjacency constraint.

### Quickstart (S4), the densest section

Densest because it carries an annotated command, its real captured output, and the short "more than stealth" capability list, all in one block. Identified from the job order plus the confirmed shapes.

- **Mobile (390px).** Fully single column. The annotated command sits in a `--surface` code block with horizontal scroll contained (`overflow-x: auto`, the block never forces the page wider than 390px, the lesson-27 window-floor trap avoided by testing the real emulated width). The real output renders in a nested `--surface-2` pane directly below, not side by side. The capability list ("passive network capture, record-and-replay, scene graph, optional macOS bridge") stacks as a plain list, one item per line, no icons.
- **Content breakpoint (about 720px).** The command and its output stay stacked (they read top-to-bottom as input-then-result, which the side-by-side would break), but the capability list re-forms into a two-column list to shorten the section's vertical run at the compressed density.
- **Desktop (1025px and up).** The code block and output pane hold to the centered 8-of-12 reading band (about 640px) so the monospace measure stays readable rather than stretching to 960px; only the section kicker and the capability list may use the wider band. The output pane keeps its own `--surface-2` frame so the reader can tell captured output from the command that produced it.

---
Provenance: `frontend-design` skill invoked as the primary path for the token plan; `web-design-guidelines` authoritative on the mechanics; `references/design-direction.md` for the anti-slop, craft, grid, and brief-discipline layers. Palette contrast ratios computed against the named hex values. Every stealth-check value shown in the signature readout is vendor-stated per `product-marketing.md` and carried with its `[TK]` reproduction note, never as an independent result.
