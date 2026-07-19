# persuasion-map.md: Interceptor (page-foundry Phase 1 dogfood)

Persuasion levers for the Interceptor page, chosen by invoking `marketing-skills:marketing-psychology` against `product-marketing.md` and `voc.md` in this directory. This buyer is a security-literate engineer who reads the code before trusting a claim, so the register rules the lever choice: every lever here is factual and checkable, and the hype levers are left on the table on purpose. Each entry names the lever, why it fits this buyer, and where it lands (claim order, objection answers, CTA framing, spec structure). The Fogg and Hick entries are structural deliverables Phase 2 reads when it builds the spec. Levers not chosen are listed at the end with the reason, so a later phase does not reach for one this buyer would reject.

## Chosen levers

### Pratfall effect (the primary lever for this buyer)
Fit: a competent product that admits a real flaw earns more trust from an audience that will find the flaw anyway. The brief records the candor as a credibility asset, and the source documents its own bugs and its own security boundary before any page does.
Lands on: the two hardest objection answers (the unauthenticated local socket on the macOS bridge, and the documented current bugs) and the page's whole register. State the limit plainly, then state what bounds it. This lever answers O3 and O4 in the objection map.

### Checkable authority (read the code, run the check)
Fit: builder-to-builder trust here comes from verifiability, not from credentials or logos. The product is open source and its stealth results are a named table a reader can reproduce.
Lands on: the hero proof element (the Stealth Verification result, marked vendor-stated) and the differentiation section (inspect the extension, build from source). The CTA inherits it, because the primary action sends the reader to the code rather than to a signup wall.

### Loss aversion, stated as fact and not as fear
Fit: the pain is a real recurring loss, an automation that works locally and then gets flagged in the wild, plus stealth patches the buyer maintains that still fall behind. Loss framing fits, but this buyer rejects FUD, so the frame stays specific: the patch that passes a detector today fails after the next detector update, because it masks tells instead of removing the surface.
Lands on: the lead claim framing (the cost of the status quo) and O5 (the "my stealth setup works fine" disqualification, answered with the moving-detector reality from themes 3 and 4).

### Contrast effect (before and after the CDP surface)
Fit: the wedge is a single architectural difference a reader can picture, a debugger attached versus no debugger at all.
Lands on: the how-it-works section and the competitor contrast. The before state is CDP or WebDriver automation a site can fingerprint; the after state is extension control with no CDP surface. Claim 2 in the hierarchy carries it.

### Category validation, not testimonial (the why-now proof)
Fit: adoption proof for Interceptor itself is thin and stays `[TK]`, so social proof is not a lever this page leans on. What is real and sourced is the market converging on the same thesis, independent builders shipping non-CDP browser control on purpose because CDP is detectable. The `voc.md` paraphrase names felarof's C++ APIs, Intuned, Browser Cash, and pydoll.
Lands on: a why-now line that validates the category without claiming Interceptor's own adoption. This stands in for the social-proof lever the proof inventory cannot yet support.

## Structural models (Phase 2 deliverables)

### Fogg Behavior Model (Behavior = Motivation x Ability x Prompt)
- Motivation is high and already present: blocked automation on authenticated pages is the top-ranked pain (theme 1). The page does not manufacture motivation; it names the pain in the buyer's words.
- Ability is the binding constraint here, not motivation. The install asks for a real Chrome or Brave window, a manually loaded extension, and on the full package a `.pkg` and macOS permission grants. Phase 2 lowers the ability cost: name the one job the tool wins, show the shortest install path (the browser-only package for readers who do not want the native bridge), and keep the first command trivial.
- Prompt: proof sits beside every CTA instance, and the primary prompt is the install or repo action. Phase 2 places prompts where motivation is highest and the next action is cheapest.

### Hick's Law (fewer choices, faster decision)
- One primary CTA (the install or repo action); documentation is the single secondary path.
- The page offers no pricing tiers to choose: the archetype is oss-project and the business model is `[TK]`, so there is no paid tier and no tier-count decision to simplify.
- Navigation stays minimal per the oss-project contract, because every added choice on the page is a decision the buyer has to make before the one that matters.

### Pricing psychology
Out of scope this run. The oss-project archetype carries no pricing block and the brief's business model is `[TK: no paid or hosted tier confirmed]`. A pricing lever is not placed; if an owner later confirms a paid tier, this section is revisited.

## Levers deliberately not used
- Social proof and bandwagon: no confirmed stars, installs, named users, or testimonials exist, and every one is `[TK]`. Manufacturing it would break the integrity rule, so the page uses category validation (above) instead.
- Scarcity and urgency: nothing on this page is genuinely limited, and false urgency reads as exactly the hype this buyer distrusts.
- Charm pricing and anchoring: no price exists to frame.
- Authority by logo or credential: replaced by checkable authority, because this audience trusts a reproducible check over a badge.

---
Provenance: levers selected from `marketing-skills:marketing-psychology` (2.3.0) applied to `product-marketing.md` and `voc.md` in this directory. Every lever traces to a brief field or a ranked theme; no lever rests on proof marked `[TK]`.
