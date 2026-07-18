# 16 (#16): constant spot-check before absorption

Every constant stamped into `references/design-direction.md` was checked against the pinned impeccable clone (`~/projects/impeccable`, frontmatter version 3.9.1, commit `8967edc`) before copying, per the critique.md flag on verbatim constants. Raw grep output per rule follows; the command line above each block reproduces it.

## Rule 1: spacing rhythm (`layout.md`)

```
$ grep -n '4pt\|8-12px\|48-96\|monotone' layout.md
1:Space is the most underused design tool. Find the layout's actual problem (monotone spacing, weak hierarchy, identical card grids) and fix the structure, not the surface.
31:**Synthesize** once both are done: merge into a single findings list, noting where they agree and what each caught alone. Fix every finding, or list it as a deliberate exception for the user to accept. A clean scan is a floor, not a verdict: a monotone grid with uniform spacing passes every detector rule, which is exactly what the assessment exists to catch. State in your final summary which path ran (parallel sub-agents or single-context fallback).
79:- Prefer a 4pt base scale (4, 8, 12, 16, 24, 32, 48, 64, 96px) over 8pt; 8pt is too coarse and you'll frequently need 12px between 8 and 16.
86:- **Tight grouping** for related elements (8-12px between siblings)
87:- **Generous separation** between distinct sections (48-96px)
```

## Rule 2: type ramp, clamp bound, measure (`typeset.md`)

```
$ grep -n '5 sizes\|consistent ratio\|max-size\|45–75ch band\|Marketing / content pages' typeset.md
87:- **5 sizes cover most needs**: caption, secondary, body, subheading, heading
88:- **Use a consistent ratio** between levels (1.25, 1.333, or 1.5)
91:- **Marketing / content pages**: Use fluid sizing via `clamp(min, preferred, max)` for headings and display text. Keep body text fixed
253:**Bound your clamp()**: keep `max-size ≤ ~2.5 × min-size`. Wider ratios break the browser's zoom and reflow behaviour and make large viewports feel like the page is shouting.
255:**Scale container width and font-size together** so effective character measure stays in the 45–75ch band at every viewport. A heading that widens faster than its container drifts out of the comfortable measure at the top end.
```

## Rule 3: bolder reject-list (`bolder.md`)

```
$ grep -n 'cyan/purple\|scroll-fade-rise' bolder.md
1:When asked for "bolder," AI defaults to the same tired tricks: cyan/purple gradients, glassmorphism, neon accents on dark backgrounds, gradient text on metrics. These are the opposite of bold. Reject them first, then increase visual impact by making the existing design language more decisive, specific, and committed.
88:- **Bolder != scroll-fade-rise on every section.** That's the saturated AI default, the opposite of bold.
```

## Rule 4: one focal point (`bolder.md`)

```
$ grep -n 'Focal point\|louder' bolder.md
49:- **Focal point**: Pick one thing the viewer should remember, then make the rest support it.
52:- **Hierarchy amplification**: Increase contrast between primary, secondary, and tertiary content instead of making every element louder.
94:- If every element is louder, the composition is not bolder; it is flatter.
```

## Rule 5: color strategy, 60-30-10 as visual weight (`colorize.md`)

```
$ grep -n 'Restrained / Committed\|visual weight\|because it.s rare\|Overuse' colorize.md
9:Brand: palette IS voice. Pick a color strategy first per SKILL.md (Restrained / Committed / Full palette / Drenched) and follow its dosage. Committed, Full palette, and Drenched deliberately exceed the ≤10% rule; that rule is Restrained only. Unexpected combinations are allowed; a dominant color can own the page when the chosen strategy calls for it.
195:This rule is about **visual weight**, not pixel count:
201:The common mistake: using the accent color everywhere because it's "the brand color." Accent colors work *because* they're rare. Overuse kills their power.
```

## Rule 6: brand-tinted neutrals (`colorize.md`)

```
$ grep -n '0.005-0.015\|oklch(97% 0.01 60)\|Pure gray is dead' colorize.md
71:- **Tinted backgrounds**: If you replace pure gray, tint toward the brand hue, not toward a generic-warm-or-cool pair. The default-warm-tint (`oklch(97% 0.01 60)` and its neighbors) is now the AI cream/sand giveaway. Be specific to the brand or stay neutral.
174:**Pure gray is dead.** A neutral with zero chroma feels lifeless next to a colored brand. Add a tiny chroma value (0.005-0.015) to all your neutrals, hued toward whatever your brand color is. The chroma is small enough not to read as "tinted" consciously, but it creates subconscious cohesion between brand color and UI surfaces.
```

