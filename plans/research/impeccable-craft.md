All 18 files read in full. Report follows.

## 1. Per-file: job and most valuable concrete lessons

**craft.md** — The end-to-end build flow (shape → references → visual direction → build → iterate → present).
- Multiple hard user gates before code; "shape confirmation alone is NOT a green light to start coding" — compressing gates is named as the dominant failure mode.
- An approved visual direction is a *contract*: if the live result lacks the mock's major ingredients (hero silhouette, motifs, imagery, nav/CTA treatment), the implementation is wrong — a blocking defect, not a nuance.
- Image-led briefs (restaurants, food, travel, fashion, product) need real or sourced imagery, never "generic cards, bullets, emoji, fake metrics, decorative CSS panels" as substitutes.
- Verify image URLs before referencing them; guessed photo IDs ship as broken images. Fewer confident images beat many guessed ones.
- A screenshot you didn't read back into context doesn't count; inspect long pages section by section because thumbnails hide spacing/clipping defects. "Don't invent defects to demonstrate iteration."

**critique.md** — Dual-assessment design critique: an LLM design-director review isolated from a deterministic detector scan, synthesized into a scored report.
- Isolation principle: deterministic scan output must not enter the reviewer's context before judgment forms, because "detector output anchors judgment." A clean scan is a floor, not a verdict.
- Nielsen's 10 heuristics scored 0–4 with honest bands (most real interfaces score 20–32/40); P0–P3 severity with the tiebreaker "would a user contact support about this? Then it's at least P1."
- Working-memory rule (Cowan): ≤4 items per decision point; nav ≤5 top-level items; pricing tiers ≤3; 1 primary + 1–2 secondary actions.
- Persona walkthroughs (power user, first-timer, screen-reader user, stress tester, distracted mobile) selected by interface type — landing pages get Jordan/Riley/Casey (first impressions, edge cases, mobile).
- Report findings as "what / why it matters to users / concrete fix"; never "consider exploring…".

**polish.md** — Final-detail pass after functional completeness.
- Design-system discovery first; classify every drift as missing token / one-off implementation / conceptual misalignment — the fix differs per category, and fixing the symptom without naming the cause compounds drift.
- Never gray text on colored backgrounds; use a shade of that color or transparency.
- Every interactive element needs all eight states; missing states are broken experiences.
- Easing: ease-out-quart/quint/expo; never bounce or elastic ("feel dated").
- If spacing is off everywhere, fix the system, not one screen; never perfect one corner while leaving another rough.

**layout.md** — Space as the primary design material; fix structure, not surface.
- Prefer 4pt base scale (4/8/12/16/24/32/48/64/96) over 8pt — 8pt is too coarse, you'll constantly need 12px.
- Rhythm through contrast: 8–12px between related siblings, 48–96px between sections; monotone equal spacing = no hierarchy.
- Squint test: blurred, you must still identify primary, secondary, groupings within 2 seconds.
- Card-grid monotony is a named tell: don't wrap everything in cards, never nest cards, vary spans/sizes, never default to the "hero metric layout (big number, small label, stats, gradient)."
- Hierarchy table: strong = 3:1+ size ratio, Bold-vs-Regular weight, high contrast, whitespace isolation; combine 2–3 dimensions. Optical alignment: nudge geometrically-centered icons; 44×44px touch targets via pseudo-element hit-area expansion.

**typeset.md** — Type carries the information; kill invisible defaults.
- Fewer sizes, more contrast: 5-size ramp with a committed ratio (1.25/1.333/1.5); 14/15/16px sibling sizes = muddy hierarchy.
- Fluid `clamp()` for marketing headings only; body stays fixed; bound clamp so max ≤ ~2.5× min; keep measure 45–75ch at every viewport.
- Light-on-dark compensation on three axes: +0.05–0.1 line-height, +0.01–0.02em letter-spacing, optionally step weight up.
- Anti-reflex list: tech briefs don't need serif "for warmth"; premium doesn't need the trendy serif everyone uses; "modern" doesn't need geometric sans; often you need only one family in multiple weights.
- Loading: `font-display: swap` + metric-matched fallbacks (size-adjust/ascent-override); preload only the critical weight; ALL-CAPS labels need 0.05–0.12em tracking; rem never px; never disable zoom.

