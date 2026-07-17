# Audit: page-foundry handoff mode vs. the 10/10 first-generation goal

Sources read in full: `/Users/taylor/projects/page-foundry/skills/page-foundry/references/handoff.md`, SKILL.md Phase 5/6 (lines 183-212), plus `references/design-direction.md` and the ship-gates.md gate outline for cross-checking.

## 1. Current package contents and structure (verbatim)

From handoff.md:

```
handoff/<product>/
├── 00-master-prompt.md      The paste-ready prompt; references the other files
├── 01-copy.md               Final copy, verbatim, in page order
├── 02-page-spec.md          The Phase 2 spec (sections, claims, proof, CTAs)
├── 03-design-direction.md   Tokens, direction, anti-slop list, asset manifest
├── 04-acceptance-criteria.md Gates rewritten as testable acceptance criteria
└── assets/                  Logos, screenshots, theme.css, reference captures
```

00-master-prompt structure: (1) one-paragraph orientation (product, audience, archetype, page's single job); (2) verbatim instruction block — copy is final/verbatim, section order exact, tokens closed ("do not introduce new palette colors or typefaces"), acceptance criteria = definition of done; (3) signature element + motion notes from Phase 4; (4) questions-not-guesses list ([TK] items, empty image slots). 01-copy is labeled per spec section with element roles (H2/Body/CTA) and repeats the verbatim-only header. 02 is the Phase 2 spec as-is with a mobile note (spec order = single-column order). 03 carries tokens, 2-3 sentence direction, the anti-slop list verbatim, and the asset manifest. 04 rewrites gates 3/4/5 + build requirements as numbered criteria, with pre-filled llms.txt and JSON-LD templates.

## 2. Organic or proven model?

Homegrown. The file says so itself: "_Provenance: page-foundry-native (no direct companion source)._" It is shaped around one tool's observed capabilities (Claude Design as of 2026-07: accepts attachments, extracts design systems from captures, no cross-conversation brand memory — hence "fully self-contained and re-pasteable"). It does not follow any established interchange format: not Stitch's design.md, not W3C design tokens JSON (tokens are prose plus an optional theme.css), not a standard creative brief. That homegrown-ness is mostly a strength — the verbatim-copy protection and gates-as-acceptance-criteria moves are the differentiators and exist in no standard format — but it means zero portability conventions for tools that don't accept multi-file attachments.

## 3. Over-prescription vs. under-specification

**Over-prescribes (constraining tools where they excel):**
- **Closed token set with no new-property branch.** "Do not introduce new palette colors or typefaces" is right for an existing brand; for a first-page property with no theme, the design tool is often better at proposing the system. handoff.md half-acknowledges this ("give it sources rather than descriptions") but only for existing brands. No "propose 2-3 token systems, then we lock one" path.
- **Signature element handed down as a description.** The one distinctive visual idea — the thing Claude Design/Stitch-class tools are best at inventing — arrives pre-decided from Phase 4. Should be an anchor with explicit license: "here is the candidate signature element; propose stronger alternatives that serve the same claim."
- **"Do not add, merge, or reorder sections."** Order and content, yes — that's the conversion contract. But "do not merge" forbids legitimate visual moves (folding a logo strip into the hero band) that change layout, not conversion logic. The rule conflates the message contract (protect) with visual sectioning (the tool's job).
- What it correctly does NOT prescribe: no wireframes, no grids, no component mandates, no pixel specs. The anti-slop list is negative-space constraint, which prunes without prescribing. That part is well-calibrated.

**Under-specifies (things the tool cannot know):**
- **Microcopy voice.** 01-copy is verbatim, but the tool will inevitably generate text not in it: nav labels, form fields, error/empty states, alt text, aria-labels, footer, buttons for flagged-too-long text. No voice rules ship with the package, so tool-generated microcopy is written blind and then fails the post-build voice re-scan (which handoff.md admits "catches real violations often" — this gap is why).
- **Proof integrity rules for the tool.** The integrity gate runs on the *package*, but nothing in the master prompt forbids the *tool* from fabricating: design tools reflexively add "Trusted by" fake-logo strips, star ratings, invented avatars/testimonials, placeholder stats. For a skill whose creed is "no fabricated proof, ever," the single most important instruction to an external generator is missing.
- **Asset slot geometry.** `[IMAGE: description, filename or TK]` carries no dimensions or aspect ratio; the tool designs around the wrong shapes and the render gate fails late.
- **CTA policy as explicit contract.** It lives inside the spec but isn't restated as a numbered non-negotiable in the master prompt the way verbatim-copy is.
- **Per-tool packaging.** The package assumes paste-plus-attachments (Claude Design). Codex/Antigravity want a repo directory; Stitch/Gemini want one file; Open Design varies. No adaptation guidance exists.
- **Return spec.** "Request the HTML or a deployed URL" is one clause; there's no defined format for what comes back or how gate failures are reported back to the tool for revision.

