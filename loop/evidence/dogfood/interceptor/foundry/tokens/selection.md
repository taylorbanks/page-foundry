# tokens/selection.md: Interceptor (Phase 4 selection and shape confirmations)

The design-decision record for Phase 4: which token plan won and why, the per-job shape confirmations with the tokens in hand, and the degraded-seam record. The three candidate plans are `plan-a-instrument-dark.md` (winner), `plan-b-technical-light.md`, and `plan-c-signal-structural.md`. The winning tokens are persisted as `pages/interceptor/theme.css`.

## Companion invocations this phase

- **frontend-design (core, present).** Invoked as the primary path to produce the token plans. It generated three committed directions, each with its own palette, type pairing, grid spec, signature element, and critique against the generic default, differing on real axes rather than as tints of one idea. Its output is the design direction; the reference file was not used to do the work.
- **web-design-guidelines (enhancer, present).** Authoritative on the accessibility, typography, imagery, and interaction mechanics. Its rules are encoded in each plan's mechanics section and in `theme.css` (AA contrast computed against the named hex values, `:focus-visible` rings, 44px targets, `font-display: swap` with `size-adjust`, `aspect-ratio` on media, `prefers-reduced-motion` fallbacks).
- **impeccable (enhancer, absent).** Its Phase 4 seam (step 6 `DESIGN.md` persistence) does not run; see the degraded record below.

## Why Plan A won

The three plans differ on real axes: temperature (A dark-warm, B light, C dark-cool), type contrast (A monospace display, B serif display, C grotesque display), and density (A compressed, B airy, C dense). The selection is grounded in the conversion argument Phase 2 already settled, not in taste alone.

1. **A matches the density axis the contract set.** Phase 2 chose **compressed** density for a free install against already-high motivation. Plan A is the compressed instrument read; Plan C's tile-dense blueprint fights that axis directly, adding visual weight the short persuasion arc does not want. B is airier but still linear, so it is compatible; A is the closest fit.
2. **A matches the brief's register and lever.** The brief mandates a plain, no-marketing-adjectives register, and `persuasion-map.md` makes the pratfall (honest admission) the primary lever. A monospace instrument surface that states its readings, including the one socket limitation given the amber accent in place, is that register and that lever expressed as design. B's editorial serif is credible but reads calmer and more composed than the practitioner voice; C reads as a dashboard, one step further from the tool's own voice.
3. **A is the least slop-prone.** It commits to a single reasoned accent and real data readouts, and its critique rejects every generic default with a stated reason. C starts nearest the dark-neon tell the anti-slop list warns about, and its bento tiles cannot carry the differentiation on their own.

**Plan B is the recorded fallback** if a morning owner wants the page to read as calm documentation rather than as the tool's instrument surface; its source-margin signature is a genuinely strong honesty device worth grafting into A if the comp stage asks for more visible sourcing. **Plan C is the Phase 4.5 bounce target** if the winner fails the comp critique, kept for exactly that purpose.

## Per-job shape confirmations (tokens in hand)

Phase 2 recommended a shape per job from the section-shape lexicon before any tokens existed. This step revisits each with Plan A's tokens in hand. An override would be a recorded decision that knowingly enters the copy-fit re-trigger loop; none was needed, because the compressed monospace-instrument direction supports every recommended shape. Confirming is the default, and the record states that plainly rather than manufacturing an override to look thorough.

| Job / section | Recommended shape (Phase 2) | Phase 4 decision | Note |
|---|---|---|---|
| J1 statement + problem (S1, S2) | One sentence in the buyer's words | Confirm | The mono H1 renders the plain statement well; `text-wrap: balance` holds it at 390px. |
| J2 install (S1) | Install-command block in the hero | Confirm | The code block is the hero focal point; the `›` amber prompt marks it as the CTA. |
| J3 quickstart (S4) | Annotated real command with real output | Confirm | Command in `--surface`, captured output in a nested `--surface-2` pane so input reads apart from result. |
| J4 mechanism (S3) | Terse before-and-after of the CDP surface | Confirm | Renders as a two-column contrast on desktop, stacking on mobile. Execution note, not a shape change: the "removed" state may show `cdp.surface` struck through in mono; still the before-and-after shape. |
| J4 data handling and safety (S5) | Inline callout + short safety list | Confirm | The one socket-limitation callout takes the amber `--signal` rule (1px, not a fat stripe), the single place the accent carries weight, which is the pratfall lever the tokens were built to serve. |
| J5 comparison (S6) | Inline before-and-after + concessions list | Confirm | Compressed density supports the inline contrast over a wide matrix. |
| J6 project status (S9) | Terse status line linking repo and issues | Confirm | A single `--text-dim` line with the `[TK]` stars stated as unknown, not styled as a badge. |
| J8 FAQ leftovers (S10) | An FAQ | Confirm | Plain disclosure-list, no accordion motion required. |
| J9 not-for line (S7) | A not-for list | Confirm | Reads as confidence in the plain register. |
| Close (S11) | One line + install command repeated | Confirm | The install block repeats verbatim; the `›` prompt ties it to the hero instance. |

Every recommended shape is confirmed; zero overrides. The copy-fit pass in DOGFOOD-5b therefore fits copy to the confirmed shapes without a shape-driven re-draft, and any copy edits it makes take the one planned voice-chain re-entry.

## Degraded seam: DESIGN.md not persisted (impeccable absent)

Phase 4 step 6 persists the property's `DESIGN.md` by running `/impeccable document` over the winning tokens, which arms the detector's design-system enforcement at Gate 5. impeccable is absent this run (preflight). The skill's own doctrine is explicit for this case: without impeccable, `theme.css` remains the persisted design record and the step is skipped without substituting anything. So no `DESIGN.md` is hand-written here; substituting one would violate that rule and would arm nothing, since the detector that reads it is also absent. `theme.css` (the winning Plan A tokens, with the grid custom properties beside the palette) is the design record this run, and Gate 5's design detect will run degraded on `references/design-direction.md` and `references/ship-gates.md` rules, named on the gate report. This is recorded on the preflight degraded list already; it is restated here so the Phase 4 output stands on a stated absence, not an omission.

OWNER-REVIEW: the DOGFOOD-5a backlog wording named "DESIGN.md (impeccable absent to degraded, reference-file design-direction rules, recorded)". Resolved to the skill's actual impeccable-absent behavior: the DESIGN.md persistence step is a skipped-degraded seam recorded here and on the gate report, with `theme.css` as the record, rather than a hand-authored DESIGN.md, because the skill forbids substituting for the skipped step. A morning owner rebuild with impeccable installed is the stronger test of this seam.

---
Provenance: selection grounded in the Phase 2 contract (density axis), `product-marketing.md` (register), and `persuasion-map.md` (pratfall lever). Shape confirmations revisit the Phase 2 recommendations with Plan A's tokens; the degraded record follows the impeccable integration doctrine in `skills/page-foundry/SKILL.md`.
