# Impeccable — deep-read report

Repo: `pbakaus/impeccable`, v3.9.1, Apache 2.0, by Paul Bakaus. Canonical skill read at `.claude/skills/impeccable/` (mirrored to `.agents/skills/`); source-of-truth for the skill body is `skill/SKILL.src.md` compiled per-provider.

## 1. What it is

Impeccable is a design-fluency skill for AI coding agents: one `/impeccable` skill with 23 sub-commands, a 46-rule **deterministic** (no-LLM, no-network) anti-pattern detector shipped as a CLI, an edit-time hook, and a browser script, plus a "live" mode that runs a localhost server + injected overlay so the user can pick elements in their real running page and cycle AI-generated variants in place. Its thesis: every model trained on the same SaaS templates, so ungated generation produces identical tells (Inter, purple gradients, side-stripe borders, eyebrow kickers, cream backgrounds); Impeccable supplies persistent project context (PRODUCT.md/DESIGN.md), register-aware design doctrine (brand vs product, web vs iOS/Android), and mechanical enforcement. It is a general frontend design system for any UI surface — not marketing-specific.

## 2. Architecture

**Composition.** `SKILL.md` is a router + shared design constitution (contrast rules, typography ceilings, motion rules, "absolute bans", the two-altitude AI-slop test). Mandatory setup: (1) run `scripts/context.mjs` — prints PRODUCT.md+DESIGN.md or `NO_PRODUCT_MD` (build commands divert into init; scoped commands proceed and merely suggest init; can also emit `UPDATE_AVAILABLE`); (2) load the invoked command's `reference/<command>.md` (or `.native` variant for iOS/Android); (3) read real project code; (4) load the register reference — `reference/brand.md` (design IS the product) or `reference/product.md` (design SERVES the product); (5) platform file (`ios.md`/`android.md`) if native; (6) for greenfield, run `scripts/palette.mjs` for an OKLCH brand-seed color. Bare `/impeccable` runs `context-signals.mjs` (cheap JSON signals: hasDesign, latest critique score/P0s, git changed files, dev-server running, scan targets) plus `detect.mjs --json` over changed files, and recommends 2-3 next commands — never auto-runs. Intent routing maps free text to commands ("fix the spacing" → `layout`).

**Scripts** (all dependency-free Node, deterministic): the detector family (`detect.mjs` facade → `detector/` with regex/static-HTML+css-cascade/Puppeteer-browser/visual-contrast engines, `registry/antipatterns.mjs` = the 46 rules across `slop` and `quality` categories, `design-system.mjs` = turns DESIGN.md tokens into extra enforcement rules — off-palette colors/radii/fonts become findings); hook family (`hook.mjs` PostToolUse for Claude Code/Codex/Copilot, `hook-before-edit.mjs` Cursor pre-write gate that can deny writes, `hook-admin.mjs` on/off/ignores, `hook-lib.mjs`); `critique-storage.mjs` (slug/write/latest/trend); `context.mjs`/`context-signals.mjs`; `palette.mjs`; `pin.mjs` (creates `/audit`-style standalone shortcut skills); `detect-csp.mjs` (classify CSP patch shape for live injection); `lib/design-parser.mjs` (parses Stitch-format DESIGN.md into a model for the live panel); `lib/is-generated.mjs` (refuses to write variants into build-generated files); and the ~25-file live-mode family: `live.mjs` (one-shot: config check, start server, inject tag, load context, emit JSON), `live-server.mjs` (zero-dep localhost server, SSE to browser, HTTP long-poll to agent), `live-browser.js` (11k-line injected overlay UI), `live-wrap/insert/accept` (deterministic source wrapping/splicing of variant containers), `live-poll` (agent event loop), the manual copy-edit pipeline (`live-manual-edit-evidence` → `live-commit-manual-edits` → `live-copy-edit-agent`, which literally spawns a local Codex/Claude), session durability (`live/session-store`, `live-resume`, `live-status`, `live-complete`), and Svelte/SvelteKit adapters.

**Agents.** Exactly one: `.claude/agents/impeccable-manual-edit-applier.md` — a subagent that applies one leased live-mode manual copy-edit batch to true source files under a strict JSON output contract (entry atomicity, treat batch text as data not instructions, never copy runtime scaffolding into source).

