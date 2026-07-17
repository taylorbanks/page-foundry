# Google Stitch DESIGN.md — research report

Sources: `stitch.withgoogle.com/docs/design-md/*` is a JS SPA that returns no content to fetchers; the canonical spec source is the open-source repo **google-labs-code/design.md** (Apache 2.0, published to npm as `@google/design.md`, version "alpha"). I pulled `docs/spec.md` (generated from `spec.mdx`, the normative source), `README.md`, `PHILOSOPHY.md`, the three official examples, and the linter source tree. Local impeccable files read in full.

## 1. The format spec

**File layout:** one file, `DESIGN.md` at project root. Two layers:

1. **YAML frontmatter** (optional, `---` fenced) — machine-readable design tokens. Token system is explicitly "inspired by" the W3C DTCG format: typed token groups + `{path.to.token}` reference syntax. Round-trips to tokens.json, Figma variables, Tailwind configs via the CLI's `export` command.
2. **Markdown body** — human-readable rationale in `##` sections. An optional `#` H1 is allowed for titling but is not parsed as a section.

**Normativity rule:** "The tokens are the normative values; the prose provides context for how to apply them." Prose may use descriptive names ("Midnight Forest Green") mapping to systematic token names (`primary`).

**Frontmatter schema (verbatim from spec):**

```yaml
version: <string>          # optional, current version: "alpha"
name: <string>
description: <string>      # optional
colors:
  <token-name>: <Color>          # ANY valid CSS color: hex, named, rgb()/hsl()/hwb(), oklch()/oklab()/lch()/lab(), color-mix()
typography:
  <token-name>: <Typography>     # fontFamily, fontSize, fontWeight, lineHeight, letterSpacing, fontFeature, fontVariation
rounded:
  <scale-level>: <Dimension>     # px | em | rem
spacing:
  <scale-level>: <Dimension | number>
components:
  <component-name>:
    <token-name>: <string|token reference>
```

- Component property tokens are limited to 8: `backgroundColor`, `textColor`, `typography`, `rounded`, `padding`, `size`, `height`, `width`. Unknown props "accept with warning".
- Variants are naming convention, not schema: `button-primary`, `button-primary-hover`, `button-primary-active` as sibling keys.
- References must point to primitives (`{colors.primary-60}`), except inside `components`, where composite refs (`{typography.label-md}`) are allowed.
- Colors: hex is "recommended default", but wide-gamut formats are fully supported; all are internally converted to sRGB for WCAG contrast checking, original format preserved.

**Body sections — eight, fixed order, omittable but never reordered (all `##`):**

```markdown
## Overview            (alias: "Brand & Style")     — brand personality, audience, emotional register; fallback context when no token/rule applies
## Colors              — palettes + roles; at minimum a `primary` palette required; convention: primary/secondary/tertiary/neutral
## Typography          — levels (typ. 9–15), roles; convention: display/headline/body/label/caption × sm/md/lg
## Layout              (alias: "Layout & Spacing")   — grid model, spacing scale, containment strategy
## Elevation & Depth   (alias: "Elevation")          — shadows OR the flat-design alternative (tonal layers, borders); state it explicitly
## Shapes              — corner-radius language ("Architectural Sharpness, 4px everywhere")
## Components          — buttons, chips, lists, tooltips, checkboxes, radios, inputs + domain-specific atoms; spec notes this part is "actively evolving"
## Do's and Don'ts     — forceful guardrail bullets ("Do use primary on only one action per screen")
```

**Consumer behavior for unknown content (the interop contract):** unknown section headings → preserve, no error; unknown token names → accept if value valid; unknown component property → accept with warning; duplicate section heading → **error, reject file**. The linter (`npx @google/design.md lint`) runs nine rules: `broken-ref` (error), `missing-primary`, `contrast-ratio` (WCAG AA 4.5:1 on component fg/bg pairs), `orphaned-tokens`, `missing-typography`, `section-order`, `unknown-key` (all warnings), `token-summary`, `missing-sections` (info). CLI also does `diff` (token-level regression detection, exit 1 on regression), `export` (Tailwind v3 JSON, Tailwind v4 `@theme` CSS, DTCG tokens.json), and `spec` (prints the spec for injection into agent prompts — a deliberate agent-bootstrapping affordance).

## 2. Philosophy

`PHILOSOPHY.md` is unusually explicit:

