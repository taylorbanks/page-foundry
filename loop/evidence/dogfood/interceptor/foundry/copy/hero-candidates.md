# hero-candidates.md: Interceptor (page-foundry Phase 3 dogfood)

Hero candidates for the Interceptor page, drafted by invoking `marketing-skills:copywriting` against `page-spec.md` (section S1), `message-architecture.md`, `persuasion-map.md`, and `voc.md` in this directory, in the register of `references/voice.md`. Three complete hero units, each leading with a different objection or entry state from the Phase 1 objection map; candidates differ on what the hero answers, not on phrasing. Each is scored as a unit against the 5-second test, message match with the traffic source, and the headline budget (target under 44 characters, ceiling 70). The winning framing is drilled into six headline variants below. The hero form is contract-pinned to install-command, so every candidate carries the install block as its primary CTA and the Stealth Verification result as the in-viewport proof; the exact install string stays `[TK]` until DOGFOOD-6 confirms it against the live README.

## Candidate 1 (recommended): lead with detection (theme 1, dominant solution-aware)

- **Headline:** Automate a real browser sites don't flag (40 chars)
- **Subhead:** Interceptor is a Chrome extension that drives your own logged-in browser from inside the browser UI, so your agents and scripts run with no CDP fingerprint and your real sessions stay intact.
- **CTA:** the install command block (primary); `[TK: browser-only install command, confirmed against the repo README at build]`
- **Proof beside it:** Stealth checks, vendor-stated: BrowserScan Normal, Pixelscan Definitely Human, CreepJS 0% headless, Fingerprint.com notDetected. Independent reproduction is `[TK]`.
- **Answers:** the top-ranked pain the buyer arrives with (theme 1: automation gets flagged or logged out on authenticated pages). Entry state: solution-aware, the dominant segment.

Scores. 5-second test: passes; the headline alone tells a cold reader what the tool does and the one thing they care about. Message match: strongest of the three; "flag" and "real browser" are the buyer's own words from `voc.md` ("not detected as a bot at all", "detected as a bot"). Budget: 40 chars, under target.

## Candidate 2: lead with the CDP mechanism (theme 2)

- **Headline:** The browser has no CDP fingerprint (33 chars)
- **Subhead:** Most automation drives Chrome through the DevTools Protocol, and that attached debugger is the signal detectors read. Interceptor works as an ordinary extension, so there is no CDP surface to fingerprint.
- **CTA:** the install command block (primary); `[TK]` as above.
- **Proof beside it:** the same Stealth Verification result.
- **Answers:** "why this over the stealth patches I already run" (O5, and theme 2: CDP is the tell). Entry state: the more technical solution-aware reader who already knows CDP leaks.

Scores. 5-second test: passes for a reader who knows what CDP is; weaker for the product-aware arrival who does not. Message match: high on theme 2 language ("CDP", "fingerprint"), but leads with the mechanism before the outcome, which the spec puts in section S3, not the hero. Budget: 33 chars, under target.

## Candidate 3: lead with real sessions (segment E, product-aware)

- **Headline:** Let your agent act as you, logged in (36 chars)
- **Subhead:** Interceptor drives the browser you are already signed into, so an agent works inside your real sessions without a fresh login and without pointing a detectable bot at your account.
- **CTA:** the install command block (primary); `[TK]` as above.
- **Proof beside it:** the same Stealth Verification result, paired with the safety-controls line (panic hotkey, sensitive-field masking, denylist).
- **Answers:** account-safety anxiety (O2, theme 5). Entry state: the individual operator automating their own accounts (segment E), and the product-aware arrival.

Scores. 5-second test: passes. Message match: good for segment E, but theme 5 (session and login loss) is Low confidence in `voc.md`, so leading the whole hero on it over-weights the thinnest theme. Budget: 36 chars, under target.

## Pick: Candidate 1

Candidate 1 leads with theme 1, the top-ranked and highest-confidence pain, and message-matches the buyer's own language. Candidate 2's mechanism belongs in section S3 (the spec keeps the outcome in the hero and the mechanism one scroll down), and Candidate 3 leads on the Low-confidence theme 5. Candidate 1 wins the hero; the mechanism (Candidate 2's angle) and the account-safety answer (Candidate 3's angle) both keep their place lower on the page, in S3 and S5.

## Headline variants inside the winning framing

Six variants, each scored against the budget, message match with the buyer's language, and specificity. All lead with the detection outcome.

| # | Headline | Chars | Note |
|---|---|---|---|
| 1 | Automate a real browser sites don't flag | 40 | Buyer's words ("flag", "real browser"); outcome-first |
| 2 | Browser automation that sites don't detect | 42 | Clear, slightly more generic than #1 |
| 3 | Automation that reads as a real person | 38 | Shortest that keeps the "real" contrast; "reads as" is soft |
| 4 | Real-browser automation, no bot fingerprint | 47 | Names the wedge; "fingerprint" is theme-2 language pulled early |
| 5 | Run your agent on a browser sites don't block | 45 | Names the agent segment; "block" is a shade weaker than "flag" |
| 6 | Drive your real Chrome. Sites see a person. | 43 | Concrete ("Chrome"); two sentences read punchy but a shade cute |

### Top 3, one line of reasoning each

1. **Automate a real browser sites don't flag** (40). Strongest message match: "flag" and "real browser" are verbatim buyer language, the outcome leads, and it is within budget. **Chosen.**
2. **Real-browser automation, no bot fingerprint** (47). Pulls the theme-2 wedge ("fingerprint") into the hero, which raises value clarity for the technical reader but slightly front-loads mechanism the spec places in S3.
3. **Browser automation that sites don't detect** (42). Clean and honest, but "detect" is one notch more generic than "flag as a bot", the phrase the buyer actually uses.

**Chosen headline: variant 1, "Automate a real browser sites don't flag".** The subhead carries the "as a bot" detail and the mechanism, so the headline stays short and outcome-first. Recorded here so the next run and the copy-fit pass see the full candidate set and the reason, not just the survivor. The copy-fit pass (after Phase 4) re-picks the finalist against the real hero form, as AUDIT-F1b requires.
