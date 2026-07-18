# Design Direction

The design phase has one job: make a page that could only belong to this property. Mechanics of the design process live in the frontend-design skill when installed (token plan, critique against the generic default, one signature element, restraint everywhere else); this file adds the marketing-page-specific and property-specific layer on top, plus the craft rules absorbed from impeccable's reference set so the craft floor holds whether or not that companion is installed. Trend references are directional and dated 2026-07; re-check them against what is currently shipping if this file is more than a year old.

## One property, one theme

Each property (each product, each brand under the holding company) gets exactly one token set: 4 to 6 named palette colors, a display/body type pairing, spacing scale, a layout grid (container max-widths, column count, gutters per breakpoint), radius and border conventions, and the signature element. Persist it as `theme.css` with custom properties; that file is the durable per-property token store. Every subsequent page for that property reuses the tokens unchanged. Distinctiveness between properties, consistency within one.

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
- Any staged reconstruction of the product in use: a hand-built terminal, a mocked screenshot, or a console showing output that was not actually produced, or that shows an action the user never takes (an internal script the pipeline runs, not the user). This is a fabrication even when it looks real and the underlying command exists; it fails the integrity gate. Show a real artifact of real use (the actual page it built, a real screenshot of a real property, the output the user actually receives), or describe the thing in words. Real data in a clearly-labeled card (a real gate report) is fine; a reenactment is not.
- When the request is "bolder" or "more impact": cyan/purple gradients, glassmorphism, neon accents on dark backgrounds, gradient text on metrics, and scroll-fade-rise reveals on every section are the saturated AI defaults for impact, and they are the opposite of bold. Reject them first, then raise impact by making the committed design language more decisive: amplify hierarchy contrast, proportion, and density inside the existing tokens rather than adding effects. (impeccable: `bolder.md`)

## Craft rules

Absorbed from impeccable's craft references (pinned pbakaus/impeccable; constants spot-checked against the reference files at version 3.9.1, clone `8967edc`, on 2026-07-18) so a run without that companion designs to the same floor; each rule names its source file. The deeper machinery, the deterministic detector, scored critique, and in-browser variants, stays invocation-only per the integration notes in SKILL.md.

One tension is settled up front: impeccable's craft doctrine leans toward task-completion minimalism, few options, short paths, every element earning its pixel. Conversion pages repeat CTAs and run long by design; the compiled contract and the conversion rules set structure and length, and MECLABS scoring arbitrates them. The rules here govern execution quality inside that structure, never the structure itself; Nielsen-style usability readings (impeccable `critique`) are advisory on conversion pages.

### Space and composition

- Every spacing value comes from a 4pt base scale (4, 8, 12, 16, 24, 32, 48, 64, 96px), and rhythm comes from contrast: 8 to 12px between related siblings, 48 to 96px between sections. Monotone equal spacing is itself a defect; it encodes no hierarchy. (impeccable: `layout.md`)
- One focal point per section. Pick the one thing the visitor should remember there and make everything else support it; if every element is louder, the composition is flatter, not bolder. (impeccable: `bolder.md`)
- The squint test: with the page blurred, the primary element, the secondary, and the groupings must still be identifiable within 2 seconds. Apply it to the hero first, then section by section on the built page. (impeccable: `layout.md`)

### Type

- Five sizes cover the whole page, spaced on one committed ratio (1.25, 1.333, or 1.5); sibling sizes such as 14/15/16px read as muddy hierarchy, and the cure is fewer sizes with more contrast between them. Fluid `clamp()` belongs to headings and display text only, body stays fixed at 16px or larger, the clamp maximum stays at or under 2.5 times its minimum, and the measure holds 45 to 75ch at every viewport. (impeccable: `typeset.md`)

### Color

- Commit to a color strategy per property before styling anything: Restrained, Committed, Full palette, or Drenched. Dosage reads the 60-30-10 rule as visual weight, not pixel count, and accents work because they are rare; the chosen strategy, not habit, decides how far past a restrained dosage the page goes. (impeccable: `colorize.md`)
- Brand-tinted neutrals: pure gray reads dead next to a colored brand, and the stock warm-cream tint (`oklch(97% 0.01 60)` and its neighbors) has become an AI tell in its own right. Neutrals carry 0.005 to 0.015 OKLCH chroma hued toward this property's brand color, and color scales are generated in OKLCH, holding hue steady while lightness varies and chroma eases near white and black. (impeccable: `colorize.md`)
- Three micro-bans, absolute: no gray text on colored backgrounds (use a darker shade of the background color, or transparency); no colored `border-left` or `border-right` accent stripe wider than 1px (a hairline full border, a 4 to 8% background tint, or a leading glyph does the same job); no bounce or elastic easing anywhere. (impeccable: `colorize.md`, `polish.md`)

### Motion

- Durations by job: 100 to 150ms for feedback, 200 to 300ms for state changes, 300 to 500ms for layout changes, 500 to 800ms for entrances only, with exits at roughly 75% of the matching enter; sibling stagger is legitimate for real lists, capped near 500ms total (10 items at 50ms each). At most one earned scroll-triggered moment per page, chosen because it serves the message; fade-and-rise on every scrolled section is a tell, not a choreography. (impeccable: `animate.md`)

### Brief discipline

Two commitments that cost one short paragraph in the Phase 4 design direction and pay for themselves in every shape pick that follows.