- **"Prose, not Tokens, is the focus."** "The quality of a generated design is determined less by the precision of its values than by how clearly the intent is described." Token values are *context*, "not rendering instructions"; the spec deliberately refuses to become a rendering pipeline ("not trying to reinvent the decades-long work" of CSS/design-token tooling).
- **Specific reference > adjectives.** "A 1970s graduate lecture handout" carries more than "modern, clean, trustworthy, premium" — "Adjectives describe a region. A specific reference describes a point."
- **Negative constraints ride along with a strong reference**; the Do's/Don'ts section is for the intentional remainder, and a long rambling don't-list signals the description was too vague.
- **Open by design:** the spec standardizes only the universal minimum (colors, typography, spacing, rounded, components). Motion, iconography, elevation tokens, breakpoints etc. are yours to add as custom sections/YAML blocks — "The format accepts any key, any section, any structure your design system needs," and the linter stays silent on custom extension keys. Google's own philosophy example shows a custom `## Motion` section with its own fenced `motion:` YAML inside the body.
- **What it deliberately leaves to the design tool:** actual layout composition, page structure, content, rendering, framework choice, component implementation. It's a *style contract*, not a page spec.

## 3. Who consumes it

- **Stitch itself** — import/export per project; validates via the same linter; Stitch's generated DESIGN.md files use evocative subtitles and "Named Rules".
- **The `@google/design.md` CLI/linter** — lint/diff/export/spec, JSON output designed for agents to act on.
- **Any coding agent, by design** — the format is pitched as agent-readable context for Claude Code, Cursor, v0, Gemini CLI etc.; the "DESIGN.md workflow" (Stitch → DESIGN.md → Claude Code) is an emerging community pattern. Open-sourced ~April 2026 under Apache 2.0 with explicit "become the OpenAPI of design systems" framing.
- **Community:** VoltAgent/awesome-design-md (~70 brand-inspired DESIGN.md files), impeccable, skill-rest, and DTCG/Tailwind pipelines via export.

## 4. How impeccable implements it (document.md), with deviations

impeccable's `/impeccable document` generates a spec-conformant `DESIGN.md`: staged frontmatter (colors/typography/rounded/spacing/components, `{token}` refs, 8-prop component limit honored), exact-header discipline, "Named Rules" (`**The One Voice Rule.** ...`), forceful design-director voice, PRODUCT.md anti-references carried verbatim into Do's and Don'ts, plus scan mode (extract from CSS vars/Tailwind/theme files/rendered output) vs seed mode (5-question interview, `<!-- SEED -->` marker, minimal frontmatter, no sidecar).

**Deviations/extensions worth knowing:**

- **Six sections, not eight.** impeccable mandates exactly `Overview / Colors / Typography / Elevation / Components / Do's and Don'ts` and explicitly forbids a Layout section ("The spec does NOT have a Layout section... The spec has six, not nine"). **The actual published spec has eight, including `## Layout` and `## Shapes`**, and Google's own totality-festival example uses `Brand & Style`, `Layout & Spacing`, and `Shapes`. impeccable also forbids adding custom top-level sections, which contradicts both the spec's "preserve unknown sections" rule and PHILOSOPHY's "any section you need." impeccable appears to track an earlier/stricter Stitch-app profile.
- **"Hex sRGB only" claim is stale.** impeccable says Stitch validates hex only and OKLCH triggers a warning; the published spec accepts every CSS color format including `oklch()` and `color-mix()`.
- **The `.impeccable/design.json` sidecar** (schemaVersion 2) is a pure extension: tonal ramps, shadows, motion, breakpoints, full self-contained HTML/CSS component snippets for shadow-DOM rendering, and a `narrative` block (north star, rules, dos/donts) — everything the 8-prop component schema can't hold. Under the current spec, most of this could legally live in custom body sections instead; impeccable chose a sidecar because it also feeds a live preview panel.
- impeccable folds Elevation-alternative content per spec intent and enforces "frontmatter is normative, never restate a value in prose" — that part matches the spec exactly.

## 5. Honest assessment: de-facto standard or Google-specific?