**colorize.md** — Strategic palette: strategy first (Restrained/Committed/Full/Drenched), then hue, then dosage.
- Use OKLCH; hold hue+chroma, vary lightness for scales, reducing chroma near white/black. Don't reach for blue-250 or warm-orange-60 by reflex — those are "the dominant AI-design defaults."
- Tinted neutrals: pure gray is dead — 0.005–0.015 chroma hued toward *this brand's* color, not a stock warm/cool formula; the generic warm cream tint (`oklch(97% 0.01 60)`) is itself now an AI tell.
- 60-30-10 is about visual weight, not pixels; accents work *because* they're rare.
- Dark mode is not inverted light mode: depth from a 3-step surface lightness scale (~15/20/25%) in the brand hue, desaturated accents, body weight down (~350), brand-tinted near-black instead of automatic pure black.
- Absolute ban: colored `border-left/right` accent stripes >1px; use hairline full border, 4–8% background tint, or leading glyph. Heavy alpha is a design smell (incomplete palette). Named dangerous combos: light gray on white, red-on-green, thin light text on images.

**delight.md** — Where personality earns its place.
- Delight amplifies, never blocks: <1 second, skippable, at moments (completion, first-run, error recovery, milestones), not everywhere.
- Cliched loading copy ("Herding pixels", "Teaching robots to dance") is named AI slop; write messages specific to what the product actually does.
- Match register: banks can be warm but not wacky.
- Still fresh at the 100th use; vary responses; performance and reduced-motion are non-negotiable.

**bolder.md** — Bold ≠ effects; bold = decisive.
- The reject-first list: cyan/purple gradients, glassmorphism, neon-on-dark, gradient text on metrics are "the opposite of bold."
- Pick ONE focal point the viewer should remember; make everything else support it. "If every element is louder, the composition is not bolder; it is flatter."
- Design-system lock: amplify within the existing tokens/language; expansions require explicit approval with named additions and reasons.
- "Bolder != scroll-fade-rise on every section. That's the saturated AI default."
- The final test: "if you said 'AI made this bolder,' would they believe you immediately? If yes, you've failed."

**quieter.md** — Reduce intensity without going generic; subtlety needs precision.
- Desaturate to 70–85%, not grayscale; the point of view must survive the cuts.
- Reduce weights one notch (900→600, 700→500); shorten motion distances (10–20px not 40px); tinted grays not pure.
- Hierarchy still matters — some anchors must stay; quiet-without-intent collapses to generic.

**animate.md** — Motion conveys state; decoration is a cost.
- The 100/300/500 duration rule: 100–150ms feedback, 200–300ms state changes, 300–500ms layout, 500–800ms entrances only; exits at ~75% of enter; never >500ms for feedback.
- Named easing tokens (ease-out-quart `cubic-bezier(0.25,1,0.5,1)` etc.); bounce/elastic banned.
- Fade-and-rise on every scrolled section is "a tell, not a choreography." Sibling stagger is legitimate (cap ~500ms total: 10×50ms); whole-section fade-on-scroll is not a list.
- Motion materials beyond transform/opacity are allowed (blur, clip-path, masks, shadows) if bounded and verified smooth; the real rule is never casually animate layout properties.
- Perceived performance: <80ms feels instant; optimistic UI for low-stakes actions; reduced-motion always.

**interaction-design.md** — Interactive-state and modern-API reference.
- Eight states per element; the common miss is designing hover without focus — keyboard users never see hover.
- Focus rings done right: `:focus-visible`, 2–3px, offset outside, 3:1 contrast; never `outline:none` without replacement.
- Placeholders aren't labels; validate on blur; errors below fields with `aria-describedby`.
- Dropdown clipping (absolute inside overflow-hidden) is "the single most common dropdown bug in generated code" — popover/top-layer, anchor positioning, or portal.
- Undo beats confirm for destructive actions; skip links; 44px targets.