## 4. The acceptance-criteria/gates split — does it survive a real external tool?

The design: gates 1 (conversion, on spec+copy), 2 (voice scan on 01/00), and integrity run pre-delivery; gates 1 re-check, 2 re-scan, and 3/4/5 in full run on the returned asset; 04-acceptance-criteria.md is gates 3/4/5 pre-translated into the builder's definition of done. "A handoff is not done at package delivery; it is done when the returned asset passes the post-build gates." That closing principle is the strongest thing in the file.

Problems on contact:
- **Numbering bug.** handoff.md calls integrity "Gate 6"; in ship-gates.md and SKILL.md, Gate 6 is AI discovery and integrity is Gate 8. Stale cross-reference.
- **Gates 6 (AI discovery) and 7 (measurement) fall through the split.** They're in neither the pre list nor the post list. The llms.txt/schema templates in 04 partially cover Gate 6's inputs, but nothing verifies they landed in the built asset, and measurement (analytics events per the spec) appears nowhere in the handoff-mode criteria at all.
- **Acceptance criteria are regenerated prose, not a template.** "Rewrite the gates as numbered criteria. Examples: ..." means every run re-derives them — drift between runs, and no stable criterion-ID → gate-ID mapping, so a post-build failure can't be mechanically traced to the criterion the builder was given. This cuts against PAI's own "as deterministic as possible" principle.
- **Round-trip ownership is undefined.** When gate 3 fails post-build: does page-foundry patch the HTML (source of truth now diverges from the tool's project) or send a revision request (in what format)? With Claude Design specifically — no cross-conversation memory — a revision session must re-receive the whole package plus a delta; nothing specifies that.
- **Assumes HTML comes back.** Gates 3/4/5 are runnable on Claude Design/Codex output; a tool returning a design file rather than code breaks the post-build half silently.

## 5. What a 10/10 package should contain — concrete manifest

```
handoff/<product>/
├── 00-master-prompt.md        Orientation + the five non-negotiables (verbatim copy, section order, CTA policy, no fabricated proof, criteria = done) + explicit creative license grant (layout, art direction, motion, signature-element alternatives) + questions list
├── 01-copy.md                 Verbatim voice-gated copy per spec section, element roles, image slots WITH dimensions/aspect ratios
├── 02-page-spec.md            Conversion contract: numbered sections, claim/proof/CTA per section, nav policy, single-column order note
├── 03-design-direction.md     Locked tokens OR extraction sources (existing brand) OR "propose, we lock" brief (new property); direction in 2-3 sentences; signature element as anchor-not-mandate; anti-slop list
├── 04-acceptance-criteria.md  Canonical numbered criteria from a fixed template, each tagged with its gate ID (incl. Gate 6 schema/llms.txt embedded-and-verifiable, Gate 7 measurement events)
├── 05-voice-rules.md          Excerpt of voice.md: banned words, register, rhythm — governs any text the tool generates that is not in 01-copy.md
├── 06-return-spec.md          What to hand back (HTML + assets or deployed URL), and the revision-request format used when a post-build gate fails
├── design.md                  Stitch-format single-file compilation of 00-05, generated, for single-prompt tools (see §6)
└── assets/
    ├── theme.css              Machine-readable tokens (custom properties), contrast-verified
    ├── manifest.md            Every file → slot, dimensions, intended treatment, alt text
    ├── llms.txt + schema.jsonld  Pre-filled templates to embed verbatim (moved out of 04 so they are files, not prose)
    └── [logos, screenshots, captures]  Real artifacts only; captures of existing properties for system extraction
```

The two structural changes vs. today: integrity/voice rules become explicit tool-facing inputs (05, and the fabrication ban in 00), and the tool-can't-know side gets heavier while the tool-excels side gets an explicit license grant, inverting the current balance.

## 6. Where a Stitch-format design.md slots in

**One file among several — a compiled view, never the replacement.** Stitch's design.md is a single-file, single-prompt spec (overview, per-section content, style guide) and is exactly the right shape for single-prompt tools (Stitch, Gemini flows, quick Antigravity runs) that can't take the attach-five-files workflow the current package assumes. But the format has no native slots for page-foundry's actual differentiators: verbatim-copy protection, gate-derived acceptance criteria, the proof-integrity ban, or the post-build gate loop. Replacing the package with design.md would flatten the enforcement structure into prose a tool can shrug off, and would create ambiguity about what the post-build gates verify against.

So: 00-05 remain canonical; `design.md` is generated deterministically from them (copy embedded verbatim, tokens inlined from theme.css, the non-negotiables block at the top, criteria as a checklist at the bottom), regenerated on any change and never hand-edited — one source of truth, two projections. This also resolves the multi-tool problem cleanly: attachment-capable tools get the full package, single-prompt tools get design.md, repo-based tools (Codex, Antigravity) get the directory itself with 00-master-prompt.md as the entry instruction.