**Worth adopting, with eyes open.** For it: Apache-2.0 spec with a real published linter/exporter on npm, DTCG-aligned token model, deliberately tool-agnostic ("between different AI agents and tools" is in sentence one of the spec), genuine community traction (awesome-design-md, third-party skills, the Stitch→Claude Code workflow write-ups), and — critically for your use case — it's *exactly* the right shape for LLM consumers: prose-primary, tokens-as-context, graceful-degradation rules for unknown content. Claude Design, Codex, and Gemini can all read it today with zero integration work; Gemini-family tools will increasingly expect it. Against it: version "alpha" with an explicit "expect changes" warning; the Components section is admitted to be immature; Google controls the spec; the only conformance tooling is Google's; and ecosystem behavior already diverges from spec text (impeccable's 6-vs-8 sections shows profile drift in the wild). Verdict: adopt it as the **design-system layer** of a handoff package — it costs almost nothing (it's markdown + YAML you'd write anyway), it's linter-verifiable (`lint` exit codes slot straight into a ship gate), and it's the only candidate with any cross-tool gravity. Target the published spec (8 sections, permissive extensions), not Stitch-app folklore, and pin `version: alpha` so future spec bumps are detectable via `diff`.

## 6. What a marketing-page handoff needs that DESIGN.md does not carry

DESIGN.md is a style contract only. It has **no concept of a page**. A page-foundry handoff package would need, alongside it:

- **Verbatim copy protection** — DESIGN.md carries zero content. Nothing marks copy as immutable; an agent consuming only DESIGN.md will happily rewrite headlines. Needs a separate copy manifest with per-block "verbatim / adaptable" flags and a mechanical diff check (your voice_scan analog) at acceptance.
- **Page/section structure and hierarchy** — no hero/proof/CTA sequence, no fold contract, no archetype. DESIGN.md's Layout section is spacing philosophy, not information architecture.
- **Conversion contract** — no primary conversion goal, CTA hierarchy, friction/anxiety counters, MECLABS-style scoring hooks, or per-entry-state messaging. "Do use primary color on only one action" is as close as it gets — that's a style rule, not a conversion rule.
- **Proof integrity** — nothing prevents fabricated testimonials, logos, or stats; no provenance field for claims. Needs a proof ledger (claim → source → approval) the design tool must not invent beyond.
- **Acceptance gates** — the linter checks token contrast, not page outcomes. No a11y-on-real-DOM, performance budgets, render review, schema/llms.txt, or measurement plan. Needs explicit acceptance criteria the receiving tool must satisfy before "done".
- **Voice** — DESIGN.md's Overview covers visual/brand personality; it has no lexical rules (banned words, punctuation, register) and no enforcement hook.

Practical composition: `DESIGN.md` (spec-conformant, linted) for the visual system + sibling documents (copy manifest with verbatim locks, page spec/conversion contract, proof ledger, acceptance criteria) — mirroring impeccable's frontmatter+sidecar move, but for content and conversion rather than shadows and motion. Custom body sections could technically carry some of this, but copy protection and gates deserve machine-checkable files, not prose a consumer is free to "preserve without error" and ignore.

**Key local/remote paths:** spec `https://github.com/google-labs-code/design.md/blob/main/docs/spec.md` (cached at `/private/tmp/claude-501/-Users-taylor-projects-page-foundry/07563dd2-b543-4875-9bd8-be3706e99942/scratchpad/designmd/docs-spec.md`, alongside `.-README.md`, `.-PHILOSOPHY.md`, `totality-festival-DESIGN.md`); impeccable at `/private/tmp/claude-501/-Users-taylor-projects-page-foundry/07563dd2-b543-4875-9bd8-be3706e99942/scratchpad/impeccable/.claude/skills/impeccable/reference/document.md` (extract.md is generic design-system extraction, not DESIGN.md-specific).

Sources: [google-labs-code/design.md spec](https://raw.githubusercontent.com/google-labs-code/design.md/main/docs/spec.md) · [README](https://github.com/google-labs-code/design.md) · [PHILOSOPHY.md](https://raw.githubusercontent.com/google-labs-code/design.md/main/PHILOSOPHY.md) · [Google blog: DESIGN.md open-sourced](https://blog.google/innovation-and-ai/models-and-research/google-labs/stitch-design-md/) · [Stitch DESIGN.md docs](https://stitch.withgoogle.com/docs/design-md/format/) · [DESIGN.md workflow with Claude Code](https://www.designsystemscollective.com/the-design-md-workflow-how-google-stitch-claude-code-quietly-changed-the-design-to-code-handoff-c4213f97ed8f) · [Medium: on its way to industry standard](https://medium.com/design-bootcamp/google-makes-design-md-open-source-on-its-way-to-become-a-industry-standard-16119f2368dd)