## Rule 7a: gray on color ban (`polish.md`, `colorize.md`)

```
$ grep -n 'Gray on color\|gray text on colored' polish.md colorize.md
colorize.md:126:- Put gray text on colored backgrounds. It looks washed out; use a darker shade of the background color or transparency instead
polish.md:94:- **Gray on color**: Never put gray text on colored backgrounds; use a shade of that color or transparency
```

## Rule 7b: side-stripe ban (`colorize.md`)

```
$ grep -n 'border-left. or .border-right. greater than 1px\|not side-stripes' colorize.md
84:- **Hairline borders**: 1px colored borders on full perimeter (not side-stripes; see the absolute ban on `border-left/right > 1px`)
90:**NEVER**: `border-left` or `border-right` greater than 1px as a colored accent stripe. This is one of the three absolute bans in the parent skill. If you want to mark a card as "active" or "warning", use a full hairline border, a background tint, a leading glyph, or a numbered prefix. Not a side stripe.
```

## Rule 7c: bounce/elastic ban (`polish.md`, `animate.md`)

```
$ grep -n 'bounce or elastic' polish.md animate.md
polish.md:114:- **Consistent easing**: Use ease-out-quart/quint/expo for natural deceleration. Never bounce or elastic; they feel dated.
animate.md:184:- Use bounce or elastic easing curves; they feel dated and draw attention to the animation itself
```

## Rule 8: duration table, exits, stagger cap, scroll moments (`animate.md`)

```
$ grep -n '100–150ms\|200–300ms\|300–500ms\|500–800ms\|75% of enter\|500ms total\|moments that earn it' animate.md
9:Brand: motion is part of the voice; one well-rehearsed entrance beats scattered micro-interactions. The saturated AI default is fade-and-rise reveals on every scrolled section; that's a tell, not a choreography. Reserve scroll-triggered motion for moments that earn it.
56:- **List rhythm**: Sibling stagger is legitimate for cards-in-a-grid or list-items-appearing. Whole-section fade-on-scroll is not a list and is not legitimate. Cap total stagger time: 10 items at 50ms each = 500ms total. For more items, reduce per-item delay or cap the staggered count.
107:| **100–150ms** | Instant feedback | Button press, toggle, color change |
108:| **200–300ms** | State changes | Menu open, tooltip, hover state |
109:| **300–500ms** | Layout changes | Accordion, modal, drawer |
110:| **500–800ms** | Entrance animations | Page load, hero reveal |
124:**Exit animations are faster than entrances.** Use ~75% of enter duration.
```

## Rule 9: scene sentence and named anchors (`shape.md`)

```
$ grep -n 'scene sentence\|named anchor\|Not adjectives' shape.md
48:- **Theme via scene sentence.** Write one sentence of physical context for this surface: who uses it, where, under what ambient light, in what mood. The sentence forces dark vs light. If it doesn't, add detail until it does.
49:- **Two or three named anchor references.** Specific products, brands, objects. Not adjectives like "modern" or "clean."
91:- Theme scene sentence
134:Color strategy (Restrained / Committed / Full palette / Drenched) + the theme scene sentence + 2–3 named anchor references. Reference PRODUCT.md and DESIGN.md where they already answer, and note any per-surface overrides.
```

## Rule 10: identity lock (`live.md`)

```
$ grep -n 'identity lock\|same brand' live.md
221:This sentence is the **identity lock**. Every variant must be readable as the same brand if rendered side by side. Skipping this phase is the primary cause of off-brand variants. Absence of DESIGN.md is never an excuse; extract from CSS and computed styles instead.
245:Three variants → three DIFFERENT axes. The trio reads as *the same brand at three angles*. Do not introduce new fonts, new palette hues, or new aesthetic-family signals; those belong to departure mode.
288:In **default mode**, the prompt narrows the axes you choose, not the identity. *"Make it feel more confident"* → variant 1 amplifies hierarchy (one element commands the eye), variant 2 commits the existing accent color (Committed strategy on the brand's hue), variant 3 tightens density and removes decorative slack. Three different axes, same brand.
```

