# Design Direction

The design phase has one job: make a page that could only belong to this property. Mechanics of the design process live in the frontend-design skill when installed (token plan, critique against the generic default, one signature element, restraint everywhere else); this file adds the marketing-page-specific and property-specific layer on top. Trend references are directional and dated 2026-07; re-check the design landscape if this file is more than a year old.

## One property, one theme

Each property (each product, each brand under the holding company) gets exactly one token set: 4 to 6 named palette colors, a display/body type pairing, spacing scale, radius and border conventions, and the signature element. Persist it as `theme.css` with custom properties; use theme-factory when installed to generate or apply a cohesive palette and type pairing, but `theme.css` is the durable per-property token store (theme-factory is a theming toolkit for artifacts, not a persistence layer). Every subsequent page for that property reuses the tokens unchanged. Distinctiveness between properties, consistency within one.

## Choosing a direction

Derive the direction from the subject and the audience, not from a trend list. Current directions that are working, and where each fits:

- **Modern minimalism, performance-aware.** Generous space, disciplined type scale, restrained motion. The default for consulting, advisory, and coaching properties where the brand is judgment and experience. Minimalism done as precision, not emptiness.
- **Bento grids for feature storytelling.** Modular tiles of varying weight; now standard on SaaS feature sections (a large majority of top SaaS sites use a variant). Use when capabilities genuinely differ in importance; the grid encodes hierarchy. Do not use for linear workflows or long-form sales pages. Bento is also now common enough that it cannot be the distinctive element on its own.
- **Brutalist / terminal aesthetic.** Monospace, raw layout, visible structure, minimal color. A live counter-trend to polished bento, common among indie and developer-facing launches, and it reads as honest to a practitioner audience. Natural fit for OSS and security tooling pages. The risk is costume-brutalism; commit fully or not at all.
- **Dark mode as identity.** Works for security and developer tools; pair with one disciplined accent. If the property's product UI is dark, the marketing page matching it builds continuity.
- **Glassmorphism, kinetic type, scroll-driven animation.** Moments, not systems. One scroll-triggered reveal that serves the message outranks ambient motion everywhere. Heavy 3D and WebGL routinely blow the performance budget; treat as out of bounds unless the user insists and accepts the cost.

## Anti-slop list

Reject these defaults regardless of direction (this extends the frontend-design skill's list with marketing-page specifics):

- Purple-to-blue gradient on anything.
- The big-stat-number + small-label + gradient-accent hero (the frontend-design template answer); use it only when the metric genuinely is the claim.
- Inter (or any default sans) as the display face with no stated reason.
- Three-column icon-card feature grids with line icons and centered text.
- The cream background + serif display + terracotta accent combo, the near-black + acid green (or vermilion) combo, and the hairline-rule broadsheet look, when chosen by default rather than for cause.
- Uniform border radius on every element; identical card shadows everywhere.
- Abstract blob illustrations, isometric people, stock photos of meetings.
- Emoji as section markers.
- AI-generated hero imagery that depicts nothing real about the product. Real screenshots, real terminal output, real diagrams, real photography only.

## Marketing-page specifics

When web-design-guidelines is installed it is authoritative on the accessibility, typography, imagery, and interaction mechanics below; the items here are the marketing-page emphasis. When it is absent, these condensed mechanics apply.

- The hero visual shows the product doing its job: actual UI, actual output, actual artifact. If the product is a service or community, show the real artifact of the work (a redacted report page, a session board, a member thread) rather than a metaphor.
- Design the 390px view first. Hero type must wrap gracefully (use `text-wrap: balance` on the headline to kill widows); the CTA must sit above the fold on a phone; respect `env(safe-area-inset-*)` so nothing hides under a notch, and set `touch-action: manipulation` on tap targets.
- Every interactive element has a visible focus state (`:focus-visible` with a real ring, never `outline: none` without a replacement) and a hover state; interactive states increase contrast and never rely on color alone.
- Images carry explicit `width`/`height` to hold layout (CLS), lazy-load below the fold, and set `fetchpriority="high"` on the hero image (LCP). This ties straight to the performance budget below.
- Respect `prefers-reduced-motion` with a static fallback. Animate only `transform` and `opacity`, never `transition: all`; keep animations interruptible and set an explicit `transform-origin`.
- Contrast meets WCAG 2.2 AA (4.5:1 body, 3:1 large text and UI components) inside the chosen palette from the start, not patched after. Set `color-scheme` and a `theme-color` meta when the property has a dark identity.
- Performance is a design constraint: the direction must be achievable in roughly under 200KB of CSS+JS and under 1MB total transfer for the page. If the vision needs more, change the vision.

---

_Provenance: reconciled 2026-07-07 against frontend-design (Anthropic), web-design-guidelines (vercel-labs, live ruleset), and theme-factory (Anthropic). web-design-guidelines is authoritative on the a11y/typography/imagery/interaction mechanics when installed; the condensed mechanics here are the fallback. Re-reconcile when those companions change._
