# build-notes.md: Interceptor (DOGFOOD-6b, Phase 5 build)

What Phase 5 built, from what, and every build decision the gates and the morning owner need to see. The page is `pages/interceptor/index.html`, built from the frozen `copy/copy-approved.md` verbatim, on the Plan A tokens in `pages/interceptor/theme.css`, starting from the Phase 4.5 comp composition (`comp/index.html`) with its draft copy swapped for the snapshot.

## Deliverables

- `pages/interceptor/index.html`: the built page.
- `pages/interceptor/theme.css`: the persisted Plan A tokens (unchanged; the DOGFOOD-5a design record).
- `pages/interceptor/assets/og.png`: 1200x630 OG card, a real headless-Chrome capture of `foundry/og.html`.
- `pages/interceptor/assets/favicon.svg`: the amber command-prompt chevron on the dark field, drawn as a path from the theme tokens.
- `pages/interceptor/llms.txt`: the AI-discovery file, facts sourced to the brief.
- `foundry/og.html`: the OG card source (run state; only the capture deploys).

## Reconciliation deltas applied (comp draft to frozen snapshot)

The comp rendered the DOGFOOD-1 draft, before the DOGFOOD-6a repo-verify. The build renders the reconciled snapshot, so these differ from `comp/index.html`:

- Repo name is `Interceptor`, not `slop-browser`, everywhere (links, schema, S9 prose).
- The install affordance is the reconciled signed `.pkg` download. The hero and close render the verbatim install sentence with "download the signed Interceptor-Browser package from GitHub Releases" as a link to the repo's Releases page. The comp's copyable command block and copy button are gone, because the install is a download you double-click, not a command. No new copy: the link's visible text is verbatim snapshot.
- S10 FAQ leads with "How do I know it works before I install?", not the comp's repo-name question. The reconciled limitations (a screenshot that ignores scroll position, a broken `--clip` flag, `eval` blocked on strict-CSP sites) render verbatim.
- The license answer states the non-standard license GitHub classifies as `Other`, replacing the comp's `[TK: license identifier]`.
- The S4 figcaption is the corrected snapshot line ("Real captured output goes here once the tool runs against a live page"), no longer the comp's false "captured from the live build" claim. The output pane holds the `[TK]` marker.
- S9 leans on the documented bug list rather than star count, so the comp's separate `.status-line` string with `stars: [TK]` is dropped. The J6 terse-status-line shape is served by linking the repo URL and "open issues" inside the verbatim S9 prose, adding no non-snapshot text.

## Verbatim self-check (the Gate 2 build requirement)

Extracted the page's rendered text and checked every `copy-approved.md` body-copy line against it: 33 of 33 present verbatim. The `<title>` and meta description are the snapshot's labeled entries, present in the head for Gate 6 (confirmed on `name=description`, `og:description`, and `twitter:description`).

One line renders as a shape rather than a sentence: the hero's vendor-stated stealth checks. The snapshot writes them as one comma-list sentence; the confirmed status-card shape renders them as labeled rows, so the inter-item commas and the one terminal period after "notDetected" become the card structure. Every word is verbatim and in reading order. This is the same list-rendering boundary as the S5 safety list and the S7 not-for list, and it is left for DOGFOOD-7's rendered-text diff to confirm against the card, not resolved by abandoning the design signature to satisfy a punctuation-level match.

## Build decisions and open items for DOGFOOD-7

- **Canonical and OG origin.** `interceptor.example` (RFC 2606 reserved, never resolves) stands in for the deploy origin, because this open-source tool has no confirmed marketing domain in the brief. The share-scraper structure is correct now (absolute `og:image` URL, `og:image:width`/`height`, `twitter:card` of `summary_large_image`). OWNER-REVIEW: the owner sets the real origin at deploy; the placeholder is not a live claim.
- **Link destinations.** Docs, GitHub, Community, and License point at the confirmed-live repo (`github.com/Hacker-Valley-Media/Interceptor`, HTTP 200 per DOGFOOD-1/6a); Security points at the repo's standard `/security` path; the install links point at `/releases`. The repo is the one independently verified surface, so no link is a dead `#` anchor and none is a guessed sub-URL. Open item: the owner points Docs, Community, and License at their final destinations at deploy if separate pages exist.
- **Fonts.** `theme.css` names self-hosted `assets/plex-*.woff2` that this dogfood does not bundle, so the page renders on the fallback stacks (`ui-monospace`/`system-ui`). Bundling the woff2 with a metric-matched `size-adjust` is an open item for a real ship; DOGFOOD-7's performance gate notes the fallback.
- **JSON-LD.** `SoftwareSourceCode` with name, description, `codeRepository`, and an Organization author (Hacker Valley Media, the repo org). `programmingLanguage` and a license URL are omitted rather than guessed: the sources do not state the repo's primary language, and a non-standard `Other` license has no SPDX URL. Omitting an optional field is honest; a guessed value is not.
- **OG capture under a locked screen.** The card is a real headless-Chrome capture (`--headless=new`, temp user-data-dir), which renders offscreen even with the screen locked (the AUDIT-F2 fallback, lesson 35). The process hung on shutdown after writing the file, so the capture is real and verified at 1200x630. The live-page 390 and 1440 renders and the S4 quickstart output stay deferred to DOGFOOD-7's unlocked rerun, per `copy-approved.md`.
- **The three visible `[TK]` markers** (independent reproduction of the stealth checks, the S4 quickstart output, the S6 CI and headless story) are verbatim snapshot copy and honest deferred-or-unknown-proof markers, not fabrication. DOGFOOD-7's unlocked rerun resolves the quickstart output; the other two are genuinely unknown and stay `[TK]` rather than being invented.
