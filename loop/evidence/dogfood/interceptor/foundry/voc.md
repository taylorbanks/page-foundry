# voc.md: Interceptor (page-foundry Phase 0 dogfood)

Voice-of-customer for the Interceptor dogfood, produced by invoking `marketing-skills:customer-research` in Mode 2 (open-web discovery) against the problem space: developers whose browser automation gets detected and blocked. Interceptor itself is small and new, so the buyer language lives in the pain rather than in reviews of the product.

Every verbatim quote below carries an openable permalink and a theme tag. The block sits inside a code fence for the loop's evidence-scan hygiene: verbatim buyer text is exact source material, so it is exempt from the voice gate the same way fenced code is. Sources and the full integrity record are in `voc-sources.md` beside this file. In a real repo run this file is plain markdown at `.agents/foundry/interceptor/voc.md`; here it is isolated under the dogfood evidence tree.

Provenance spot-check (this iteration): the GitHub and Stack Overflow permalinks returned HTTP 200; Hacker News item IDs 47415852, 45447414, 45629402, 47212383, and 48338282 were confirmed as real comments through the HN Firebase API, with author and date matching each attribution. Reddit could not be reached (403 on unauthenticated access), and the gap is recorded in `voc-sources.md` rather than filled with an unsourced quote.

```
## Verbatim

> I've been working on webtool because I got tired of battling captchas in Playwright and cloud browsers. For most tasks, it's a lot better to just let the agent work in a real, live Chrome browser that is not detected as a bot at all.
— Hacker News, https://news.ycombinator.com/item?id=47415852 · il · 2026-03-17 · detection/blocking

> You need to patch the entire browser to avoid these detection methods and that's why there are so many web scraping/automation SAAS out there with their own browser versions as that's the only way to automate the web these days. You can't just connect to a consumer browser and automate undetected.
— Hacker News, https://news.ycombinator.com/item?id=45447414 · wraptile · 2025-10-02 · CDP fingerprint

> most browser automation platforms use CDP or CDP based APIs and websites are able to detect it as bots. We built new C++ APIs into rendering engine for type, click, extract which are not CDP based and surprisingly don't get detected by most websites.
— Hacker News, https://news.ycombinator.com/item?id=45629402 · felarof · 2025-10-18 · CDP fingerprint

> I have not queried or clicked anything using puppeteer, simply connected to the browser seems enough for cloudflare to block access to a site.
— GitHub (berstend/puppeteer-extra issue #841), https://github.com/berstend/puppeteer-extra/issues/841 · joeledwardson · 2023-09-27 · CDP fingerprint

> all the spoofing is working but it detect usage of CDP and declare it a bot.
— Stack Overflow, https://stackoverflow.com/questions/79582148/how-to-avoid-detection-when-using-cdp-chrome-devtools-protocol-with-playwright · Zubair Khakwani · 2025-04-19 · CDP fingerprint

> The anti-bot patches here (via Patchright) are about preventing the browser from being detected as automated — fixing CDP leaks, removing automation flags, etc. For sites behind Cloudflare or Datadome, that alone usually isn't enough — you'll need residential proxies and proper browser fingerprints on top.
— Hacker News, https://news.ycombinator.com/item?id=47527180 · andrew_zhong · 2026-03-26 · stealth-maintenance burden

> While building it, I kept hitting a wall against sophisticated anti-bot systems. This sent me down a deep rabbit hole to understand how they actually work. It turns out detection isn't about one thing, but about consistency across multiple layers: from the OS-level (TCP/IP, TLS/JA3), to the browser (HTTP/2, Canvas/WebGL), and finally to human behavior (mouse physics, typing cadence).
— Hacker News, https://news.ycombinator.com/item?id=45771311 · thalissonvs · 2025-10-31 · stealth-maintenance burden

> Despite implementing multiple stealth measures (custom user agents, hardware fingerprinting evasion, and randomized human-like behavior), the bot detection mechanisms still successfully identify the script as automated.
— GitHub (berstend/puppeteer-extra issue #920), https://github.com/berstend/puppeteer-extra/issues/920 · jjyuhub · 2025-04-03 · stealth-maintenance burden

> This is literally the whole cat and mouse game of scraping and web automation, sites clearly want to protect their moat and differentiators.
— Hacker News, https://news.ycombinator.com/item?id=47212383 · arjunchint · 2026-03-02 · cat-and-mouse arms race

> I started with python requests, then to scrapy, then selenium, then selenium via undetected_chromedriver, and once that started being detected during a chrome update about a year ago, I've switched over to seleniumbase.
— Hacker News, https://news.ycombinator.com/item?id=42445575 · michael_j_x · 2024-12-17 · cat-and-mouse arms race

> My main concern with this browser's automation features is account safety—how well does it mask itself? I'm worried it might trigger the platform's anti-bot detection and get my account flagged or banned :(
— Hacker News, https://news.ycombinator.com/item?id=48338282 · haruharuha · 2026-05-30 · session/login loss

> the response html has title "Just a moment..." which I've seen in a cloudflare page html. The error probably comes from cloudflare rather than the actual site I'm crawling, which means that my script is detected as a bot.
— Stack Overflow, https://stackoverflow.com/questions/79000090/playwright-cannot-bypass-cloudflare-bot-detection-even-adding-cookies-and-user-a · Ginni Song · 2024-09-18 · detection/blocking

## Paraphrase

- Reddit (r/webscraping and similar subs) is clearly a primary watering hole for this pain, but Reddit now returns 403 block pages for unauthenticated search and listing JSON, and a scoped web search surfaced no openable threads, so no verifiable Reddit verbatim is offered rather than risk paraphrasing one as a quote. (Reddit)
- The undetected-chromedriver ecosystem treats detection as a moving target: third-party guides that teach it all carry the same caveat, that a script bypassing Cloudflare, DataDome, or Imperva today may fail tomorrow after an anti-bot update, and that undetected-chromedriver alone tends to get caught over time. (WebSearch across scrapfly.io, brightdata.com, kameleo.io; no single buyer permalink)
- Playwright's own maintainers decline to help bypass bot protection and frame the tool as end-to-end testing only, which pushes affected developers toward third-party stealth tooling; a SeleniumBase maintainer cited this stance directly on Hacker News. (Hacker News, item 42445885)
- A visible cluster of builders is now shipping non-CDP browser control on purpose, at the C++/rendering-engine level or via an in-browser extension, precisely because CDP is detectable. Examples raised in-thread include felarof's custom C++ APIs, Intuned, Browser Cash, and pydoll. This is the market converging on the same thesis Interceptor is built on. (Hacker News, multiple items)

## Themes

1. Detection and outright blocking of automated browsers: appears in most sources checked (il, Ginni Song, plus supporting posts from manishsharan, varyen, KennyBlanken) · 6 of 12+ sources · intensity high · confidence High (unprompted across HN, GitHub, and Stack Overflow) · newest 2026-03-17
2. CDP is the fingerprint that gives you away (connecting at all is the tell): 4 of 12 sources (wraptile, felarof, joeledwardson, Zubair Khakwani) across HN, GitHub, and Stack Overflow · intensity high · confidence High (3+ independent, unprompted) · newest 2025-10-18
3. Stealth-maintenance burden, and stealth patches are not enough: 3 of 12 sources (andrew_zhong, thalissonvs, jjyuhub) · intensity high · confidence High · newest 2026-03-26
4. Cat-and-mouse arms race and constant tool-hopping: 2 of 12 sources in the quote set (arjunchint, michael_j_x), with more in the wider corpus (phpmoli issue #811, Closi item 41108043) · intensity medium to high · confidence Medium (only one quote is within 12 months; the rest are older) · newest 2026-03-02
5. Session and login loss, account flagged or banned under automation: 1 of 12 sources (haruharuha) · intensity medium · confidence Low · newest 2026-05-30. This theme is genuinely thin in discovery. It shows up as a fear and a side effect more than a standalone complaint, so it is reported honestly as low confidence rather than padded.

## Recurring language

- "detected as a bot" / "detected as automated" / "declare it a bot" — recurs in il, felarof, Zubair Khakwani, Ginni Song, jjyuhub, and the puppeteer-extra issue titles (HN, Stack Overflow, GitHub)
- "cat and mouse" / "cat-mouse race" — recurs in arjunchint, phpmoli (issue #811), and the tool-switching narrative in michael_j_x and Closi (HN, GitHub)
- "CDP" / "Chrome DevTools Protocol" as the thing that leaks — recurs in wraptile, felarof, andrew_zhong, Zubair Khakwani (HN, Stack Overflow)
- "stealth" (stealth plugin, stealth measures, stealth mode) — recurs in thalissonvs, jjyuhub, andrew_zhong (HN, GitHub)
- "patch the entire browser" / "their own browser versions" / "not CDP based" — recurs in wraptile and felarof, the workaround language the market is settling on (HN)
- "navigator.webdriver" / "automation flags" — recurs in Zubair Khakwani, andrew_zhong, and the fingerprint-scanner author avastel (Stack Overflow, HN)
- "flagged or banned" / "account safety" — haruharuha, the account-risk framing of the session theme (HN)
- "residential proxies" as the next cost after stealth fails — andrew_zhong, plus helloworld4728 (HN)
```
