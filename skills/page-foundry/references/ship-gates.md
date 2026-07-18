# Ship Gates

Run every gate. Report results as a pass/fail table plus the MECLABS score. A failed gate means fix and re-run, not ship with a caveat.

Handoff mode: gates 1, 2, and 8 run before the package is delivered; gates 3, 4, 5, 6, and 7 become acceptance criteria in the package and run in full when the built asset comes back, along with a re-run of 1 and 2 on the rendered page. Details in `references/handoff.md`.

## Gate 1: Conversion audit

- [ ] 5-second test passes on a cold read (headline + subhead + CTA label only).
- [ ] Primary headline within budget (target under ~44 chars, ceiling 70).
- [ ] Exactly one primary CTA action on the page; repeats are identical in wording and destination.
- [ ] Every CTA instance has a proof element within one viewport.
- [ ] campaign-landing only: no site navigation, hero language matches the traffic source.
- [ ] Forms: every field beyond name/email has a written justification in the spec.
- [ ] MECLABS heuristic scored independently. The builder records its own score first, from full context. The score of record then comes from a fresh agent given exactly two inputs: the page as a visitor meets it (build mode: the rendered page; handoff mode: the package's verbatim copy pre-delivery, the returned build on the re-run) and the brief. Never the spec, the drafting context, or the self-score. The fresh agent invokes cro when installed, and scores from the rubric in conversion-rules.md otherwise; either way it works cold, which is the condition the visitor is in. `conversion-audit.md` records both scores and the divergence. A page that scores well only for its own author depends on context a cold visitor lacks, which is the exact failure the heuristic measures, so a wide gap is a finding about the page. When the environment offers no way to open a fresh context, the self-score stands and the Notes column says the audit was not independent.
- [ ] Flagged factors in the independent score (M/V/I low, F/A high) addressed or explicitly accepted.
- [ ] Red-team read: one simulated skeptical reader per segment x entry state from the brief walks the page; every reader must reach the CTA. Any "not for me" exit by a qualified reader is a failure (conversion rule 10). Log bounce points and fix.
- [ ] Anti-template check: this page's skeleton (the job order plus axis settings the spec records) compared against the `skeleton` lines of the property's last three runs in `foundry-log.md`. A match backed by `conversion data` on the matched run passes: converged because it converts. A match with no conversion data behind it is flagged, and the flag resolves one of two ways: the spec shows why this buyer's objection map landed on the same structure, or the skeleton goes back to Phase 2. No prior log for the property: N/A.

## Gate 2: Voice

- [ ] `python3 scripts/voice_scan.py <files>` returns zero FAILs (banned phrases, em/en dashes in prose).
- [ ] Pattern pass done: every `AI language pattern` WARN resolved or accepted with a recorded reason (negative parallelism "not X, it's Y", copula avoidance "serves as", tailing negation "no X, no Y", significance inflation, authority trope, three-verb-clause runs, parallel-list uniformity). The patterns are deliberately WARN, not FAIL; an accepted WARN carries its reason on the `humanizer` line. **The humanizer skill was invoked once on the final copy, the rewrites that survived meaning arbitration applied, and that is recorded on the `humanizer` line below.** Humanizer proposes; meaning arbitrates: a rewrite that changes what a sentence claims is a defect, not a fix, and a second humanizer pass chasing zero tells is over-processing, not rigor. The scanner passing is necessary but not sufficient: structural uniformity across separate elements (a parallel roster) is beyond regex, so a scanner PASS with no humanizer pass is an incomplete Gate 2, not a clean one. Final copy means final: any copy edit after the pattern pass (a red-team fix from Gate 1, a build-time cut, a late rewrite) re-triggers the scan and the humanizer on the edited sections before this gate reports PASS.
- [ ] Verbatim-copy diff done: the built page's rendered text diffed against the approved-copy snapshot (build mode: `copy-approved.md`, written at the end of Phase 3; handoff mode: the package's `01-copy.md`, when the built asset comes back). Every snapshot sentence appears in the build verbatim; any wording change went back through the Phase 3 re-trigger and the snapshot was rewritten from the re-scanned copy; prose the build introduced (button labels, microcopy, alt text) was scanned the same way. Drift that ships, or a snapshot edited to match a drifted build, fails this gate.
- [ ] Read-aloud pass done: no sentence the owner would not say to a client across a table.
- [ ] No fabricated specificity: every number and name traces to the proof inventory, and every quote is checked by search, not by memory. Extract each quoted string and testimonial from the rendered page and search `voc.md` for it: the quote must appear character for character in the Verbatim section, or in the brief's proof inventory for proof the buyer handed over directly. A quote the search cannot find does not go on the page.

## Gate 3: Accessibility (WCAG 2.2 AA spot checks)