- A scene sentence plus named anchors. The scene sentence is one sentence of physical context for the page: who is reading it, where, under what ambient light, in what mood. It forces the dark-versus-light call; if it does not, it needs more detail. Alongside it, 2 or 3 named anchor references: specific products, brands, objects, never adjectives like "modern" or "clean". (impeccable: `shape.md`)
- Identity lock for existing properties: before restyling anything the property already ships, write one factual sentence of its current identity, actual hex values, actual font names, layout topology, copy tone, no aesthetic adjectives. Every candidate must read as the same brand next to the live page; departure is legitimate only when the brief asks for it. The persistent `theme.css` is this sentence in token form, so iterations start from it. (impeccable: `live.md`)

## The grid and the breakpoints

The spacing scale governs vertical rhythm; horizontal structure needs its own commitment, and a page built without one reads placed rather than arranged. Two artifacts close that gap. Both belong to the token plan, and Gate 5 verifies the built page against both.

- **A layout grid spec.** Container max-widths, column count, and gutter width, stated per breakpoint, with gutters drawn from the 4pt scale. Every candidate token plan carries one; plans may legitimately differ on grid, since the density axis often forces it, but a plan that states palette and type while leaving the grid to the build is incomplete. The winning grid persists in `theme.css` as custom properties beside the palette (`--container-max`, `--grid-cols`, `--gutter`), so every later page on the property composes on the same grid, and it is the substance of the `## Layout` section when `DESIGN.md` is persisted.
- **Per-breakpoint recomposition notes for the hero and the densest section.** Breakpoints are content-driven, set where the design breaks; these notes are where each named breakpoint gets designed rather than merely survived. For the hero and for the page's densest section (the spec's job order plus the shape picks identify it), write one note per named breakpoint stating how the composition re-forms there: what re-stacks and in what order, which elements drop or collapse, how the hero visual crops, where the primary CTA lands. The notes are written after the shape picks, because density follows shape, and they land in the winning token plan file in `tokens/`.

"Fully usable at 390px" is a floor. A recomposition note is a design decision, and the render gate checks that the decision was executed at the breakpoint it names, screenshotting that width when it falls between the standard pair. In handoff mode the external tool owns the grid within the manifest geometry (`references/handoff.md` grants it), so the spec and notes above apply to what this skill builds itself.

## Marketing-page specifics

When web-design-guidelines is installed it is authoritative on the accessibility, typography, imagery, and interaction mechanics below; the items here are the marketing-page emphasis. When it is absent, these condensed mechanics apply.

- The hero visual shows the product doing its job: actual UI, actual output, actual artifact. If the product is a service or community, show the real artifact of the work (a redacted report page, a session board, a member thread) rather than a metaphor.
- Image-led pages get real or sourced imagery, never decorative CSS panels, emoji, or fabricated metrics standing in where an image belongs. Verify every image URL before referencing it, since a guessed photo id ships as a broken image; fewer images held with confidence beat many guessed. (impeccable: `craft.md`)
- Design the 390px view first. Hero type must wrap gracefully (use `text-wrap: balance` on the headline to kill widows); the CTA must sit above the fold on a phone; respect `env(safe-area-inset-*)` so nothing hides under a notch, and set `touch-action: manipulation` on tap targets.
- Every interactive element has a visible focus state and a hover state: `:focus-visible` with a real ring, 2 to 3px, offset outside the element, at 3:1 contrast against what surrounds it, and never `outline: none` without a replacement. Nothing on the page is hover-only, since keyboard and touch users never see hover; tap targets reach 44px, with padding or a pseudo-element when the visual must stay smaller; interactive states increase contrast and never rely on color alone. (impeccable: `interaction-design.md`)
- Images carry explicit `width`/`height` or `aspect-ratio` to hold layout (CLS), lazy-load below the fold and never above it, and set `fetchpriority="high"` on the hero image (LCP, under 2.5s). Web fonts load with `font-display: swap` and a metric-matched fallback (`size-adjust`/`ascent-override`), preloading only the critical weight. Breakpoints are content-driven, set where the design breaks rather than at device widths, and adaptation reads the `pointer` and `hover` media queries instead of inferring input from screen size. This ties straight to the performance budget below. (impeccable: `optimize.md`, `typeset.md`, `adapt.md`)
- Copy blocks survive real content: test the headline and CTA labels at their long and short extremes, set `min-width: 0` on flex and grid children that hold text, never give a text container a fixed width, and keep 30 to 40% expansion headroom so a longer product name or a translation does not shear the layout. (impeccable: `harden.md`)
- Respect `prefers-reduced-motion` with a static fallback. Animate only `transform` and `opacity`, never `transition: all`; keep animations interruptible and set an explicit `transform-origin`.
- Contrast meets WCAG 2.2 AA (4.5:1 body, 3:1 large text and UI components) inside the chosen palette from the start, not patched after. Set `color-scheme` and a `theme-color` meta when the property has a dark identity.
- Performance is a design constraint: the direction must be achievable in roughly under 200KB of CSS+JS and under 1MB total transfer for the page. If the vision needs more, change the vision.

---

_Provenance: reconciled 2026-07-07 against frontend-design (Anthropic), web-design-guidelines (vercel-labs, live ruleset), and theme-factory (Anthropic). Craft rules absorbed 2026-07-18 from impeccable (pbakaus/impeccable) at version 3.9.1, clone `8967edc`; every stamped constant was spot-checked against its named reference file at that version before copying. web-design-guidelines is authoritative on the a11y/typography/imagery/interaction mechanics when installed; the condensed mechanics here are the fallback. Re-reconcile when those companions change._
