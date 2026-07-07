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
- [ ] MECLABS heuristic scored (rubric in conversion-rules.md); flagged factors (M/V/I low, F/A high) addressed or explicitly accepted.
- [ ] Red-team read: one simulated skeptical reader per segment x entry state from the brief walks the page; every reader must reach the CTA. Any "not for me" exit by a qualified reader is a failure (conversion rule 10). Log bounce points and fix.

## Gate 2: Voice

- [ ] `python3 scripts/voice_scan.py <files>` returns zero hits (banned phrases, em/en dashes in prose).
- [ ] Read-aloud pass done: no sentence the owner would not say to a client across a table.
- [ ] No fabricated specificity: every number, name, and quote traces to the proof inventory.

## Gate 3: Accessibility (WCAG 2.1 AA spot checks)

- [ ] One `h1`; heading levels do not skip.
- [ ] Landmarks present (`nav`, `main`, `footer`); links and buttons are real `a`/`button` elements.
- [ ] Text contrast 4.5:1 (3:1 for large text); CTA buttons included.
- [ ] Visible keyboard focus on all interactive elements; logical tab order.
- [ ] Every informative image has real alt text; decorative images have empty alt.
- [ ] No content conveyed by color alone; `prefers-reduced-motion` respected.
- [ ] Form inputs have programmatic labels.

## Gate 4: Performance

- [ ] Total transfer under ~1MB; CSS+JS under ~200KB.
- [ ] Images sized to display dimensions, modern formats (WebP/AVIF), lazy-loaded below the fold.
- [ ] Fonts: system stack, or at most two self-hosted files, preloaded, `font-display: swap`.
- [ ] No render-blocking third-party scripts; analytics deferred.
- [ ] Target: LCP under ~2s on a mid-range phone. If a Lighthouse run is possible in the environment, run it and record the score.

## Gate 5: Render review

- [ ] Render the page and look at it: screenshot at 390px and 1440px via Playwright, headless Chrome, or gstack `/design-review` when available. Critique the screenshots against the chosen design direction, the anti-slop list, and (when installed) the web-design-guidelines rules; fix anything a cold viewer would flag in five seconds (cramped hero, wall of gray, broken wrap, invisible CTA).
- [ ] If no render tool exists in the environment, mark this gate N/A in the report and tell the user to eyeball both widths before deploy. Never silently skip it; an unrendered page is unreviewed design.

## Gate 6: AI discovery and meta

- [ ] JSON-LD schema present and valid for the archetype (templates below).
- [ ] `llms.txt` present at the site root (template below).
- [ ] `<title>` and meta description written to the same standard as page copy (voice rules apply).
- [ ] Open Graph + Twitter card meta complete, with a real OG image (1200x630).
- [ ] Canonical URL set; favicon present.

## Gate 7: Measurement

- [ ] Conversion event defined: the form destination (ESP, endpoint) records source/medium, or the user has consciously declined measurement.
- [ ] UTM convention stated for every planned traffic source, so campaign performance is attributable from day one.
- [ ] Analytics: privacy-respecting option (Plausible, GoatCounter, or server logs) wired or consciously declined. A gauge-interest page without measurement cannot gauge interest.

## Gate 8: Integrity

- [ ] Zero fabricated testimonials, logos, counts, or statistics.
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

### Gate report format

```
## Ship gates: {product} / {archetype}

| Gate | Result | Notes |
|---|---|---|
| Conversion audit | PASS | MECLABS C = {n} (M{n} V{n} I{n} F{n} A{n}) |
| Voice scan | PASS | 0 hits across {n} files |
| Accessibility | PASS | |
| Performance | PASS | {transfer size}, {LCP if measured} |
| Render review | PASS / N/A | {widths checked, or why N/A} |
| AI discovery | PASS | schema valid, llms.txt present |
| Measurement | PASS | {conversion event, UTM, analytics or declined} |
| Integrity | PASS | {n} TK items resolved/cut |

Open items for the owner: {real proof to collect, urgency to verify, etc.}
```
