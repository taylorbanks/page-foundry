# Handoff Mode: The Design Package

Handoff mode produces everything a design tool needs to build a page that passes this skill's gates, with the thinking, copy, and constraints already done. The primary target is Claude Design (Anthropic Labs); the package also works for any designer or design tool.

The package's balance is deliberate, and it leans the opposite way from a normal creative brief. Where the tool excels (layout, art direction, motion, visual invention) the package grants explicit license instead of prescribing. Where the tool cannot know better, it over-specifies: the voice rules for text the tool will generate, the fabrication ban, asset geometry, the acceptance criteria, and the shape of what comes back. A tool handed a signature element as a mandate produces a worse page than one handed the same element as an anchor with license to beat it; a tool handed no voice rules writes microcopy that fails the post-build scan every time.

What matters about Claude Design for this package: it accepts plain text prompts, screenshots and image assets, DOCX/PPTX/XLSX documents, codebases, and web captures; it can build a persistent design system from brand sources (palette, type scale, components, layout patterns); it outputs deployable HTML/CSS/JS and can hand off to Claude Code; and it does NOT retain brand context across separate conversations, so the package must be fully self-contained and re-pasteable every session, and every revision round re-sends it in full (the revision format in `06-return-spec.md` assumes exactly this).

## Package contents

Write to `handoff/<product>/`. Each file is produced from a named run artifact; the package is a projection of the run directory, never new thinking.

```
handoff/<product>/
├── 00-master-prompt.md       The paste-ready prompt: orientation, the five non-negotiables,
│                             the creative license grant, the questions list
├── 01-copy.md                Final voice-gated copy, verbatim, with image-slot geometry
│                             (from copy/copy-approved.md)
├── 02-page-spec.md           The compiled conversion contract and section spec
│                             (from page-spec.md)
├── 03-design-direction.md    Locked tokens, or propose-then-lock; signature element as
│                             anchor; anti-slop list (from tokens/, theme.css, DESIGN.md)
├── 04-acceptance-criteria.md Filled from the fixed template below; IDs map to gate IDs
├── 05-voice-rules.md         Excerpt of references/voice.md; governs tool-generated text
├── 06-return-spec.md         What comes back, and the revision-request format
└── assets/                   theme.css, manifest.md (geometry), llms.txt, schema.jsonld,
                              logos, screenshots, captures. Real artifacts only.
```