- [ ] One `h1`; heading levels do not skip.
- [ ] Landmarks present (`nav`, `main`, `footer`); links and buttons are real `a`/`button` elements; icon-only controls carry an `aria-label`.
- [ ] Text contrast 4.5:1 (3:1 for large text and UI components); CTA buttons included.
- [ ] Visible keyboard focus on all interactive elements (`:focus-visible`), logical tab order, and focus never obscured (WCAG 2.2 SC 2.4.11).
- [ ] Touch targets at least 24x24px (WCAG 2.2 SC 2.5.8); 44px preferred for primary actions.
- [ ] Every informative image has real alt text and explicit `width`/`height` (CLS); decorative images have empty alt.
- [ ] No content conveyed by color alone; `prefers-reduced-motion` respected; motion animates only `transform`/`opacity`, never `transition: all`.
- [ ] Form inputs have programmatic labels plus correct `type`/`inputmode`/`autocomplete`; async status changes use `aria-live`.
- [ ] If the page has auth, no step forces a memory or transcription test with no easier alternative (WCAG 2.2 SC 3.3.8).

## Gate 4: Performance

- [ ] Total transfer under ~1MB; CSS+JS under ~200KB.
- [ ] Images sized to display dimensions, modern formats (WebP/AVIF), lazy-loaded below the fold.
- [ ] Fonts: system stack, or at most two self-hosted files, preloaded, `font-display: swap`.
- [ ] No render-blocking third-party scripts; analytics deferred.
- [ ] Target: LCP under ~2s on a mid-range phone. If a Lighthouse run is possible in the environment, run it and record the score.

## Gate 5: Render review