**shape.md** — Pre-code design brief via discovery interview.
- Force three visual decisions: a color strategy; a *scene sentence* (one sentence of physical context — who, where, ambient light, mood — that forces dark-vs-light); and 2–3 *named anchor references* ("specific products, brands, objects. Not adjectives like 'modern'").
- Assert-then-confirm, not menu-with-escape: when the answer is obvious, name it and ask for confirmation instead of enumerating options.
- Ask realistic content ranges (0 / 5 / 500 items) and edge cases up front; ask fidelity/breadth/interactivity scope explicitly.
- Don't list open questions you'd answer with "Recommend: X" — just decide X. Compact brief for clear tasks; the confirmation pause, not the length, is the point.

**harden.md** — Resilience against real inputs.
- Test extremes: 100+ char names, emoji, RTL, CJK, 1000+ items, empty, 10 rapid submits.
- Text expansion budget 30–40% for translation; logical properties (`margin-inline-start`) for RTL; `min-width: 0` on flex/grid items to stop overflow.
- Map API status codes to distinct UX (400 validation, 401 login, 429 rate-limit message…); preserve user input on error.
- Never fixed widths on text containers; never English-length assumptions.

**audit.md** — Code-level technical audit, 5 dimensions scored 0–4 (a11y, performance, theming, responsive, anti-patterns), no fixing — documentation with P0–P3 severity and per-issue impact.
- Anti-patterns dimension is CRITICAL and scored bluntly: "0 = AI slop gallery (5+ tells)."
- Findings must name location, impact, standard violated, and concrete fix; separate systemic patterns ("hard-coded colors in 15+ components") from one-offs; report positives too.

**optimize.md** — Measure, fix the actual bottleneck, re-measure.
- CWV targets: LCP <2.5s, INP <200ms, CLS <0.1; `aspect-ratio` to reserve image space; never lazy-load above-fold content.
- Responsive images (`srcset`/`sizes`), modern formats, 80–85% quality; subset fonts, preload critical only.
- Batch DOM reads then writes (layout thrash); `content-visibility: auto` for long pages; `will-change` sparingly.
- Test on throttled 3G and low-end Android, not dev-machine Chrome.

**adapt.md** — Adaptation is rethinking for context, not scaling pixels.
- Detect input method, not screen size: `pointer: coarse/fine`, `hover: hover/none`; never hover-only functionality.
- Content-driven breakpoints (stretch until it breaks), three usually suffice; mobile-first `min-width`.
- Safe areas: `env(safe-area-inset-*)` + `viewport-fit=cover`; thumb-zone placement; tables → cards on mobile.
- Never hide core functionality on mobile; DevTools emulation misses touch, CPU, and font rendering — real devices.

**live.md** — In-browser variant mode: element picking, HMR hot-swap, three variants with tunable parameter knobs, accept/carbonize back into source. Mostly machinery, but two transplantable design ideas:
- **Identity lock**: before generating variants, extract the surface's existing identity into one factual sentence (actual hexes, actual font names, topology, surface treatment, copy tone — no aesthetic adjectives); every variant must read as the same brand. Default is variation-within-identity; departure requires an explicit trigger.
- Variant trio must differ on *different primary axes* (hierarchy / topology / type system / color strategy / density / structural decomposition), verified by a squint/family/sentence test — two variants that "rhyme" get reworked.

**overdrive.md** — Push past conventional limits, context-gated.
- "Extraordinary" is contextual: particle system on a portfolio, yes; on a settings page, embarrassing — but instant optimistic saves on that settings page also count.
- Propose 2–3 directions and get a pick before building; highest-misfire command.
- Progressive enhancement non-negotiable (`@supports`, WebGL2 fallback, good CSS-only baseline); scroll-driven animation needs static fallback.
- The removal test: take the effect away — does anyone notice? The wow test: does an unbriefed viewer react?

## 2. The overall design philosophy

Five threads run through every file:

1. **AI slop is the enemy, named specifically.** The system maintains a concrete tell list (purple-blue gradients, glassmorphism, gradient-text metrics, identical card grids, scroll-fade-rise everywhere, hero-metric template, warm-cream tint, Inter-by-default, cliched loading copy, side accent stripes) and repeatedly applies one test: "would someone believe AI made this immediately? If yes, failed."
2. **Decisions over defaults.** Every default (blue hue, geometric sans, equal spacing, 8pt grid, bounce easing) is treated as an unexamined reflex; the cure is forcing explicit commitments — a color strategy, a scene sentence, named anchor references, one focal point, one committed ratio.
3. **Deterministic checks are floors, never verdicts — and they anchor.** Mechanical scans run isolated from aesthetic judgment, and a clean scan is explicitly not proof of quality ("a monotone grid passes every detector rule, which is exactly what the assessment exists to catch").
4. **Gates, verified with eyes.** Confirmations before code, screenshots read back into context, honest critique against a contract (the approved direction), and "a confident 'first pass clean' beats a fake fix."
5. **Contrast is the mechanism of quality.** Hierarchy, boldness, rhythm, and even quietness are all achieved by *increasing contrast between few things* rather than adjusting many things: one focal point, few sizes far apart, tight-vs-generous spacing, rare accents.

## 3. Top 15 rules page-foundry should absorb into references/design-direction.md

Chosen for: mechanically checkable or bullet-condensable, directly serving marketing pages, and complementing (not duplicating) the existing anti-slop list.

1. **Spacing rhythm rule** (layout): all spacing from a 4pt scale; 8–12px within related groups, 48–96px between sections; monotone equal spacing is itself a defect. Extends anti-slop from "what it looks like" to "how it's spaced."
2. **Type ramp rule** (typeset): 5 sizes max at a committed ratio ≥1.25 for marketing pages; `clamp()` for headings only, fixed 16px+ body, max clamp ≤2.5× min, 45–75ch measure via `max-width: Nch`.
3. **The bolder reject-list** (bolder): cyan/purple gradients, glassmorphism, neon-on-dark, gradient text on metrics, and scroll-fade-rise-on-every-section are the saturated AI defaults — reject before designing "impact."
4. **One focal point per page section** (bolder/layout): pick the one thing the visitor should remember; if every element is louder, the composition is flatter. Maps directly onto hero/CTA design.
5. **Color strategy commitment** (colorize/shape): declare Restrained / Committed / Full / Drenched per property before styling; 60-30-10 by visual weight; accents work because they're rare.
6. **Brand-tinted neutrals** (colorize): never pure gray and never the stock warm-cream tint — 0.005–0.015 OKLCH chroma toward *this* brand's hue; OKLCH for all scale generation.
7. **The three micro-bans** (colorize/polish): no gray text on colored backgrounds (use a shade of the background color); no colored `border-left/right` stripes >1px (hairline full border or 4–8% tint instead); no bounce/elastic easing.
8. **Motion duration table + one signature moment** (animate): 100–150ms feedback / 200–300ms state / 500–800ms entrance only; exits 75% of enters; sibling stagger capped ~500ms total; at most one earned scroll-triggered moment per page; `prefers-reduced-motion` always.
9. **Scene sentence + named anchors** (shape): design direction must include one sentence of physical context (forces dark-vs-light) and 2–3 named references — specific products/brands/objects, never adjectives. Cheap, transformative brief discipline for Phase 4.
10. **Identity lock for iterations** (live): before restyling an existing property's page, write one factual sentence of its current identity (actual colors, actual fonts, topology, tone); output must read as the same brand unless the brief explicitly departs. Fits page-foundry's persistent per-property tokens perfectly.
11. **Squint test as a render-gate check** (layout): blurred, primary element, secondary, and groupings must be identifiable in 2 seconds — a one-line addition to the render-review gate.
12. **Real imagery or nothing** (craft): image-led pages get real/sourced imagery, never decorative CSS panels, emoji, or fake metrics as stand-ins; verify every image URL before referencing; fewer confident images beat guessed ones. Aligns with the integrity gate.
13. **Focus/hover completeness** (interaction-design): every interactive element gets `:focus-visible` (2–3px, offset, 3:1 contrast) *and* hover; never `outline:none` without replacement; no hover-only functionality; 44px targets via padding/pseudo-element. Concrete teeth for the WCAG gate.
14. **Content hardening minimums** (harden): headline/CTA copy tested at long and short lengths; `min-width:0` on flex/grid text containers; no fixed widths on text; 30–40% expansion headroom. Marketing pages break on real product names constantly.
15. **CLS/LCP mechanics** (optimize/adapt): explicit `aspect-ratio` or dimensions on every image, `font-display: swap` with metric-matched fallback, preload only the critical font weight, never lazy-load above the fold, content-driven breakpoints, `pointer/hover` media queries instead of screen-size assumptions. Teeth for the performance gate.

