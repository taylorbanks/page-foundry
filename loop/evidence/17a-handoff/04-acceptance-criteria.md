# Acceptance criteria: page-foundry (skill homepage, oss-project)

Copied from the fixed template in page-foundry's `references/handoff.md`. IDs are stable and
the prefix names the owning ship gate (G3 accessibility, G4 performance, G5 design, G6 AI
discovery, G7 measurement). Slots are filled from this run's real values. Inapplicable criteria
are marked N/A with the reason on the line; nothing is reworded, renumbered, or deleted.
Run-specific criteria append under their gate with the next free number. The return log
answers every ID.

## G3 · Accessibility (WCAG 2.2 AA)
- G3.1 One h1; heading levels do not skip.
- G3.2 Landmarks present (nav, main, footer); links and buttons are real a/button elements; icon-only controls carry an aria-label.
- G3.3 Text contrast at least 4.5:1 (3:1 for large text and UI components), CTA buttons included.
- G3.4 Visible keyboard focus on every interactive element; logical tab order; focus never obscured.
- G3.5 Touch targets at least 24x24px; 44px or larger for primary actions.
- G3.6 Every informative image carries the alt text `assets/manifest.md` specifies and explicit width/height attributes; decorative images have empty alt.
- G3.7 No content conveyed by color alone; prefers-reduced-motion respected; motion animates only transform and opacity.
- G3.8 N/A: the page has no form; conversion is the install command with its copy button.
- G3.9 N/A: the page has no auth.

## G4 · Performance
- G4.1 Total transfer under 1MB; CSS plus JS under 200KB (defaults; no per-run override).
- G4.2 Images sized to the display dimensions in `assets/manifest.md`, WebP or AVIF, lazy-loaded below the fold.
- G4.3 Fonts: system stack, or at most two self-hosted files, preloaded, font-display: swap.
- G4.4 No render-blocking third-party scripts; analytics loads deferred.
- G4.5 LCP under about 2 seconds on a mid-range phone; the LCP element is the hero image or text block, not a script-injected element.

## G5 · Design
- G5.1 Fully usable at 390px width with the primary CTA above the fold; composed, not stretched, at 1440px.
- G5.2 Locked regime: only the palette, type, and radii in `03-design-direction.md` and `theme.css` appear on the page (the property has a committed theme, `docs/theme.css`).
- G5.3 Nothing on the anti-slop list in `03-design-direction.md` appears on the page.

## G6 · AI discovery and meta
- G6.1 `llms.txt` from `assets/` placed at the site root, byte-identical.
- G6.2 The JSON-LD in `assets/schema.jsonld` embedded in head, byte-identical.
- G6.3 The answer block from spec section 1 survives as one self-contained block of real text near the top of the page (the hero subhead is the block on this property's live page).
- G6.4 robots.txt does not disallow GPTBot, ChatGPT-User, PerplexityBot, ClaudeBot, anthropic-ai, Google-Extended, or Bingbot (deployment is ours, GitHub Pages).
- G6.5 Title and meta description exactly as `01-copy.md` gives them.
- G6.6 Open Graph and Twitter card meta complete; the OG image is `assets/og.jpg`, 1200x630.
- G6.7 Canonical URL set to https://taylorbanks.github.io/page-foundry/; favicon present.
- G6.8 N/A: oss-project is not a public-pricing archetype.

## G7 · Measurement
- G7.1 N/A: no measurement plan exists for this property; the live page predates the spec requirement. Open item for the owner, not a declined choice.
- G7.2 N/A: no campaign links planned for this property.
- G7.3 N/A: same status as G7.1; an analytics decision is an open item, not declined.
