# 13h micro-dogfood: ranked themes on real discovery output

Date: 2026-07-18 (overnight loop). Proves the behavior the 13h text adds: theme tags per quote, a ranked Themes section written before Phase 1 orders anything, and a hierarchy that follows the ranking instead of the loudest quote.

## Fixture

The same ripgrep intake the 13g dogfood used (real OSS tool, technical ICP, zero pointed-to VOC sources), re-probed for a larger sample. Two real API calls:

```
curl -s "https://hn.algolia.com/api/v1/search?query=ripgrep&tags=comment&hitsPerPage=30"
curl -s "https://hn.algolia.com/api/v1/search?query=ripgrep&tags=comment&hitsPerPage=10&numericFilters=created_at_i<1672531200,created_at_i>1609459200"
```

The first returned 30 comments, all from the past month. The second deliberately samples the 2021 to 2022 archive, because exercising the twelve-month recency rule needs a genuinely old quote and the fresh probe happened to return none; a real discovery pass surfaces old threads too (search engines do not filter by year), so the sample is the fixture-picking a dogfood is allowed to do. Every quote, author, date, and permalink is real; trimmed raw output for the nine used comments is `probe-output.json`.

## What the new text requires

SKILL.md Phase 1 now says: quotes land with a theme tag; once gathering is done, customer-research writes the Themes section ranked by frequency times intensity with confidence and newest date, before the hierarchy or objection map is ordered; the lead claim answers the top-ranked theme; a Low-confidence theme, or one alive only past the twelve-month window, does not set the hero without a recorded reason in `message-architecture.md`.

## The synthesis, walked

`voc-fragment.md` holds the resulting file. The judgment calls, applied per the pinned companion's criteria (`~/.claude/plugins/marketplaces/marketingskills/skills/customer-research/SKILL.md`, Research Quality Guardrails):

- **Independent sources count authors, not comments.** sdesol appears eight times in the raw probe; one author counts once. One representative sdesol quote sits in Verbatim; the repetition is noted in Paraphrase. Without that dedup, agent-pairing would have claimed 12 of 16 sources and inflated its own rank.
- **agent-pairing: High.** Five distinct authors (wongarsu, gunalx, cadamsdotcom, lowbloodsugar, sdesol), all unprompted, all inside the window. Clears the three-or-more-independent-unprompted bar.
- **lightweight-tooling: Medium.** Two clean sources (dv_dt, skydhash). A third candidate (joefreeman, building an editor that integrates ripgrep) speaks as a toolmaker rather than a searcher, so it was not counted; two sources is the Medium criterion.
- **manual-speed-vs-ai: Low.** One source (bpavuk), could be an outlier.
- **large-codebase-emacs: Low, out of window.** One source (cyneox), dated 2022-12-21. It carries the file's most intense language.

## The point, demonstrated

The single most quotable line in the file is cyneox's `pure gold!`; on intensity alone it would take the hero, and it is the only quote whose enthusiasm is unqualified. The ranking demotes it twice over: single source (Low confidence) and out of the twelve-month window, describing a 2022 Emacs workflow. The top-ranked theme is agent-pairing, so the message hierarchy's lead claim answers what five current buyers keep saying (ripgrep as the search primitive humans and coding agents share), and the vivid old quote cannot set the hero without a recorded override in `message-architecture.md`. That is finding F5's failure mode (`plans/research/order-audit-synthesis.md`, finding 5) closed on real input.

## Test 45 checked against the fragment

Every Verbatim quote carries a theme tag; the Themes section exists and is ranked; the top theme is High confidence with its newest date; the vivid single old quote sits at rank 4 with its date visible; the Themes section quotes nothing (Gates 2 and 8 still search only Verbatim). The degraded path (no customer-research, no invented Themes section) is doctrine the fixture cannot exercise, same as test 44's no-network line.