## 4. Capabilities that should stay impeccable-invocations (too deep to condense)

- **critique's dual-isolated-assessment machinery** — sub-agent orchestration, detector scripts (`detect.mjs`), browser overlay injection, snapshot persistence, and score trending are infrastructure, not rules. page-foundry's conversion audit can borrow the *isolation principle* in one line, but the apparatus stays impeccable's.
- **live mode entirely** — the wrap/insert/carbonize/param-knob HMR system is hundreds of lines of protocol tied to impeccable's scripts.
- **Nielsen heuristic scoring + persona library** — valuable, but page-foundry already has MECLABS scoring plus per-buyer-entry-state red-team reads; running two full scoring rubrics would duplicate. Invoke critique when a page needs a UX-heuristics read beyond conversion.
- **overdrive** — WebGL/WebGPU/View Transitions/WASM ambition is opt-in, propose-first, and mostly beyond a static-HTML marketing page's needs; invoke for the rare cinematic hero.
- **Full font-selection procedure and mock-generation flow (brand.md/codex.md-gated steps)** — harness-gated image generation and the deep pairing procedure exceed a condensed reference; keep the anti-reflex bullets (absorbed above), invoke the rest.
- **audit's full 5-dimension scored report format** — page-foundry's eight ship gates already partition this territory; absorb the checks, not the report machinery.
- **shape's full discovery-interview protocol** — page-foundry's intake/brief phase owns this role; absorb only the scene-sentence/anchor-references/assert-then-confirm techniques.

## 5. Contradictions and tensions with page-foundry's approach

- **Different masters: usability vs conversion.** Nielsen #8 ("every element earns its pixel") and the cognitive-load ≤4-options rule optimize for task completion; long-form sales pages deliberately repeat CTAs, stack proof, and run long. MECLABS scoring should stay the arbiter; impeccable's minimalism heuristics are advisory on sales-page archetypes.
- **"Undo > confirm," optimistic UI, virtual scrolling, React memoization, API-error-code mapping, service workers** (interaction-design, optimize, harden) — app-interface material with little purchase on a static HTML page with at most a form. Don't transplant; would bloat the condensed reference.
- **WCAG framing is looser in places.** impeccable repeatedly cites plain "WCAG AA" contrast and harden treats a11y as one dimension among many; page-foundry's WCAG 2.2 AA is a hard ship gate. Where they differ, page-foundry's gate is stricter and wins. (Note: impeccable's polish checklist allows "text no smaller than 14px on mobile" for UI text while typeset demands 16px body — page-foundry should keep 16px body as the rule.)
- **Framework respect vs static output.** craft's Step 0 defaults to Astro and insists on respecting build pipelines; page-foundry's build mode ships static HTML by design. Ignore the framework-selection guidance; keep the underlying "don't write to dist/" hygiene only where a pipeline actually exists.
- **Delight budget.** delight/overdrive push personality moments and easter eggs; on a conversion page every interaction competes with the CTA. Absorb the *restraint* rules (one earned moment, cliched-copy ban) and skip the technique catalog (confetti, sound design, Konami codes).
- **Gate style is compatible, not contradictory** — impeccable's confirm-before-code gates mirror page-foundry's phase gates; and its "detector output is defect evidence only, never proof" doctrine directly reinforces how page-foundry should treat its own voice_scan.py: the scan can fail a page, but passing it never certifies the copy.

Source directory: /private/tmp/claude-501/-Users-taylor-projects-page-foundry/07563dd2-b543-4875-9bd8-be3706e99942/scratchpad/impeccable/.claude/skills/impeccable/reference/ (also present but not in scope: brand.md, clarify.md, distill.md, document.md, onboard.md, init.md, codex.md, native variants — brand.md and clarify.md look worth a follow-up read if design-direction.md gets a voice/typography section).