- [ ] Render the page and look at it: screenshot at 390px and 1440px via Playwright, headless Chrome, or gstack `/design-review` when available. Critique the screenshots against the chosen design direction, the anti-slop list, and (when installed) the web-design-guidelines rules; fix anything a cold viewer would flag in five seconds (cramped hero, wall of gray, broken wrap, invisible CTA).
- [ ] Design detect scan: with impeccable installed, run its detector over the built HTML and CSS (`node <impeccable skill dir>/scripts/detect.mjs --json pages/<product>/`, or `npx impeccable detect --json`), from the product's repo root so the property's `.impeccable/config.json` ignores and `DESIGN.md` token enforcement apply; a persisted `DESIGN.md` makes off-palette colors, radii, and fonts findings, which is why Phase 4 step 6 wrote it. The scan prints an empty JSON array and exits 0 when clean, a findings array and a non-zero exit otherwise; the findings list is the array. Resolve every entry one of two ways: fix the page, or accept the finding into the product's `.impeccable/config.json` under `detector.ignoreValues` with a `reason`. That file is the per-property accepted-findings record, and an ignore without a reason is a suppressed finding, not an accepted one. The `impeccable` evidence line carries the finding count, what was fixed, and each accepted finding with its reason. Without impeccable, critique the built page against the anti-slop list in `references/design-direction.md` instead and mark the scan degraded.
- [ ] A clean scan is a floor, never a verdict (impeccable's own doctrine, adopted whole): zero findings means no known tell fired, not that the design is good. The screenshot critique above still runs in full, and an accepted finding is a recorded style choice, not a waived check.
- [ ] If no render tool exists in the environment, mark the screenshot review N/A in the report and tell the user to eyeball both widths before deploy; the detect scan is static and runs regardless. Never silently skip either; an unrendered page is unreviewed design.

## Gate 6: AI discovery and meta

- [ ] JSON-LD schema present and valid for the archetype (templates below).
- [ ] `llms.txt` present at the site root (template below).
- [ ] `robots.txt` does not `Disallow` the AI crawlers that drive citations: `GPTBot`, `ChatGPT-User`, `PerplexityBot`, `ClaudeBot`, `anthropic-ai`, `Google-Extended`, `Bingbot`. Blocking one loses that engine's citation; only `CCBot` is safe to block. An AI-discovery gate that passes while `ClaudeBot` is disallowed is a false pass.
- [ ] Page copy is machine-extractable: the answer block the Phase 2 spec placed survived the build as a self-contained 40 to 60 word block near the top, key facts are in real text (not baked into images), and comparisons/FAQs use plain markup. This gate verifies the spec's block; discovering at ship time that no block was specced is a Phase 2 defect, not something to retrofit here.
- [ ] For archetypes with public pricing (pricing-page, saas-homepage, course-sales, membership-community, docs-dev-tool-landing), the machine-readable `/pricing.md` (or `/pricing.txt`) the Phase 2 spec drafted is present for agentic buyers.
- [ ] `<title>` and meta description written to the same standard as page copy (voice rules apply), and short enough not to truncate.
- [ ] Open Graph + Twitter card meta complete, with a real OG image (1200x630).
- [ ] Canonical URL set; favicon present.

Note: Google does not consume `llms.txt`; it helps ChatGPT, Claude, and Perplexity. Keep it, and do not rely on it for Google.

## Gate 7: Measurement

- [ ] Conversion event wired as the Phase 2 spec defined it: the form destination (ESP, endpoint) records source/medium, or the user has consciously declined measurement. A spec with no measurement plan is a Phase 2 defect; this gate verifies, it does not invent measurement after the build.
- [ ] The spec's UTM convention stated for every planned traffic source, so campaign performance is attributable from day one.
- [ ] Analytics: privacy-respecting option (Plausible, GoatCounter, or server logs) wired or consciously declined. A gauge-interest page without measurement cannot gauge interest.

## Gate 8: Integrity

- [ ] Zero fabricated testimonials, logos, counts, or statistics. For quotes this check is mechanical: rerun the Gate 2 search with integrity's question. A page quote matching a `voc.md` Paraphrase entry is a paraphrase wearing quotation marks; a quote matching nothing was invented. Both are fabricated attribution, whoever wrote the words.
- [ ] Zero fabricated technical artifacts or staged scenarios: (a) every command, terminal output, code snippet, config, and file path is real and runnable exactly as shown, or removed; and (b) every terminal, screenshot, console, or UI depicts a real action the user takes and real output they see. Real data in a styled card (the page's own gate report) is fine; a terminal of a script the user never runs is not, even if the script is real. A demo of the product is held to this.
- [ ] All `[TK]` placeholders resolved: filled with real material, or the section cut.
- [ ] Any urgency element (deadline, cap) verified real with the user.
- [ ] Security/privacy claims substantiated by the brief.

---

## Templates

### llms.txt

Place at `/llms.txt`. Markdown, written in the same plain voice as the page.

```markdown
# {Product Name}

> One-sentence factual description: what it is, who it is for, what it does.

{2-4 sentences of plain factual detail: core capabilities, platform, pricing model, license if OSS.}

## Links

- [Homepage]({url})
- [Documentation]({docs-url})
- [Pricing]({pricing-url})
- [Source]({repo-url})  <!-- OSS only -->

## Facts

- Built by: {person/company}
- Platform: {web / iOS / Android / CLI / self-hosted}
- Pricing: {model, starting price, free tier, or license}
- Data handling: {one factual sentence}
```

### JSON-LD by archetype

Wrap in `<script type="application/ld+json">` in `<head>`. Fill only fields with real values; omit anything unknown rather than inventing it.

**saas-homepage / mobile-app** (`SoftwareApplication`):

```json
{
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  "name": "{Product}",
  "description": "{factual one-liner}",
  "url": "{url}",
  "applicationCategory": "{e.g. SecurityApplication, BusinessApplication}",
  "operatingSystem": "{Web, iOS, Android}",
  "offers": {
    "@type": "Offer",
    "price": "{0 or starting price}",
    "priceCurrency": "USD"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "{real only}",
    "ratingCount": "{real only}"
  },
  "publisher": { "@type": "Organization", "name": "{Company}", "url": "{company-url}" }
}
```

Omit `aggregateRating` entirely unless the numbers are real and public.

**oss-project** (`SoftwareSourceCode`):

```json
{
  "@context": "https://schema.org",
  "@type": "SoftwareSourceCode",
  "name": "{Project}",
  "description": "{factual one-liner}",
  "codeRepository": "{repo-url}",
  "programmingLanguage": "{language}",
  "license": "https://spdx.org/licenses/{SPDX-ID}",
  "author": { "@type": "Person", "name": "{maintainer}" }
}
```

**campaign-landing with FAQ section** (add alongside the page's primary type):

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "{question as it appears on the page}",
      "acceptedAnswer": { "@type": "Answer", "text": "{answer as it appears on the page}" }
    }
  ]
}
```

FAQ schema must mirror the visible page content exactly; do not add schema-only Q&A.

**event-webinar / course-sales / membership-community / dated campaign-landing** (`Event`; use for a page registering or selling a scheduled session, cohort, workshop, or live event; the event-webinar contract's Phase 2 spec supplies these values, real only):

```json
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": "{Event}",
  "description": "{factual one-liner}",
  "startDate": "{ISO 8601, e.g. 2026-09-01T17:00-07:00}",
  "endDate": "{ISO 8601}",
  "eventAttendanceMode": "https://schema.org/OnlineEventAttendanceMode",
  "eventStatus": "https://schema.org/EventScheduled",
  "location": { "@type": "VirtualLocation", "url": "{join or info url}" },
  "organizer": { "@type": "Organization", "name": "{Company}", "url": "{url}" },
  "offers": {
    "@type": "Offer",
    "price": "{price}",
    "priceCurrency": "USD",
    "url": "{registration url}",
    "availability": "https://schema.org/InStock"
  }
}
```

Omit `endDate` and `offers` fields you cannot fill with real values; never invent a date, price, or seat count.

**ecommerce-product** (`Product`; the buy box's machine-readable twin; the Phase 2 spec supplies real values only):

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "{Product}",
  "description": "{factual one-liner}",
  "image": ["{real product photo urls}"],
  "sku": "{sku}",
  "brand": { "@type": "Brand", "name": "{Brand}" },
  "offers": {
    "@type": "Offer",
    "price": "{price}",
    "priceCurrency": "USD",
    "availability": "https://schema.org/InStock",
    "url": "{product url}"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "{real only}",
    "reviewCount": "{real only}"
  }
}
```