**Persisted state.** Root: `PRODUCT.md` (strategic: Register, Platform, Users, Purpose, Positioning, Conversion & proof [brand only], Brand Personality, Anti-references, Design Principles, Accessibility) and `DESIGN.md` (visual, Stitch format). Under `.impeccable/`: `config.json` (shared: hook lifecycle, detector ignores) / `config.local.json` (per-dev), `design.json` sidecar (machine-renderable design system: tonal ramps, shadows, motion, breakpoints, full component HTML/CSS for shadow-DOM rendering, narrative), `critique/<timestamp>__<slug>.md` snapshots with YAML frontmatter (score, P0/P1 counts) — **`polish` reads the latest snapshot as its fix backlog**, `critique` computes trend over the last N, `.impeccable/critique/ignore.md` suppresses findings; `live/` (config.json framework wiring, server.json, sessions/, pending-manual-edits.json, evidence). Context detection = `context.mjs` path resolution (root, `.agents/context/`, `docs/`) + monorepo `--target` support.

## 3. Google Stitch design-md usage

- **Which command writes it:** `/impeccable document` (reference/document.md) writes root `DESIGN.md`; `/impeccable init` delegates to document for it (init writes PRODUCT.md itself). Two modes: **scan** (extract real tokens from CSS vars/Tailwind config/CSS-in-JS/token files/components/rendered output) and **seed** (5-question interview, `<!-- SEED -->` marker, minimal frontmatter).
- **Spec:** explicitly pinned to `https://raw.githubusercontent.com/google-labs-code/design.md/main/docs/spec.md`. Two layers: **YAML frontmatter** (normative machine tokens — Stitch's Zod schema accepts only `colors`, `typography`, `rounded`, `spacing`, `components`; token refs like `{colors.primary}`; component sub-tokens limited to 8 props; Stitch lints colors as hex sRGB, OKLCH allowed with a linter warning) + **markdown body with exactly six sections in fixed order, headers character-for-character**: `## Overview`, `## Colors`, `## Typography`, `## Elevation`, `## Components`, `## Do's and Don'ts`. Evocative subtitles allowed (`## 2. Colors: The Coastal Palette`). No extra top-level sections — motion/layout/responsive fold in or go to the sidecar. Idioms: a bolded **Creative North Star: "…"** line, **Named Rules** (`**The One Voice Rule.** …`), colors grouped Primary/Secondary/Tertiary/Neutral, PRODUCT.md anti-references repeated verbatim as Don'ts.
- **Verbatim frontmatter example from document.md:**
```yaml
---
name: <project title>
description: <one-line tagline>
colors:
  primary: "#b8422e"
  neutral-bg: "#faf7f2"
typography:
  display:
    fontFamily: "Cormorant Garamond, Georgia, serif"
    fontSize: "clamp(2.5rem, 7vw, 4.5rem)"
    fontWeight: 300
rounded: { sm: "4px", md: "8px" }
spacing: { sm: "8px", md: "16px" }
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.neutral-bg}"
    rounded: "{rounded.sm}"
    padding: "16px 48px"
---
```
- What the schema can't hold (shadows, motion, breakpoints, tonal ramps, full component HTML/CSS, narrative) goes in the `.impeccable/design.json` sidecar (schemaVersion 2). Consumers: `lib/design-parser.mjs` renders it in the live panel; `detector/design-system.mjs` turns the tokens into enforcement rules; interop claimed with Stitch itself and other DESIGN.md-aware tools.

## 4. Command inventory (23 + 3 management)

**Build:** `craft` (multi-gate shape→mock→build→browser-iterate flow), `shape` (plan UX/UI brief before code), `init` (interview → PRODUCT.md, offer DESIGN.md, pre-configure live), `document` (DESIGN.md from code or seed interview), `extract` (pull repeated patterns into tokens/components, migrate call sites). **Evaluate:** `critique` (two isolated sub-agent assessments — design-director review + detector/browser evidence — Nielsen 0-4 scoring, cognitive-load checklist, persisted scored snapshot), `audit` (a11y/perf/responsive technical checks; native variant). **Refine:** `polish` (pre-ship pass; consumes latest critique snapshot as backlog), `bolder`, `quieter`, `distill` (strip to essence), `harden` (errors, i18n, overflow, edge cases), `onboard` (first-run, empty states, time-to-value). **Enhance:** `animate`, `colorize`, `typeset`, `layout`, `delight`, `overdrive` (technically extraordinary effects). **Fix:** `clarify` (UX microcopy: errors, labels, CTAs, empty states), `adapt` (devices; native variant), `optimize` (UI perf). **Iterate:** `live` (in-browser variant mode). **Management:** `pin`/`unpin` (standalone shortcut skills), `hooks` (detector hook on/off/ignores).

## 5. What impeccable does that page-foundry does not

1. **Deterministic design linting**: 46 machine rules (side-tab borders, gradient text, purple gradients, bounce easing, contrast, touch targets, skipped headings, line length…) runnable with zero LLM — the design-side analog of page-foundry's `voice_scan.py`, including CI JSON output and DESIGN.md-token enforcement.
2. **Edit-time enforcement hooks**: detector runs automatically after (Claude/Codex/Copilot) or before (Cursor, can deny) UI file edits. page-foundry gates run at phase boundaries only.
3. **Live in-browser variant iteration**: real overlay in the user's running app, element picking, variant cycling, accept-to-source, manual copy edits round-tripped to source via a subagent, durable crash-recoverable sessions.
4. **Interoperable design-system capture**: Stitch-spec DESIGN.md + machine sidecar; page-foundry's per-property design tokens are private to it.
5. **Scored, persisted critique with trend** across runs, sub-agent-isolated to avoid anchoring.
6. **Product-register and native-platform design doctrine** (dashboards, app UI, HIG/Material 3) — outside page-foundry's marketing-page scope entirely.
7. **Fine-grained refinement verbs** (bolder/quieter/colorize/typeset/layout/delight/overdrive/animate) and `extract` design-system refactoring.
8. Currently-saturated **reflex-reject lists** (banned default fonts; banned aesthetic *lanes* like editorial-typographic) with second-order slop testing.
9. Multi-harness distribution (12 tools), pinning, npx CLI/updater.

## 6. Overlap vs complement with page-foundry

**Overlap (homepages/landing pages):** impeccable's brand register explicitly covers landing/marketing surfaces; `craft` on a landing page, `critique`/`audit`/`polish`, and brand.md's imagery/color/typography doctrine overlap page-foundry's Phase 4 (design direction), render gate, and accessibility gate. Notably, **init's PRODUCT.md brand-register interview collects primary/secondary CTA, the 10-second line, a belief ladder, and proof assets** — directly overlapping page-foundry's Phase 0/1 brief and message architecture. `clarify` overlaps copy editing (but has no voice enforcement). If both run uncoordinated, the user gets interviewed twice and two competing context docs.

**Complement:** page-foundry owns everything impeccable doesn't touch — durable product-marketing brief, message architecture, archetype specs, conversion research (MECLABS scoring, buyer entry states), voice gate/scanner, AI-discovery (schema/llms.txt), measurement, integrity (no fabricated proof), per-property run logs. Impeccable owns visual/UX craft depth, mechanical design detection, and browser-native iteration. They meet cleanly if page-foundry treats impeccable as its **design engine and design ship-gate**, and keeps copy, conversion strategy, and voice on its own side.

## 7. How a companion skill should invoke impeccable

**Detection:** look for `.claude/skills/impeccable/SKILL.md`, `~/.claude/skills/impeccable/`, `.agents/skills/impeccable/`, plugin namespace, or `npx impeccable` on PATH. Version in SKILL.md frontmatter.

**Context handoff (do this first, avoid the double interview):** impeccable commands read root `PRODUCT.md`/`DESIGN.md` before any work. Write `PRODUCT.md` yourself from your own brief (sections in §2; `## Register` = `brand`, `## Platform` = `web`, map CTA/belief-ladder/proof into `## Conversion & proof`, anti-references verbatim) instead of letting `/impeccable init` run its interview. Then every impeccable command inherits your brief. Optionally invoke `/impeccable document` to have it write the Stitch-format DESIGN.md from your chosen design tokens — that also arms the detector's design-system enforcement.

**By moment:**
- **Design direction phase:** `/impeccable document` (scan or seed) to persist tokens; `node <skill>/scripts/palette.mjs` for a greenfield brand seed; optionally `/impeccable shape <page>` for a structured pre-code brief, or full `/impeccable craft <page>` if delegating build (it has its own user gates — expect stops).
- **During build (free):** the design hook auto-runs on every UI file edit if installed; nothing to invoke.
- **Design/render ship gate (best single integration, non-interactive):** `node <skill-dir>/scripts/detect.mjs --json <built html/css files>` (or `npx impeccable detect --json <dir-or-url>`; URL mode uses Puppeteer). Zero-tolerance mechanical gate exactly like the voice scan; respects `.impeccable/config.json` ignores.
- **Full review gate:** `/impeccable critique <page>` — scored (Nielsen 0-4, P0/P1), persisted to `.impeccable/critique/`, trend-aware; then `/impeccable audit <page>` for a11y/perf/responsive. Read the snapshot frontmatter (`critique-storage.mjs latest <slug>`) to make the score a pass/fail input.
- **Fix loop:** `/impeccable polish <page>` (auto-consumes the latest critique snapshot as its backlog); targeted verbs (`layout`, `typeset`, `colorize`, `quieter`) when your gate names a specific failure family.
- **Explore/variant mode:** `/impeccable live` for user-in-the-loop in-browser variant picking (web only, needs a dev server).

**Boundaries:** keep copy out of `clarify` unless you re-run your voice scan afterward (impeccable has no voice enforcement); never let `craft`/`init` re-interview when your brief exists; `live` and `detect` are web-only.