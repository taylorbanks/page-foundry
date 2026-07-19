# tokens/plan-b-technical-light.md: Interceptor (Phase 4 candidate)

Candidate token plan B, from the same `frontend-design` invocation as A and C. It contrasts with A on two real axes: **temperature** (a light ground against A's dark) and **type contrast** (a serif display against A's monospace). It is the strong fallback if the owner wants the page to read as calm documentation rather than as the tool's own instrument surface.

## Direction in one line

Ink on light paper: a technical-documentation aesthetic for a reader who opens the source before they trust a claim, with proof sources hung in the margin like footnotes.

## Scene sentence and named anchors

- **Scene sentence.** A staff engineer reads this in daylight with the repository open in another tab, treating the page the way they treat a good README: skeptically, top to bottom, checking each claim against the linked source.
- **Named anchors:** the Stripe API reference (light, dense, calm), the `esbuild` documentation site, and a well-set academic paper page on arXiv's HTML view. Editorial credibility, not marketing gloss.

## Palette

Light neutrals, hued cool toward the brand slate rather than the warm-cream tell (`oklch(97% 0.01 60)` and its neighbors are explicitly avoided; these neutrals sit cool, hue toward 250, so they do not read as the AI cream default).

| Token | Hex | Job |
|---|---|---|
| `--paper` | `#F4F5F7` | Page ground. Cool light gray, not cream. |
| `--paper-2` | `#EBEDF1` | Raised panels and the code block frame. |
| `--ink` | `#14181F` | Primary text. Contrast 15.1:1 on `--paper`. |
| `--text-dim` | `#586172` | Secondary text and margin sources. Contrast 6.4:1 on `--paper`, slate-tinted. |
| `--line` | `#D3D8E0` | Hairline rules and table borders. |
| `--accent` | `#1F5F63` | Links and the section marks. A deep instrument teal, calm on light paper. |
| `--cta` | `#14181F` | Primary CTA: a solid ink fill with `--paper` text, contrast 15.1:1. The install command is the CTA; the button is ink, not colored. |

Color strategy is **Committed** on the neutrals with the teal as the single rare accent. The warm-signal role A gave amber is here carried by the ink CTA plus the margin-source teal; there is no second bright color.

## Type

- **Display and headings: Fraunces**, an old-style serif with optical sizes, weights 500 and 600. It gives the page editorial authority a sans cannot, and it is distinctive rather than a default. Reasoned for the "read it like a paper" scene.
- **Body: IBM Plex Sans**, 400 and 500, for a clean readable measure that does not fight the serif headings.
- **Code and output: IBM Plex Mono**, 400, since the page is full of real commands and the mono has to carry them faithfully.
- Loading: two self-hosted files (Fraunces display subset, Plex Sans body), `font-display: swap`, `size-adjust` fallbacks, Plex Mono from a system-mono fallback stack to stay under the two-file budget where possible.

Five sizes on a 1.5 ratio (a larger ratio suits the airier light layout): body 16px fixed, `--fs-lead` 20px, `--fs-h3` 24px, `--fs-h2` 32px, `--fs-h1` `clamp(34px, 5vw, 48px)`. Measure 45 to 75ch.

## Layout grid

Airier than A, with a hanging margin column for sources on desktop.

| Breakpoint | Container max | Columns | Gutter | Side padding |
|---|---|---|---|---|
| Mobile (up to 640px) | fluid, 100% | 1 | n/a | 20px |
| Tablet (641 to 1024px) | 760px | 6 | 28px | 28px |
| Desktop (1025px and up) | 1040px | 12 | 40px | 40px |

On desktop the main column holds 8 of 12; the rightmost 3 columns are the source margin where the vendor-stated notes and `[TK]` reproduction flags hang beside the claims they qualify. Below the desktop breakpoint the margin collapses inline beneath each claim.

## Spacing, radius, border

4pt scale, more generous than A (sections 96px on desktop, 56px mobile) to earn the "airy" read. Radius 4px on panels, 2px on inline code, no radius on the hanging rules. Borders 1px `--line`; one deliberate accent is a 1px teal underline on links that thickens to 2px on hover, never a color-only state.

## Signature element

**The source margin.** Every proof-bearing claim carries a small superscript reference that resolves to a hanging note in the right margin: the source file, the vendor-stated flag, or the `[TK]` reproduction status. It makes the page's honesty structural rather than promised, which is the pratfall lever expressed as layout, and it is the thing a reader remembers because no marketing page usually shows its own sources this plainly.

## Critique against the generic default

The generic light dev-tool page is a white hero, an Inter headline, a purple CTA, and a bento grid of features with pastel tile backgrounds. This plan rejects the white (cool paper, not white or cream), the Inter (Fraunces display with a stated editorial reason), the purple (a single teal, plus an ink CTA), and the bento (a linear document with a source margin, since the reader is reading, not scanning tiles). The risk is that a serif on a light ground reads as generic-editorial or as a blog; the mitigation is the source margin and the dense real-command blocks, which no blog carries, and the ink CTA that keeps the primary action unmistakable.

## Mechanics

Same `web-design-guidelines` mechanics as A (AA contrast verified above, `:focus-visible` rings in `--accent`, 44px targets, `swap` fonts, `aspect-ratio` on media, `prefers-reduced-motion`). On light paper the focus ring uses `--accent` at 3:1 against `--paper`. Performance budget holds: no hero image, two font files, one copy-button script.

---
Provenance: `frontend-design` invoked as the primary path; contrasts with A on temperature and type contrast; `references/design-direction.md` anti-slop and craft layers applied; neutrals hued cool to avoid the warm-cream AI tell. Not selected; see `tokens/selection.md`.
