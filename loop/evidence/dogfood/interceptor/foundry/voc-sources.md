# voc-sources.md: provenance and integrity record for `voc.md`

This is the checkable trail behind the Interceptor dogfood VOC. `customer-research` pulled every verbatim span from a raw-text API (HN Algolia, GitHub REST, Stack Exchange), not a summarizing fetch, so the spans are exact. My own verification this iteration is recorded below the fence.

## Orchestrator verification (iteration 52)

- Stack Overflow permalink `.../79582148/...` returned HTTP 200.
- GitHub issue permalink `berstend/puppeteer-extra/issues/841` returned HTTP 200.
- Hacker News item IDs were confirmed through the Firebase item API (`hacker-news.firebaseio.com/v0/item/<id>.json`), because a direct `curl` of the HN web page returns 429 rate-limit rather than a real status. Five IDs checked, each a real comment with author and timestamp matching the `voc.md` attribution: 47415852 (`il`, 2026-03-17), 45447414 (`wraptile`, 2025-10-02), 45629402 (`felarof`, 2025-10-18), 47212383 (`arjunchint`, 2026-03-02), 48338282 (`haruharuha`, 2026-05-30).
- Reddit was unreachable (403 on unauthenticated access). No Reddit quote was invented to compensate; the absence is stated in `voc.md` under Paraphrase.

## Researcher raw record (fenced: exact source list and integrity notes as returned)

```
SOURCES-CHECKED:
- https://news.ycombinator.com/item?id=47415852
- https://news.ycombinator.com/item?id=45447414
- https://news.ycombinator.com/item?id=45629402
- https://news.ycombinator.com/item?id=47527180
- https://news.ycombinator.com/item?id=45771311
- https://news.ycombinator.com/item?id=47212383
- https://news.ycombinator.com/item?id=42445575
- https://news.ycombinator.com/item?id=48338282
- https://github.com/berstend/puppeteer-extra/issues/841
- https://github.com/berstend/puppeteer-extra/issues/920
- https://stackoverflow.com/questions/79582148/how-to-avoid-detection-when-using-cdp-chrome-devtools-protocol-with-playwright
- https://stackoverflow.com/questions/79000090/playwright-cannot-bypass-cloudflare-bot-detection-even-adding-cookies-and-user-a
- (additional threads examined but not quoted: https://news.ycombinator.com/item?id=42445885 · https://news.ycombinator.com/item?id=41108043 · https://github.com/berstend/puppeteer-extra/issues/811 · https://github.com/berstend/puppeteer-extra/issues/867 · https://stackoverflow.com/questions/79347027/how-to-prevent-twitter-blocking-page-refreshes-while-scraping-tweets-using-selen)

RECENCY: 7 of the 12 verbatim quotes are from within the last 12 months (after 2025-07-18): il, wraptile, felarof, andrew_zhong, thalissonvs, arjunchint, and haruharuha. The other 5 (joeledwardson 2023-09, Zubair Khakwani 2025-04, jjyuhub 2025-04, michael_j_x 2024-12, Ginni Song 2024-09) are older and are weighted down accordingly in the theme ranking; no theme is ranked first on the strength of an old-only quote.

Integrity note from customer-research: no Reddit quote is included because Reddit blocked verifiable access during discovery; one otherwise-relevant Hacker News line (a user "Bronco" on automation "immediately met with bot detection") was dropped because it survived only as a greentext requote inside another user's comment, with no openable permalink of its own.
```