## Rule 11: squint test (`layout.md`)

```
$ grep -n -i 'squint\|2 seconds' layout.md
45:   - Apply the squint test: blur your (metaphorical) eyes. Can you still identify the most important element, second most important, and clear groupings?
156:- **Squint test**: Can you identify primary, secondary, and groupings with blurred vision?
158:- **Hierarchy**: Is the most important content obvious within 2 seconds?
```

## Rule 12: real imagery or nothing (`craft.md`)

```
$ grep -n 'generic cards\|Verify image URLs' craft.md
75:Whether you generated mocks or not: don't replace required imagery with generic cards, bullets, emoji, fake metrics, decorative CSS panels, or filler copy. Image-led briefs (restaurants, hotels, magazines, photography, hobbyist communities, food, travel, fashion, product) need real or sourced imagery in the build, not CSS scenery.
94:- **Verify image URLs before referencing them.** Use image-search MCP or web-fetch when available; guessed photo IDs ship as broken-image placeholders. Without verification, prefer fewer images you're confident about.
```

## Rule 13: focus ring specifics and 44px targets (`interaction-design.md`)

```
$ grep -n '3:1 minimum\|2-3px\|outline: none. without replacement\|44x44' interaction-design.md
22:**Never `outline: none` without replacement.** It's an accessibility violation. Instead, use `:focus-visible` to show focus only for keyboard users:
38:- High contrast (3:1 minimum against adjacent colors)
39:- 2-3px thick
189:**Avoid**: Removing focus indicators without alternatives. Using placeholder text as labels. Touch targets <44x44px. Generic error messages. Custom controls without ARIA/keyboard support.
```

## Rule 14: content hardening (`harden.md`)

```
$ grep -n 'min-width: 0\|30-40% space\|fixed widths on text' harden.md
68:  min-width: 0; /* Allow shrinking below content size */
74:  min-width: 0;
88:- Add 30-40% space budget for translations
91:- Avoid fixed widths on text containers
```

## Rule 15a: CLS/LCP mechanics (`optimize.md`)

```
$ grep -n 'aspect-ratio\|Lazy load above-fold\|LCP < 2.5s' optimize.md
192:### Largest Contentful Paint (LCP < 2.5s)
208:- Use `aspect-ratio` CSS property
215:  aspect-ratio: 16 / 9;
243:- Lazy load above-fold content
```

## Rule 15b: font loading (`typeset.md`)

```
$ grep -n 'font-display: swap\|metric-matched\|critical weight only' typeset.md
82:- Ensure web font loading doesn't cause layout shift (`font-display: swap`, metric-matched fallbacks)
213:/* 1. Use font-display: swap for visibility */
217:  font-display: swap;
239:**Preload the critical weight only**: typically the regular-weight body font used above the fold. Preloading every weight costs more bandwidth than it saves.
```

## Rule 15c: content-driven breakpoints, input queries (`adapt.md`)

```
$ grep -n 'Content-Driven\|content-driven\|pointer and hover queries' adapt.md
136:- Or content-driven breakpoints (where design breaks)
176:- Use generic breakpoints blindly (use content-driven breakpoints)
205:#### Breakpoints: Content-Driven
211:**Screen size doesn't tell you input method.** A laptop with touchscreen, a tablet with keyboard. Use pointer and hover queries:
```

## Notes

- One dosage caveat surfaced by the check: `colorize.md` line 9 says Committed, Full palette, and Drenched deliberately exceed a restrained ≤10% accent dosage. The absorbed bullet reflects this: the chosen strategy, not habit, decides how far past a restrained dosage the page goes.
- The research report's rule 15 cited FID under 100ms alongside INP; the absorbed bullet stamps only LCP under 2.5s, which the source states directly at the grep line above.
- `references/voice.md` line 209 claimed the two absorbed text rules came from impeccable 3.2.1; the clone at `8967edc` carries frontmatter version 3.9.1 (misstatement already recorded in the overnight report's 15a note). Corrected in this commit.
- Scan of the rewritten `design-direction.md`: PASS, zero WARN (the one v2.x carryover judgment-word WARN was removed in the rewrite).