Files `00` through `06` ship in every package. A file with nothing run-specific to say for this product still ships and says why (a greenfield property's `03` opens with the propose-then-lock instruction instead of tokens); a missing file reads as an oversight, and the tool fills oversights with defaults.

### 00-master-prompt.md

The single document pasted into Claude Design (attach the rest as files). Structure:

1. One paragraph: product, audience, archetype, and the page's single job, taken from the compiled contract's goal block.
2. The five non-negotiables, verbatim from below.
3. The creative license grant, verbatim from below.
4. The signature element candidate and any motion notes from Phase 4.
5. Questions, not guesses: unresolved `[TK]` items, image or proof slots without assets, and anything else the tool would otherwise decide silently.

**The five non-negotiables** (carry into `00` verbatim):

1. **The copy is final.** The copy in `01-copy.md` is voice-gated and verbatim. Do not paraphrase, shorten, expand, or improve any sentence. If a layout needs shorter text, flag it in the return log; do not rewrite it. Any text you generate that is not in `01-copy.md` (navigation labels, form microcopy, error and empty states, button labels, alt text, aria-labels, footer lines) follows `05-voice-rules.md` and is scanned on return.
2. **The section order is the conversion contract.** Build the content in the order `02-page-spec.md` gives, keeping each section's claim, proof element, and CTA treatment together as specified. Visual sectioning is yours: folding two adjacent sections into one band, or splitting one across a scroll sequence, is legitimate when the reading order and each claim-to-proof pairing survive. Adding content sections, dropping them, or reordering them is not.
3. **The CTA policy binds.** Exactly one primary CTA action on the page; every repeat identical in wording and destination; every CTA instance with its proof element within one viewport, as the spec places them.
4. **No fabricated proof, ever.** "Zero fabricated testimonials, logos, counts, or statistics" (this skill's integrity gate, verbatim). Concretely: do not add a logo strip, star rating, avatar row, testimonial, user count, or statistic that is not in the package. Proof lives in `01-copy.md` and `assets/` only. A proof slot the package leaves empty stays empty and goes in the return log as a question.
5. **The acceptance criteria are the definition of done.** Meet every criterion in `04-acceptance-criteria.md`, by ID. The return log answers each ID: met, not met with a reason, or N/A as marked.

**The creative license grant** (carry into `00` verbatim):

You own layout, grid, visual rhythm, art direction, and imagery treatment within the geometry `assets/manifest.md` fixes; motion design within `prefers-reduced-motion` and the performance criteria; and the signature element: `03-design-direction.md` names a candidate as an anchor, and you may propose alternatives that serve the same claim more strongly, with a sentence on why. Where `03-design-direction.md` says propose-then-lock, the token system itself is in scope: propose 2 or 3, apply your recommendation consistently, and return it machine-readable.

The verbatim-copy rule exists because the voice gate ran BEFORE handoff; any downstream paraphrase silently un-passes it. It is the most commonly violated instruction, so it leads the non-negotiables and is repeated next to the copy itself.

### 01-copy.md

Source: `copy/copy-approved.md`, shipped as the package's copy file (the same content; Gate 2's verbatim diff runs against it when the build returns). Final copy in page order, one block per spec section, each labeled with the spec section number and the element roles:

```
## Section 3: Quickstart  [spec §3]
H2: Up and running in two minutes
Body: ...
CTA button: Copy install command
```

Header note, repeated from the master prompt: "This copy is final and voice-gated. Verbatim use only." The file also carries the `<title>` and meta description as labeled entries; they are copy, they passed the voice gate, and criterion G6.5 checks them in the build.

Every image slot carries its geometry, so the tool designs around the real shapes instead of discovering them at the render gate:

```
[IMAGE: {description} · displays at {W}x{H}px on desktop · aspect {W:H} · asset: {filename in assets/, or TK}]
```

### 02-page-spec.md

The operative Phase 2 output: the filled conversion contract (goal, buyer entry states, jobs, proof requirements, CTA policy, ordering constraints, axis settings), the numbered section spec in the computed order with purpose, claim, proof element, and CTA treatment per section, the answer block, the measurement plan, nav policy, and the archetype name. Include the mobile ordering note: the spec order is the single-column order. The candidate skeletons and their pre-reads stay in the run directory; they are decision history, not build input.

### 03-design-direction.md

Opens by naming which regime the run is in, so the tool knows what is fixed:

- **Locked** (existing brand, or a persisted theme from a prior run): the token set as named values with `theme.css` attached, the property's `DESIGN.md` content carried when it exists, and captures or screenshots of live properties in `assets/` so the tool extracts the system from sources rather than descriptions (it is good at this; give it sources when they exist). Do not introduce new palette colors or typefaces.
- **Propose-then-lock** (new property, no committed theme): the brief's aesthetic constraints, the OKLCH seed when Phase 4 produced one, and the instruction to propose 2 or 3 token systems differing on a real axis (temperature, type contrast, density). The owner locks one on return, and the locked system persists as `theme.css` for every later page on the property.

Then: the chosen direction in two or three sentences; the signature element candidate, framed as an anchor the license grant lets the tool beat; and the anti-slop list from `references/design-direction.md`, included verbatim, because design tools regress to defaults without it. Asset-to-slot mapping lives in `assets/manifest.md`, not here.

### 04-acceptance-criteria.md

Filled from the fixed template below, never written fresh. Copy the template whole, fill the `{slots}` with the run's real values, mark inapplicable criteria N/A with the reason on the line, and append run-specific criteria (a motion asset, a form flow) under the owning gate with the next free number. Nothing is reworded, renumbered, or deleted; a criterion ID means the same thing in every package, so a post-build gate failure traces mechanically to the exact line the builder was given. The prefix is the map: criterion `G4.2` belongs to ship gate 4.

### 05-voice-rules.md

An excerpt of `references/voice.md` as configured at run time, so an owner's voice overlay carries through automatically: the Register section, the Punctuation rules, and the banned list, plus one paragraph naming what the excerpt governs: every string the tool generates that `01-copy.md` does not contain. Nav labels, form fields and their error and empty states, button labels, alt text, aria-labels, footer lines, cookie or consent text. The excerpt exists so tool-generated microcopy passes the post-build scan the first time instead of failing it predictably.

### 06-return-spec.md

What the tool hands back:

1. **The built page**: deployable HTML/CSS/JS with assets, as files or a repo, plus the deployed URL when one exists. A tool that can only return a design file rather than code must say so up front, because the post-build gates run on rendered markup and a design file cannot pass them.
2. **The return log**: every criterion ID answered (met, not met with a reason, or N/A as marked); the list of every text string the build introduced that is not in `01-copy.md`, which is the first target of the voice re-scan; and the flags and questions the non-negotiables call for.
3. **Exercised license**: any signature-element alternative or proposed token system, each with its sentence of reasoning; under propose-then-lock, the applied tokens as CSS custom properties.

When a post-build gate fails, the revision request uses this fixed shape, and the full package is re-attached every round because the primary target retains nothing between sessions:

```
## Revision request {n}: {product}

Package: re-attached in full.
Unchanged: the five non-negotiables in 00-master-prompt.md.

- {criterion ID}: observed {what the check saw}; required {what must be true}.
- {criterion ID}: ...

Out of scope for this revision: everything not listed above.
```

Ownership across rounds: revisions go to the tool, and the tool's project stays the source of truth for the markup. When the owner chooses to patch the returned files directly instead, the patched files become the build of record and later rounds run on them; a hand-patch that touches copy re-enters Phase 3 step 5 like any other post-pass edit.

### assets/

- `theme.css`: the locked tokens as custom properties, contrast-verified (locked regime only).
- `manifest.md`: one row per file: filename, the spec section it serves, display dimensions, aspect ratio, intended treatment (crop, frame, full-bleed), and its alt text, written under the voice rules; criterion G3.6 checks the build against this column.
- `llms.txt` and `schema.jsonld`: pre-filled with the product's real values from the templates in `references/ship-gates.md`, shipped as files so the build embeds them instead of retyping them; criteria G6.1 and G6.2 check byte-identity.
- Logos, product screenshots, captures of live properties. Real artifacts only; no placeholder or generated stand-in enters the package.

## The acceptance criteria template (fixed)

```markdown
# Acceptance criteria: {product}

Copied from the fixed template in page-foundry's references/handoff.md. IDs are stable and
the prefix names the owning ship gate (G3 accessibility, G4 performance, G5 design, G6 AI
discovery, G7 measurement). {slots} are filled per run. Inapplicable criteria are marked
N/A with the reason on the line; nothing is reworded, renumbered, or deleted. Run-specific
criteria append under their gate with the next free number. The return log answers every ID.

## G3 · Accessibility (WCAG 2.2 AA)
- G3.1 One h1; heading levels do not skip.
- G3.2 Landmarks present (nav, main, footer); links and buttons are real a/button elements;
  icon-only controls carry an aria-label.
- G3.3 Text contrast at least 4.5:1 (3:1 for large text and UI components), CTA buttons included.
- G3.4 Visible keyboard focus on every interactive element; logical tab order; focus never
  obscured.
- G3.5 Touch targets at least 24x24px; 44px or larger for primary actions.
- G3.6 Every informative image carries the alt text assets/manifest.md specifies and explicit
  width/height attributes; decorative images have empty alt.
- G3.7 No content conveyed by color alone; prefers-reduced-motion respected; motion animates
  only transform and opacity.
- G3.8 Form inputs have programmatic labels and correct type/inputmode/autocomplete; async
  status changes use aria-live. {N/A when the page has no form}
- G3.9 No step forces a memory or transcription test without an easier alternative.
  {N/A when the page has no auth}

## G4 · Performance
- G4.1 Total transfer under {budget, default 1MB}; CSS plus JS under {budget, default 200KB}.
- G4.2 Images sized to the display dimensions in assets/manifest.md, WebP or AVIF, lazy-loaded
  below the fold.
- G4.3 Fonts: system stack, or at most two self-hosted files, preloaded, font-display: swap.
- G4.4 No render-blocking third-party scripts; analytics loads deferred.
- G4.5 LCP under about 2 seconds on a mid-range phone; the LCP element is the hero image or
  text block, not a script-injected element.

## G5 · Design
- G5.1 Fully usable at 390px width with the primary CTA above the fold; composed, not
  stretched, at 1440px.
- G5.2 {locked regime: only the palette, type, and radii in 03-design-direction.md and
  theme.css appear on the page} {propose-then-lock regime: the proposed token system is
  applied consistently and returned as CSS custom properties}
- G5.3 Nothing on the anti-slop list in 03-design-direction.md appears on the page.

## G6 · AI discovery and meta
- G6.1 llms.txt from assets/ placed at the site root, byte-identical.
- G6.2 The JSON-LD in assets/schema.jsonld embedded in <head>, byte-identical.
- G6.3 The answer block from spec section {n} survives as one self-contained block of real
  text near the top of the page.
- G6.4 robots.txt does not disallow GPTBot, ChatGPT-User, PerplexityBot, ClaudeBot,
  anthropic-ai, Google-Extended, or Bingbot. {N/A when the tool does not control deployment}
- G6.5 <title> and meta description exactly as 01-copy.md gives them.
- G6.6 Open Graph and Twitter card meta complete; the OG image is {filename}, 1200x630.
- G6.7 Canonical URL set to {url}; favicon present.
- G6.8 /pricing.md from assets/ placed at the site root. {public-pricing archetypes only;
  N/A otherwise}

## G7 · Measurement
- G7.1 The conversion event wired exactly as the measurement plan in 02-page-spec.md defines
  it: {event, destination}.
- G7.2 Outbound campaign links carry the UTM convention the measurement plan states.
  {N/A when the plan names no campaign links}
- G7.3 The analytics snippet ({name}) included, deferred. {N/A when the plan declined
  analytics}
```

## Gate split in handoff mode

Run BEFORE delivering the package (these gate the package itself):

- Gate 1, conversion audit: runs against the spec and copy (5-second test, CTA policy, headline budget, proof adjacency). The MECLABS score of record comes from a fresh agent given the package's verbatim copy and the brief, per Gate 1's mechanics in `references/ship-gates.md`.
- Gate 2, voice: `voice_scan.py` at zero FAILs across the package's prose files (`00` through `06`); the pattern pass and the humanizer already ran in Phase 3 on the copy itself.
- Gate 8, integrity: no fabricated proof anywhere in the package; `[TK]` items listed in the master prompt's questions section.

Run AFTER the built asset comes back:

- Gates 3 through 7 in full, walked against the criteria file by ID; the criteria are the same checks pre-translated for the builder, and the gates in `references/ship-gates.md` remain the arbiter.
- Gate 1 re-check on the rendered page (did the build preserve CTA policy and proof adjacency?).
- Gate 2 re-scan on the built HTML: the verbatim diff of rendered text against `01-copy.md`, then the scan of every string the return log lists as introduced. This catches real violations often; run it every time.
- Gate 8 re-check: nothing the build added fabricates proof.

A handoff is not done at package delivery; it is done when the returned asset passes the post-build gates.

---

_Provenance: page-foundry-native (no direct companion source). The Claude Design capability description reflects Anthropic Labs as of 2026-07; re-verify it if the tool's inputs or outputs change. Gate IDs, the criteria template, and the embedded-file checks stay in sync with `references/ship-gates.md`; the `05` excerpt with `references/voice.md`; the anti-slop list with `references/design-direction.md`._
