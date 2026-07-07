# Handoff Mode: Claude Design Package

Handoff mode produces everything a design tool needs to build a 10/10 page, with the thinking, copy, and constraints already done. The primary target is Claude Design (Anthropic Labs); the package also works for any designer or design tool.

What matters about Claude Design for this package: it accepts plain text prompts, screenshots and image assets, DOCX/PPTX/XLSX documents, codebases, and web captures; it can build a persistent design system from brand sources (palette, type scale, components, layout patterns); it outputs deployable HTML/CSS/JS and can hand off to Claude Code; and it does NOT retain brand context across separate conversations, so the package must be fully self-contained and re-pasteable every session.

## Package contents

Write to `handoff/<product>/`:

```
handoff/<product>/
├── 00-master-prompt.md      The paste-ready prompt; references the other files
├── 01-copy.md               Final copy, verbatim, in page order
├── 02-page-spec.md          The Phase 2 spec (sections, claims, proof, CTAs)
├── 03-design-direction.md   Tokens, direction, anti-slop list, asset manifest
├── 04-acceptance-criteria.md Gates rewritten as testable acceptance criteria
└── assets/                  Logos, screenshots, theme.css, reference captures
```

### 00-master-prompt.md

The single document pasted into Claude Design (attach the rest as files). Structure:

1. One paragraph: product, audience, archetype, the page's single job.
2. Instruction block, verbatim rules for the design tool:
   - "The copy in 01-copy.md is final. Use it verbatim. Do not paraphrase, shorten, expand, or 'improve' any sentence. If a layout needs shorter text, flag it; do not rewrite."
   - "Follow the section order in 02-page-spec.md exactly. Do not add, merge, or reorder sections."
   - "Use the tokens in 03-design-direction.md (and attached theme.css if present) as the design system. Do not introduce new palette colors or typefaces."
   - "Build to the acceptance criteria in 04-acceptance-criteria.md. Treat them as the definition of done."
3. The signature element description and any motion notes from Phase 4.
4. What to ask about instead of guessing (unresolved [TK] items, image slots without assets).

The verbatim-copy rule exists because the voice gate ran BEFORE handoff; any downstream paraphrase silently un-passes it. This is the most commonly violated instruction, so it goes first and is repeated next to the copy itself.

### 01-copy.md

Final copy in page order, one block per spec section, each labeled with the spec section number and the element roles:

```
## Section 3: Quickstart  [spec §3]
H2: Up and running in two minutes
Body: ...
CTA button: Copy install command
```

Header note, repeated from the master prompt: "This copy is final and voice-gated. Verbatim use only." Image slots are marked `[IMAGE: description, asset filename or TK]`.

### 02-page-spec.md

The Phase 2 output as-is: numbered sections with purpose, claim carried, proof element, CTA treatment, plus nav policy and archetype name. Include the mobile ordering note: the spec order is the single-column order.

### 03-design-direction.md

- Token set: named palette hex values, type pairing and scale, spacing, radius/border conventions. Attach `theme.css` in assets/ when it exists; for an existing brand, attach real captures or screenshots of current properties so Claude Design can extract the system itself (it is good at this; give it sources rather than descriptions when possible).
- The chosen direction in two or three sentences, plus the signature element.
- The anti-slop list from design-direction.md, included verbatim; design tools regress to defaults without it.
- Asset manifest: every file in assets/ with its intended slot.

### 04-acceptance-criteria.md

Rewrite the build-dependent gates (ship-gates.md gates 3, 4, 5 plus the build requirements from Phase 5) as numbered, testable criteria. Examples: "Renders fully usable at 390px width with the CTA above the fold"; "One h1; heading levels do not skip"; "Total transfer under 1MB"; "JSON-LD from the included template embedded in head"; "prefers-reduced-motion respected". Include the llms.txt and schema templates pre-filled with the product's real values so the builder embeds rather than writes them.

## Gate split in handoff mode

Run BEFORE delivering the package (these gate the package itself):

- Gate 1, conversion audit: runs against the spec and copy (5-second test, CTA policy, headline budget, proof adjacency, MECLABS scored on the planned page).
- Gate 2, voice: `voice_scan.py` at zero FAILs on 01-copy.md and 00-master-prompt.md.
- Gate 6, integrity: no fabricated proof anywhere in the package; [TK] items listed in the master prompt's questions section.

Run AFTER the built asset comes back (request the HTML or a deployed URL):

- Gate 1 re-check on the rendered page (did the build preserve CTA policy and proof adjacency?).
- Gate 2 re-scan on the built HTML (catches paraphrase drift; this catches real violations often, run it every time).
- Gates 3, 4, 5 in full.

A handoff is not done at package delivery; it is done when the returned asset passes the post-build gates.