Omit `aggregateRating` unless the store's review system produced the numbers; `availability` states the actual stock state, and the schema price always matches the visible buy box.

**homepage / personal-home** (optional, add alongside the primary type): a `WebSite` with `potentialAction` SearchAction when the site has search, and a standalone `Organization` (name, url, logo, sameAs social links) so the brand resolves as an entity.

### Gate report format

```
## Ship gates: {product} / {archetype}

{when any core companion was overridden at preflight, open with the banner: "PARTIAL RUN: built without {names}; this output is a draft, not a page-foundry page". Omit the line entirely on full runs.}

| Gate | Result | Notes |
|---|---|---|
| Conversion audit | PASS | MECLABS C = {n} (M{n} V{n} I{n} F{n} A{n}), independent; self C = {n}, divergence {n} |
| Voice scan | PASS | 0 hits across {n} files |
| Accessibility | PASS | |
| Performance | PASS | {transfer size}, {LCP if measured} |
| Render review | PASS / N/A | {widths checked; detect findings fixed/accepted; or why the screenshot half was N/A} |
| AI discovery | PASS | schema valid, llms.txt present |
| Measurement | PASS | {conversion event, UTM, analytics or declined} |
| Integrity | PASS | {n} TK items resolved/cut |

Companion evidence — one line per companion in scope this run, each filling the EVIDENCE
column of its table row: what ran, the artifact it wrote, what changed because of it.
A companion with no line here and no artifact on disk was not invoked, whatever the
transcript says. The seven core lines always appear; an overridden core companion's
line reads "PARTIAL: overridden at preflight".

- product-marketing: {invoked, brief written, fields the interview still had to supply}
- customer-research: {invoked, voc.md written, {n} verbatim quotes, every one carrying a source; {k} themes ranked, the top theme named with its confidence}
- marketing-psychology: {invoked, persuasion-map.md written, levers applied and where}
- cro: {invoked at spec and at Gate 1; Gate 1 run in a fresh context on the rendered page and brief alone; conversion-audit.md written with both scores and the divergence; spec changes applied}
- copywriting: {invoked, sections drafted, headline candidates scored}
- frontend-design: {invoked, tokens persisted, alternatives considered}
- humanizer: {invoked once on final copy — yes/no; one line on what it changed (e.g. "broke two three-verb runs, varied a 6-item roster"); accepted WARNs, each with its reason; re-runs triggered by post-pass edits, if any; or "not run" which makes Gate 2 incomplete}
- copy-editing: {changelog summary — what was cut, what was tightened; or "skipped (degraded)"}
- {one line per enhancer whose seam was in scope: analytics, ai-seo, schema, competitor-profiling (when the brief named alternatives), web-design-guidelines (live ruleset or frozen fallback), impeccable (which commands ran; at Gate 5 the detect finding count, fixes, and each accepted finding with its reason), remotion, gstack (which commands ran), and the archetype companions (pricing, competitors, aso, launch, lead-magnets, popups, signup) when their section is on the page. In scope but skipped reads "skipped (degraded: missing)" or "skipped (declined at preflight)"}

Degraded phases: {any phase that ran on a reference-file fallback because its companion was missing or declined, named with the companion it lacked; core-tier overrides prefixed PARTIAL:; "none, all companions present" otherwise. A degraded run is a partial execution, and the owner is told which skill would improve it.}

Open items for the owner: {real proof to collect, urgency to verify, etc.}
```

---

_Provenance: reconciled 2026-07-07 against marketingskills 2.3.0 (ai-seo, schema, cro) and web-design-guidelines (vercel-labs, live ruleset). JSON-LD templates verified current against schema.org; accessibility bumped to WCAG 2.2 AA. The MECLABS heuristic is external (rubric in conversion-rules.md), not from the cro companion. Re-reconcile when those companions or the schema.org / WCAG baselines change._
