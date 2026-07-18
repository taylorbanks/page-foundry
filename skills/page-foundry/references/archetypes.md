# Page Archetypes

An archetype is a conversion contract, not a template. It fixes what the page must accomplish for its buyer: the goal, the jobs, the proof, the CTA policy, and the constraints any legal section order must satisfy. It does not fix where sections sit. Section order is computed fresh for every page from the Phase 1 objection map, inside the ordering constraints below; two pages honoring the same contract should differ in structure whenever their buyers differ. The page spec records which order the objection map produced and why, so the gates audit constraints, not slot positions.

## The contract schema

Every archetype in this file is written as six blocks:

1. **Goal.** The single conversion the page type exists for.
2. **Buyer entry states.** The awareness and temperature states this page must serve, keyed to the Phase 1 brief. This input generates section order.
3. **Jobs the page must do.** Obligations without positions. Every job appears on the page; no job owns a slot. A skipped job is a spec defect, not a style choice.
4. **Proof requirements.** The proof types the goal demands, with placement constraints.
5. **CTA policy.** The primary action, repetition rules, navigation policy, and form budget. Default for every contract: one primary CTA per page, the same action every time it appears, never competing; secondary actions stay visually quiet (text links, ghost buttons; conversion rule 3).
6. **Ordering constraints.** Archetype-specific additions to the shared invariants below. Any order satisfying the full set is legal; the objection map chooses among legal orders.

## Shared ordering constraints

These ten bind every page this skill builds. A contract's own Ordering constraints block adds to the set; nothing subtracts from it. Rule numbers cite `references/conversion-rules.md`, which holds the evidence.

1. The hero comes first and passes the 5-second test: what it is, who it is for, what to do next, readable in five seconds by someone who has never heard of the product (rule 1).
2. Proof sits beside the claim it supports, and every CTA instance has a proof element within one viewport (rule 4).
3. The heaviest proof on the page sits immediately before the ask.
4. The mechanism is established before the price is asked.
5. Risk reversal lands at the moment of commitment, not before it.
6. Objections are answered where they arise; an FAQ collects the leftovers and never substitutes for answering the load-bearing objections in place (rule 11).
7. The mobile single-column order reaches proof before any form (rule 8).
8. Message match binds single-source traffic: the hero mirrors the language of the ad, post, or email that sent the reader (rule 5).
9. No qualified reader is disqualified before reaching a CTA (rule 10).
10. Sections appear in the order THIS buyer raises objections, taken from the Phase 1 objection map. Where constraints 1 through 9 leave several legal orders, the objection map decides; where the map is silent, the spec states the assumption it made.

## Composition axes

The ordering constraints say which orders are legal; the axes say what kind of page gets built inside a legal order. Four of them, each declared in the page spec with one line of reasoning. This is where two pages honoring the same contract diverge: the constraints hold the conversion discipline still while the axes move, so a hundred briefs produce a hundred settings instead of one wireframe.

**Narrative shape**: problem-led, demo-led, proof-led, or offer-led. Awareness state is the chooser. Unaware and problem-aware readers need the problem established before a mechanism or an offer can mean anything, so they get the problem-led arc. Solution-aware readers own the problem already and start at the mechanism or the demonstration. Product-aware readers get offer-led pages; walking a half-sold reader through problem agitation is dead weight they scroll past. Whatever the shape keeps of the persuasion arc appears in arc order: the arc prunes from the front and never runs backward.

**Hero form**: copy-plus-CTA, form-in-hero, product-in-hero, install-command, or social-proof-led. The 5-second test binds all five; the form decides what does the passing. The goal and the audience choose: a practitioner audience converts on the thing itself (install-command, product-in-hero), an exchange measured in attention converts on the form, a category where trust is the whole sale can open on its strongest proof. Some contracts pin this axis (newsletter-capture pins form-in-hero, oss-project pins install-command); a pinned axis is part of the contract, not a per-run choice.

**Proof strategy**: concentrated or interleaved. Concentrated gathers the heavy artifacts into a dedicated section that carries one moment of the page; interleaved rides each proof element beside the claim it supports. The shape of the proof inventory chooses: one or two heavy artifacts (a named case with numbers, a video testimonial) concentrate well, while many small pieces (quotes, counts, logos) work harder spread beside the claims they back. Shared constraints 2 and 3 bind either way: every CTA keeps proof within a viewport, and the heaviest proof still sits immediately before the ask.

**Density**: compressed or long-form. Decision weight is the chooser: what the reader risks by converting, in money, time, and switching pain. course-sales states the thresholds (roughly $200 for a focused page, $500 and up for long-form); the same gradient governs every archetype. A light decision converts on a compressed page, and padding it costs conversions; a heavy decision needs the full persuasion arc, and compressing it starves the reader of reasons at the exact moment the price asks for them.

The compiler recommends a setting per axis when it fills the contract (see below), and `foundry-log.md` moves those defaults when per-property conversion data says so. An axis setting is a structural claim about the buyer, which makes it testable: the page spec records the settings, and when conversion data arrives, the log's learnings move the next run's defaults.

## The section-shape lexicon

A job names what a section owes the reader; a shape is the form that obligation takes on the page. Phase 2 picks the jobs and their order; Phase 4 picks each job's shape, with the tokens in hand. Three or more sanctioned shapes per recurring job keep a hundred pages from sharing one wireframe even when their orders agree. A shape outside this list is legal when the spec records what it is and why; whatever shape a job takes, the constraints still bind: proof adjacency, mobile order, the 5-second hero.

- **Proof**: a logo strip; a pull-quote inline beside the claim it backs; a case-study card with a name and a number; a stat wall; an artifact screenshot or screen recording (the membership feed scroll, the OSS quickstart output).
- **How it works / mechanism**: numbered steps, only when the order is real; an annotated screenshot; a 30-second clip; a live embed; an architecture diagram for technical readers.
- **Objections**: an FAQ collecting the leftovers; an inline callout beside the claim that raises the objection; a not-for list; a comparison table.
- **Problem**: one sentence in the buyer's words, all that aware traffic needs; a short narrative written from inside their situation; a before-and-after contrast; an itemized ledger of what staying stuck costs.
- **Offer and pricing**: tier cards; a single itemized offer stack with the price framed against the cost of the problem; a pricing teaser line linking the full pricing page; a comparison table against the alternatives' true cost.
- **Identity** (instructor, founder, writer, owner): a proof-dense bio block; the hero itself when the person is the hook; a credential line inline beside the method claim it supports; a photo-and-narrative split.
- **The close**: one line restating the outcome, with the button; promise plus the strongest single proof element plus the button; the form repeated with the privacy line; the primary CTA paired with a quiet lowest-friction secondary.

## The post-conversion moment

Every goal in this file drops the converted reader somewhere: a confirmation screen, a thank-you page, a checkout success, a store listing, a first run. That moment is part of the page's contract, not an afterthought. Three obligations bind every archetype:

- The page spec names what the converted reader sees next; leaving it unnamed means a platform default decides.
- The moment delivers something immediately: the promised artifact, the best of what they signed up for, or the first concrete step already underway.
- It sets expectations for what arrives when: the first issue, the onboarding email, the reply to their application.

When the next screen is a page this skill can build (a thank-you page, as opposed to a store listing or checkout flow the platform owns), build it in the same pass, to the `thank-you-post-conversion` contract below; the conversion is not done at the form.

## The contract compiler

Current archetypes: `oss-project`, `saas-homepage`, `campaign-landing`, `mobile-app`, `course-sales`, `membership-community`, `newsletter-capture`, `personal-home`, `pricing-page`, `comparison-alternatives`, `docs-dev-tool-landing`, `waitlist-coming-soon`, `event-webinar`, `thank-you-post-conversion`.

The compiler turns a Phase 1 brief into a filled contract. It runs for every page, whether or not the user named an archetype: naming one skips classification, never compilation. Answer five questions from the brief (ask only for what the brief does not settle, and state every inferred answer):

1. **What is the conversion?** Install/star → oss-project. Trial/demo → saas-homepage. One-time purchase of a defined offer → campaign-landing or course-sales. Recurring subscription to people + content → membership-community. Email address for a recurring publication that exists → newsletter-capture. Email address for early access to a product that does not exist yet → waitlist-coming-soon. Store install → mobile-app. A practitioner's first successful call on a commercial developer tool → docs-dev-tool-landing. Registration against a real date → event-webinar. "Know who I am, then one action" → personal-home. Tier selection into checkout, trial, or upgrade → pricing-page. The parent product's conversion reached through switch intent from a named competitor → comparison-alternatives. Activating a reader who just converted → thank-you-post-conversion, usually compiled in the parent page's pass per the post-conversion section above rather than classified from a fresh brief.
2. **Is the relationship one-time or ongoing?** One-time purchases sell a transformation with an endpoint (course-sales, campaign-landing). Ongoing subscriptions sell a living thing and must prove it is alive (membership-community, saas-homepage, newsletter-capture).
3. **Where does the traffic come from?** A single controlled source with one intent pushes toward campaign-landing's contract (no nav, message match binding) regardless of what is being sold. Mixed/organic traffic pushes toward homepage contracts (nav, fuller story).
4. **What awareness state dominates?** Unaware, problem-aware, solution-aware, or product-aware, from the brief's traffic answer. Every contract's entry-states block conditions jobs on this; the compiler keeps or strikes each awareness-conditional job accordingly and records which state it compiled for. The first three questions pick the contract; this one decides what survives inside it, and it chooses the narrative-shape axis.
5. **How heavy is the decision?** Price and commitment, from free install to high-ticket application. course-sales states the thresholds (roughly $200 for a focused page, $500 and up for full long-form); the same gradient governs length on every archetype. Weight chooses the density axis: how much persuasion the page carries before the ask.

**The output is a filled contract, not an archetype name.** Instantiate the matched archetype's six blocks: the goal made concrete for this product, entry states narrowed to the ones the brief says actually arrive, every awareness-conditional job marked kept or struck with one line of reasoning, proof requirements checked against the brief's real proof inventory, the CTA policy, and the full ordering-constraint set (the shared ten plus the archetype's own). Close with a recommended setting on each of the four composition axes, one line of reasoning per axis naming the input that chose it: the awareness state for narrative shape, the goal and audience for hero form (unless the contract pins it), the proof inventory for proof strategy, the decision weight for density. The filled contract goes into the page spec, and the gates audit against it.

**Straddling.** A page straddling two archetypes gets a merged contract: the union of both jobs lists, the goal from the archetype matching the CONVERSION, and the strictest applicable CTA and navigation policy. A paid workshop sold from one ad campaign merges campaign-landing and course-sales: campaign-landing's goal and no-nav policy, plus the curriculum and instructor jobs. A paid newsletter merges newsletter-capture and membership-community the same way. Record the merge in the page spec so the gates audit the right constraints.

**Nothing fits.** The shared constraints plus `references/conversion-rules.md` already amount to a contract; fill the six blocks by hand, state in the spec that the page is off-archetype, and when the same hand-filled contract recurs across runs, promote it into this file using the schema above.

**The log moves the defaults.** Before filling anything, read `foundry-log.md` for this property (Phase 0 already loaded it). Its `conversion data` and `learnings` lines move the axis defaults the compiler would otherwise recommend: a density that underperformed at this price point stops being the default; a proof strategy that produced signups is not overridden without saying so. When the log moves a default, the filled contract names the log line that moved it; when a log exists and moves nothing, the contract says why, the same discipline the pipeline demands of Phases 1 through 3. No log means the defaults stand, and the contract says that too.

The log's `skeleton` lines cut the other way. Each run closes by recording the structure it shipped (job order plus axis settings), and Gate 1's anti-template check compares every new page against the property's recent ones: a repeated skeleton with conversion data behind it stands, a repeated skeleton without data gets flagged (`references/ship-gates.md`, Gate 1). Converged because it converts is fine; converged because the last run did it that way is the template trap wearing a contract's clothes.

---

## oss-project

For open source tools, libraries, and self-hostable software. The reader is a practitioner deciding whether to try it in the next ten minutes.

**Goal.** Install, star, or read the docs. Pick one as primary.

**Buyer entry states.** Almost never unaware. OSS traffic arrives solution-aware (comparing approaches to a problem it already owns) or product-aware (sent by a colleague, a thread, a mention in another project's docs). The states want different orders: solution-aware readers raise "why this over the alternatives" early, so the comparison surfaces sooner; product-aware readers arrive half-sold and want the quickstart within one scroll. Launch-day traffic from a single post is single-source, and message match binds (shared constraint 8).

**Jobs the page must do.**

- State plainly what it does and for whom. No marketing adjectives, anywhere on the page.
- Present the install command in a copy-button code block, with version, license, and star badges adjacent. For a practitioner audience the install command IS the CTA.
- Take the reader from zero to first useful output in the fewest visible steps. Real commands, real output. If the quickstart needs more than one screen, the product has an onboarding problem the page cannot fix.
- Show how it works: one diagram or a terse section for the reader evaluating trust and fit. For security tooling, this is where threat model and data handling live. Plain statements only.
- Compare honestly against the 2 or 3 alternatives the reader is already considering. Concede real tradeoffs; conceded weaknesses buy credibility for the claimed strengths.
- Show the project is alive: where discussion happens, how to contribute, who maintains it, release cadence. Maintenance signals are a primary trust factor for OSS adoption.
- Link docs, repo, license, and security policy (`SECURITY.md` if it exists) at the close.

**Proof requirements.** Stars, downloads, named adopters, "as seen in" only if real. Cut proof rather than run it thin; an empty proof strip on an OSS page reads as desperation. For OSS the strongest proof is often the product itself: a quickstart with real output carries trust the way a logo row never will, and may stand in front of any adoption numbers.

**CTA policy.** Default policy, with the install command as the primary CTA; it repeats at the close of the page. Navigation: minimal and allowed (Docs, GitHub, Community).

**Ordering constraints.** Adds to the shared set:

- The install command lands in the hero, not below it.
- For product-aware traffic, the quickstart begins within one scroll of the hero.
- The comparison never precedes the reader's first sight of the thing working; arguing against alternatives before demonstrating anything reads as insecurity.

Tone: terse, technical, zero hype. The brutalist/terminal aesthetic direction (see design-direction.md) is a natural fit but not mandatory.

---

## saas-homepage

For web apps and SaaS products. The homepage serves mixed intent, so it gets navigation and a fuller story than a campaign page.

**Goal.** Trial signup, demo booking, or waitlist. Pick one as primary.

**Buyer entry states.** Cold, evaluating, and returning, all at once; a homepage is the one page type that cannot choose. Cold readers need the problem named before capabilities mean anything. Evaluating readers arrive solution-aware and scan for the mechanism, the pricing model, and their own objections. Returning readers want the CTA and whatever changed since last visit. The Phase 1 brief states which state dominates the traffic; that answer, through the objection map, decides most of the order.

**Jobs the page must do.**

- Open with an outcome-first headline within the length budget (rules 1 and 2), a subhead naming who it is for and the mechanism, and a product visual showing the actual product doing the actual thing. No abstract illustrations of people pointing at charts.
- Name the pain in the buyer's own words (pull phrasing from Phase 1 research). Agitate honestly, do not melodramatize, and size it to the traffic: for mostly solution-aware or product-aware readers this shrinks to a sentence.
- Convert capabilities to outcomes: each capability block frames outcome first, mechanism second, with a real screenshot or short clip. Include the capabilities that carry a real buying factor and stop. A bento grid works when capabilities differ in weight (see design-direction.md); a linear sequence works when they form a workflow.
- Kill the "this looks complicated" objection: show the path from signup to value as the sequence it genuinely is, numbered only because it truly happens in order.
- Disclose the pricing model at minimum: free tier, trial, starting price. Hiding pricing entirely is a known objection generator for self-serve products. Use the pricing skill if packaging is undecided.
- Answer the Phase 1 objection map where each objection arises: security, data handling, migration, lock-in. Real answers, not reassurance noise; the FAQ collects only the leftovers (rule 11).
- Close by restating the primary outcome in one line with the primary CTA, optionally paired with the lowest-friction secondary (docs, changelog).

**Proof requirements.** Two registers, both required. A fast trust signal legible to cold traffic: logos, named users, a hard number. And deep proof for the evaluating reader: one or two full testimonials with name, role, and a specific result. Specific beats voluminous; one quote with a number outranks six adjectives. The hero carries the primary CTA, so shared constraint 2 already puts a proof element within the first viewport; the objection map picks its shape and position.

**CTA policy.** Default policy. Navigation: yes, standard. Footer: full.

**Ordering constraints.** Adds to the shared set:

- The pricing model is disclosed before the final ask. A reader who reaches the close still wondering whether there is a free tier is carrying the exact objection this page type generates most.
- With mostly-cold traffic, the problem is established before the capability story; with solution-aware or product-aware traffic the problem section shrinks or moves late, and the spec records which and why.

**Optional jobs** (add when they carry a real buying factor, do not pad): an **integrations / works-with-your-stack** strip (real logos of the tools it connects to), since "does it fit my stack" is a common SaaS objection; and a **built-for / use cases** self-identification block ("For marketers who...", "For engineers who...") when the product serves distinct personas who need to see themselves.

**Sales-led / enterprise variant.** For a B2B page aimed at a buying committee rather than self-serve, the contract gains jobs: use cases by role or department, a dedicated **security and compliance** treatment (not folded into the FAQ), the integrations strip, and an **ROI / value** case. Replace the pricing disclosure with "talk to sales" only when pricing is genuinely quote-based, and make the primary CTA a demo or contact rather than a trial. Record the variant and every added job in the spec so the gates audit the right rules.

---

## campaign-landing

For dedicated landing pages and long-form sales pages: paid traffic, launch pages, workshop and course offers, lead magnets. One traffic source, one intent, one action.

**Goal.** The single conversion the campaign exists for.

**Buyer entry states.** Exactly one, and the traffic source names it; that is the point of a campaign page. The source's awareness state sets the narrative shape. Unaware and problem-aware traffic needs the full persuasion arc (problem, failed alternatives, mechanism) before an offer means anything. Solution-aware traffic already knows what failed and starts at the mechanism. Product-aware retargeting traffic wants demonstration, offer, and risk reversal; walking those readers through problem agitation is dead weight they scroll past. The spec states the source, its awareness state, and which jobs that state strikes.

**Jobs the page must do.** The middle jobs are awareness-conditional; the spec says which apply and why.

- Open with the promise or the pain in source-matched language; the subhead stakes the claim.
- Establish what it costs the reader to leave this unsolved. Specific, honest, written from inside their situation. (Unaware and problem-aware traffic; later states compress or cut it.)
- Name what they have already tried and why it did not work. This is where the reader decides you understand them. (Chiefly problem-aware traffic; product-aware readers skip it.)
- Name the mechanism: why this works when those did not. The unique method, named. For offers like workshops and coaching, the mechanism is the methodology, not the person's resume.
- Show it working: walkthrough, curriculum, sample, before/after. Concrete artifacts beat descriptions.
- Itemize the offer exactly: what they get, with the price framed against the cost of the problem. No fake strikethrough pricing.
- Reverse the risk: guarantee, refund terms, or "what happens after you click". Reduce anxiety at the moment of commitment.
- Apply honest urgency: real deadlines, real cohort caps, or nothing. Fabricated scarcity fails the integrity gate.
- Collect the final objections, including the awkward ones (time commitment, refunds, "is this for me if...").
- Close with promise, proof element, button.

**Proof requirements.** Testimonials with names and outcomes, case results, credentials. The heaviest proof on the page sits immediately before the offer; this archetype is where shared constraint 3 earns its keep. Every CTA repetition keeps a proof element within one viewport (rule 4).

**CTA policy.** One action, no competitors. **No site navigation**: no header menu, no footer link farm; every exit path competes with the CTA. The CTA repeats after every major proof or objection block, identical wording each time. Forms: minimum viable fields (3 is the baseline; 4 to 6 costs roughly 10 to 25 percent of completions, 7 or more costs 25 to 50 percent); every field added must justify itself against the conversion data in conversion-rules.md, and past a few fields, prefer a multi-step form with a progress indicator.

**Ordering constraints.** Adds to the shared set:

- Message match binds at full strength (shared constraint 8): the hero uses the same language as the ad, post, or email that sent the reader. If the source says "stop getting passed over for promotions", the page does not open with "career acceleration platform".
- Whatever subset of problem, failed alternatives, mechanism, and demonstration the awareness state keeps appears in that relative order. The arc may be pruned from the front; it never runs backward, because a mechanism explained before the problem it solves persuades no one.
- The offer is not itemized before the mechanism is established (shared constraint 4, felt hardest here: the reader must know why it works before hearing what it costs).

Length: long-form for cold traffic and heavy decisions, compressed for warm sources and simple lead magnets. Awareness state and price set the density, not the archetype.

---

## mobile-app

For iOS/Android apps. The page's job is to bridge to the store listing, and to serve desktop visitors who cannot install right now.

**Goal.** Store install. For desktop visitors the same conversion routes through send-to-phone (QR code or badge link): one goal with a device-conditional path, never a second competing action.

**Buyer entry states.** Two dimensions decide the order here, and only one of them is awareness. Single-source traffic from an ad or a post arrives product-aware, and message match binds (shared constraint 8). Category browsers arrive solution-aware, already comparing apps, and raise "why this one over the others" first; in a crowded category the differentiator belongs in or immediately after the hero, not mid-page. The second dimension is device: a mobile visitor can convert this minute, while a desktop visitor cannot install at all, so for them the page's whole job is the send-to-phone bridge. The spec states which awareness state and which device mix dominate.

**Jobs the page must do.**

- State what the app does and for whom, with store badges (App Store / Google Play) and a device-framed screenshot or short screen recording of the core loop. On desktop viewports, a QR code sits next to the badges.
- Walk the primary use case in screenshot-led blocks with captions in outcome language. Keep copy aligned with the ASO keyword set (use the aso skill if installed) so the page and the listing reinforce each other.
- Name the differentiator: the one thing competing apps in the category do not do. For privacy-forward apps this is the privacy posture, stated plainly: what is collected, what is not, where data lives.
- Answer platform and requirements: OS versions, offline behavior, account requirements, price and IAP model. Answering this on the page prevents store-page bounce.

**Proof requirements.** Ratings proof when creditable: star rating, review count, one or two short review quotes, real ones, attributed as the store displays them. After ratings, the strongest proof is the product itself: the core-loop recording shows the app doing the thing, and carries the page when ratings are still thin. Cut thin proof rather than pad it.

**CTA policy.** Default policy, with the store badges as the primary CTA; the desktop QR is the same action's device path, not a competitor. Badges (and the desktop QR) repeat at the close with one line restating the outcome. Navigation: minimal (Support, Privacy).

**Ordering constraints.** Adds to the shared set:

- Store badges land above the fold in the hero; on desktop viewports the QR code lands with them.
- For solution-aware traffic in a crowded category, the differentiator appears in or immediately after the hero.
- Platform and requirements are answered before the last badge repetition; an answer the reader meets after the final ask prevents nothing.

Page weight: very low, total. Most traffic is mobile.

---

## course-sales

For courses, workshops, cohorts, and other paid training with a defined start and end. The reader is buying a transformation, not a curriculum; pages that describe the course lose to pages that sell the outcome.

**Goal.** Enrollment, or application for high-ticket cohorts.

**Buyer entry states.** Problem-aware is the classic state: the reader owns the gap and has tried effort alone, so the full arc (gap, failed paths, method) has to land before an offer means anything. Solution-aware readers are comparing courses and paths; they start at the method and the curriculum, and the gap compresses to a sentence. Product-aware traffic, usually the instructor's own audience on a launch list, arrives because of the person: the instructor may open the page, the arc compresses to method, results, and logistics, and message match binds to the launch emails (shared constraint 8). The spec states which state dominates and which arc jobs it strikes.

**Jobs the page must do.** The arc jobs are awareness-conditional; the spec says which apply and why.

- Name the transformation, with the timeframe if honest ("from overlooked to short-listed in eight weeks" beats "an 8-module career course"), and who it is for. Include the next cohort date if cohort-based.
- Establish the gap: where the reader is now versus where they want to be, in their words, and why effort alone has not closed it. The obstacle is usually missing structure or missing feedback, not missing motivation. (Chiefly problem-aware traffic; later states compress it.)
- Name why existing paths fail: free YouTube, certifications that did not move the needle, generic advice. Concede what those are good for; position the course against their real gaps. (Problem-aware traffic; solution-aware readers have already concluded this.)
- Name the method: the mechanism that produces the transformation. The method carries the credibility; the resume supports it, not the reverse.
- Present the curriculum as outcomes, module by module: "after this module you can X", never lesson counts and video minutes. Include format logistics: live vs recorded, duration, time commitment per week, tools required.
- Establish the instructor: short, proof-dense, third or first person consistently. Years, named employers and clients within what can be said, student results. For product-aware audience traffic the instructor is the hook and may open the page.
- Show student results (the heaviest proof; see Proof requirements). If none exist yet, do not fabricate: first-cohort pages substitute the instructor's own results and a founding-cohort framing.
- Itemize the offer: everything included (modules, calls, community access, templates, recordings), with the price framed against the cost of staying stuck. Payment plans materially lift conversion for prices above a few hundred dollars; offer one when economics allow.
- Reverse the risk: a guarantee with exact terms. 30 days is the floor expectation; longer signals confidence. High-ticket application-based offers may replace the guarantee with the application itself as risk filter; say so plainly.
- Apply honest urgency: cohort start dates and real seat caps are legitimate; evergreen self-paced courses skip urgency rather than faking it.
- Collect the leftover objections: time commitment, prerequisites, refund terms, "what if I fall behind", "is this for me if [edge case]".
- Close with the transformation restated, the strongest single proof element, and the button.

**Proof requirements.** Student results are the heaviest proof on the page: named testimonials with specific outcomes, video when available, placed immediately before the offer. Fabricated or borrowed results fail the integrity gate; the honest first-cohort substitute is the instructor's own results under a founding-cohort framing. Instructor credibility is supporting proof: it backs the method, and it stops standing in for student results once those exist.

**CTA policy.** Campaign-landing's policy applies whole: one action, identical wording each repetition, no site navigation, no footer link farm. Enrollment goes straight to checkout; applications ask the minimum needed to qualify.

**Ordering constraints.** Adds to the shared set:

- Whatever subset of gap, failed paths, method, and curriculum the awareness state keeps appears in that relative order. The arc prunes from the front; it never runs backward.
- Student results sit immediately before the offer (shared constraint 3, made specific: on this page the heaviest proof is always student results, or their first-cohort substitute).
- The offer is not itemized before the method is established (shared constraint 4; a reader who hears the price before the mechanism prices it against nothing).

Length: under roughly $200, a focused page converts; above roughly $500, buyers expect a full long-form treatment with a detailed curriculum breakdown. Well-built course pages convert in the 5 to 15 percent range from warm traffic; cold-traffic expectations are far lower. Price and awareness state set the density, not the archetype.

---

## membership-community

For paid communities, memberships, and subscription groups (Skool, Circle, Discord-based, or self-hosted). The product is access to people plus ongoing material; the page must prove the thing is alive, because the reader's core fear is paying for a ghost town.

**Goal.** Join. Curated communities may make it join-waitlist or apply.

**Buyer entry states.** Every state arrives skeptical of ghost towns; that fear organizes this page regardless of awareness. Problem-aware readers know something is missing but not that this room exists; the who-gathers-here story has to land before any inventory of inclusions can matter. Solution-aware readers are comparing communities and raise aliveness and fit first, so the artifact proof and the not-for line move early. Product-aware readers come for the founder (a podcast appearance, a following); the founder job moves forward, and the page must still prove the room is alive without them in it, because a room that is only its founder is a newsletter with extra steps. The spec states which state dominates.

**Jobs the page must do.**

- Say who gathers here and what membership changes for them. Member count and activity numbers appear only if creditable.
- Draw the not-for line explicitly: wrong stage, wrong goals, wrong expectations. It qualifies buyers, reduces churn, and reads as confidence; it earns more trust than any superlative could. (No collision with shared constraint 9: the not-for list turns away readers the room would fail, not qualified ones.)
- Prove the room is alive with artifacts: real screenshots of real threads, wins, and calls, member details redacted as needed. Show the artifact, not an illustration of "community"; a short screen recording of scrolling the feed outperforms any copy here. Aliveness proof may interleave beside claims across the page instead of sitting quarantined in one section.
- Itemize what membership includes: the community itself, calls and their cadence, courses or classroom content, templates, events, direct access to the founder and at what level. Be precise about cadence; "monthly calls" is a promise the page is making.
- Establish the founder: why this person's room is worth being in, their field history, what they share inside, how present they actually are. Presence claims must be honest; "I answer every post" is verifiable by members within a week.
- Show member outcomes: named wins with specifics (the role landed, the raise, the first client).
- Disclose pricing: monthly and/or annual, what each includes, founding-member pricing only if real and time-bound. State cancel-anytime plainly; for recurring offers, ease of leaving is a buying factor.
- Collect the leftover objections: time required to get value, lurker-friendliness, refund and cancel mechanics, platform logistics, privacy of what members post.
- Close with one line on what changes the week they join.

**Proof requirements.** The artifact is the proof: screenshots and recordings of the actual room, and they must be current. A screenshot of a busy week eight months ago fails the integrity gate if the room has since gone quiet. Named member outcomes with specifics carry the commitment decision; member counts appear only when creditable.

**CTA policy.** Default policy. Navigation: none or minimal.

**Ordering constraints.** Adds to the shared set:

- The reader sees the room alive (artifact proof, not counts) before pricing is disclosed. The ghost-town fear is this page's load-bearing objection, and shared constraint 6 answers it where it arises: early, in place, never left to the FAQ.
- Member outcomes precede the pricing disclosure.

---

## newsletter-capture

For mailing list and newsletter signups, free or as the top of a paid funnel. The entire page exists to make one exchange feel obviously worth it: an email address for a specific, recurring value.

**Goal.** Email signup. Dedicated newsletter pages convert dramatically better than embedded forms; double-digit rates are achievable with matched traffic.

**Buyer entry states.** Warm to the writing, cold to the commitment, almost always: the reader just finished one piece, heard the writer on a podcast, or took a recommendation, and is deciding whether one good sample earns a recurring slot in their inbox. Content-led arrivals weigh that sample against inbox anxiety, this page type's load-bearing objection, so cadence and length expectations move early. Personality-led arrivals already follow the writer and come for the person; the writer job moves forward and may open the page. Lead-magnet traffic arrives for the artifact and takes the subscription as the exchange; message match binds to the promise that sent them (shared constraint 8). Every state shares the same fear, one more thing to keep up with, and the page answers it with honesty about frequency and length, not with enthusiasm.

**Jobs the page must do.**

- State the exchange in one or two lines: what the reader gets, how often, and who it is for ("One exploitable misconfiguration, every Tuesday, for people who defend networks"). The email field and button sit with it in the hero; the form IS the page.
- Show what is inside: concrete samples of the kind of thing a subscriber receives, written as specifically as the actual issues. Vague category promises are what inbox anxiety feeds on.
- State frequency and length expectations plainly ("5 minutes, weekly"). This is the load-bearing objection answered in place (shared constraint 6), not a formality.
- Let them taste it: link one or two best past issues (the strongest proof available; see Proof requirements).
- Establish the writer: a few lines on why this person's signal is worth inbox space. For personality-led traffic the writer is the hook and may open the page.
- Close with the field and button again, the promise restated, and the privacy position in one line: no sharing, unsubscribe anytime.
- Specify the post-conversion moment (the shared requirement above): the confirmation page delivers best-issue links or the promised lead magnet immediately and says when the first issue lands.

**Proof requirements.** The strongest proof available is the writing itself: one or two best past issues, linked, let the reader taste exactly what they are subscribing to. Subscriber count when creditable; reader quotes and recognizable readers or "read by people at X" only when real. A proof element rides in the hero viewport with the form (see Ordering constraints).

**CTA policy.** Default policy, with the signup form as the primary CTA; it appears in the hero and repeats at the close. The form takes a single field: email. Every additional field costs signups (rule 7). Navigation: none. Total page weight: minimal; this page gets linked from everywhere.

**Ordering constraints.** Adds to the shared set:

- The form lands in the hero, and a proof element lands in the same viewport with it. This is the one contract whose form precedes everything else, so shared constraints 2 and 7 can only be satisfied by proof that rides with the form rather than waiting below: a creditable count, a reader quote, or the taste-it link beside the field.
- Frequency and length expectations are set before the final form repetition; a reader who reaches the close still wondering what this costs their attention is carrying the exact objection this page type generates most.

---

## personal-home

For a person: consultant, builder, speaker, writer. The reader arrived from a talk, a post, a podcast, or a search of the name, and is answering one question: is this person worth my next ten minutes, and what do I do with that interest?

**Goal.** One primary next action, picked deliberately: book a call, subscribe, read the work, or follow. Everything else is secondary.

**Buyer entry states.** Two arrivals dominate, and they want different openings. Referred readers come from one artifact (the talk, the post, the episode) carrying one facet of the person and wanting the rest of the picture; the page connects to what sent them (shared constraint 8) and widens from there. Name-searchers are doing diligence: a prospective client, a hiring manager, a podcast booker checking that the person is substantial, and they reach for proof of work first. The chosen primary action shapes the order too: a book-a-call page fronts qualification and current focus; a read-the-work page fronts the work. The spec states which arrival dominates and which action was picked.

**Jobs the page must do.**

- Open with the name and one positioning line that says who you help do what ("I help overlooked security engineers get paid like the people they outperform"). Not a job title list.
- Show proof of work: selected, not exhaustive, spanning the work that matters now (projects, companies served, talks, things built, things written). Each item links somewhere real. Curate ruthlessly; a personal page is a portfolio of judgment.
- State current focus: what you are building or taking on now, which doubles as qualification for inbound ("currently advising X kind of company on Y").
- Tell the credibility narrative: a short bio in the owner's actual voice, written like a person and not a LinkedIn summary. Years, the arc, the unusual parts. First or third person, consistently.
- Lay out the routes: the standing offers (work with me, join the community, read the newsletter), each one line plus link; the primary CTA visually leads.
- Make contact direct and simple. State response expectations honestly.

**Proof requirements.** The work is the proof. Real, linked artifacts outrank any claim about them; an item that links nowhere reads as padding and gets cut. Selection is itself the signal: what the owner chose to show is the judgment on display.

**CTA policy.** Default policy, with the deliberately picked primary action leading everywhere it appears; the routes present the secondary offers quietly beside it. Navigation: minimal (Work, Writing, Contact).

**Ordering constraints.** Adds nothing to the shared set. The shared ten already bind, and this page tolerates the widest range of legal orders on the list: a proof-led opening (work before narrative), a narrative-led opening, and a focus-led opening are all legal while the hero passes the 5-second test. The page is the person; which facet opens is a genuine choice, and the entry state makes it.

This archetype tolerates the most aesthetic risk on the whole list; the page is the person, and a distinctive direction (see design-direction.md) does more work here than anywhere else.

---

## pricing-page

For a dedicated pricing page on a product with public pricing. The reader arrives closer to a decision than on any other page the funnel owns; the page's job is to end deliberation, not to restart the pitch.

**Goal.** Tier selection: the reader picks a plan and starts the checkout, trial, or upgrade that plan defines.

**Buyer entry states.** Nobody lands here cold, but the states differ in what they are deciding. Evaluators arrive from the homepage or the nav, sold enough to ask what it costs, carrying the which-tier-is-me question. Cross-shoppers arrive solution-aware from a comparison or a search, checking the price against a shortlist before investing attention anywhere else; for them the prices are the first content, not the conclusion. Existing customers arrive at a plan limit with upgrade intent, asking what the next tier adds and whether anything they built breaks on the way up. The spec states the mix; the upgrade state in particular adds jobs the other two never raise.

**Jobs the page must do.**

- Show the tiers within the first scroll: name, price, billing unit, who each tier is for, and the recommended tier visually marked (good-better-best; see Pricing psychology in `references/conversion-rules.md`). A pricing page that opens with a manifesto before showing a price fights the intent that brought the reader.
- Say who each tier is for in one line per tier, before what it includes. Buyers self-select by situation faster than by feature count, and a tier that names its buyer answers which-tier-is-me where it arises (shared constraint 6).
- Anchor before the ask: the higher tier, or the cost of the problem, is visible before or beside the target price so the target reads as reasonable against it.
- Make adjacent tiers legibly different: the one or two capabilities that move a buyer up a tier, stated plainly. The exhaustive feature matrix serves the completeness reader below the cards or behind a toggle; it never substitutes for the legible difference.
- Answer the billing mechanics inline, because they are this page's standing objections: monthly versus annual and the real saving if one exists, what counts as a seat, what happens at a limit, proration on upgrade, and the downgrade and cancel path stated plainly. Ease of leaving is a buying factor for recurring offers.
- Name the free path plainly if one exists: free tier, trial length, what requires a card and what does not, what ends when the trial ends.
- For the upgrade state: what the next tier adds over the reader's current one, and confirmation that nothing they carry is lost on the way up.
- State the sales path honestly when one exists: "talk to sales" replaces a price only when pricing is genuinely quote-based, and a hidden price on a page of public prices carries its stated reason (volume, procurement, compliance) beside it.
- Reverse the risk at the cards: trial terms, refund terms, cancel-anytime, in or immediately beside the tier cards rather than in a distant section (shared constraint 5: the cards are the moment of commitment).
- Collect the leftovers: procurement questions for B2B (invoicing, purchase orders, security review), edge-case plan questions, and the honest answer to what happens when a buyer outgrows or shrinks out of a tier.

**Proof requirements.** The tier cards are the ask, so proof rides in their viewport (shared constraint 2). The strongest form is a quote that names value at a specific tier, or the moment that justified an upgrade; a creditable customer count or logo row supports. Cost framing (per day, per seat, against the manual alternative) counts as proof only when the reference number is real. No decoy tiers that do not exist, no fake strikethroughs, no invented savings percentages: the integrity gate reads this page closely, because pricing is where fabrication pays best.

**CTA policy.** One primary action per tier, the same verb-first label pattern on every card, the recommended tier's button visually leading. The sales path on a quote-based tier is that tier's action, not a competitor to the others. Navigation: standard; this page lives in the site nav and readers route through it mid-evaluation.

**Ordering constraints.** Adds to the shared set:

- Tier cards land within the first scroll. Shared constraint 4 reads at funnel scope here: the mechanism lives on the pages that route to this one, and a single what-this-is line in the hero restates it for the reader who arrived direct, instead of a mechanism section pushing prices below the fold.
- The anchor is visible before or beside the target price, never after it.
- Billing mechanics are answered before the final CTA repetition; a reader who reaches the last button still wondering what a seat costs at renewal is carrying this page's most common objection.

On this archetype the pricing companion's Phase 2 output also drafts `/pricing.md`, the machine-readable file Gate 6 checks at the site root: a pricing page for human buyers ships one for agentic buyers beside it.

---

## comparison-alternatives

For pages that capture switch intent: "COMPETITOR alternative" pages, "COMPETITOR alternatives" list pages, "product versus COMPETITOR" pages, and third-party comparisons of two products the site owner sells against. The reader already uses or has shortlisted a named competitor; the page meets a comparison already running in their head.

**Goal.** The parent product's primary conversion (trial, demo, install), reached through switch or shortlist intent. The page is measured on that conversion, not on time spent in a table.

**Buyer entry states.** The most solution-aware traffic any archetype receives: the reader knows the category, knows the competitor, and usually arrives from a search whose phrasing names the intent (an "alternative" search is switch intent; a "versus" search is diligence on a shortlist). Two temperatures share that state. The frustrated switcher carries a specific grievance, a price change, a missing capability, a support experience, and wants to know quickly whether this product fixes it. The diligent evaluator is pre-purchase, comparing before committing anywhere, and reads the table closely. Message match binds doubly here (shared constraint 8): to the search phrasing that sent the reader, and to the competitor's own vocabulary, because that vocabulary is the language the reader currently thinks in. Map the competitor's real feature names to ours honestly; renaming their concepts reads as evasion.

**Jobs the page must do.**

- Name the comparison plainly in the hero: which products, for which reader, and whose page this is. Feigned neutrality on a vendor's own domain fails the integrity gate; the honest frame (here is where we win, here is where they do) earns the credibility the rest of the page spends.
- Lead with the wedge: the two or three differences that actually drive switching for this buyer, before any exhaustive matrix. Feature parity is table stakes; the wedge is why the page exists.
- Compare honestly, with the concessions in the table: what the competitor genuinely does better stays in, stated plainly. Conceded weaknesses buy credibility for the claimed strengths (the oss-project concession rule, generalized, and it binds harder here: this page's readers use the competitor and can verify every row).
- Keep every competitor claim current and verifiable: their pricing, plan limits, and features as of a stated check date that rides with the table. A stale row or a strawman comparison fails the integrity gate the moment a reader spots it, and these readers are the ones equipped to.
- Answer the switching cost, the load-bearing objection of switch intent: the migration path, what imports and what does not, time to reach parity with today's setup, what maps to what. A reader convinced by the wedge but silent-treated on migration has not been answered (shared constraint 6).
- Show proof from switchers: testimonials from buyers who made this exact move, with the grievance that moved them named.
- Draw the stays line: the cases where the competitor remains the right choice. It is the not-for list wearing comparison clothes; it turns away only readers this product would fail (no collision with shared constraint 9), and it is the strongest single honesty signal a comparison page can carry.
- When price is compared, compare true cost: tiers, limits, overages, and the migration itself, never a cherry-picked pair of sticker numbers.

**Proof requirements.** Switcher testimonials are the heaviest proof and sit immediately before the ask (shared constraint 3). The table's rows are proof only as far as they are verifiable and dated. Third-party numbers (review-site ratings, category reports) appear only when real, current, and attributed as the source displays them.

**CTA policy.** Default policy, with the parent product's primary conversion as the action. Navigation: standard; these pages ride the main site and route evaluators deeper into it.

**Ordering constraints.** Adds to the shared set:

- The wedge precedes the exhaustive table: why to switch comes before row-by-row completeness. A reader who meets forty rows before one reason to care reads the page as homework.
- The hero frame matches the arrival phrasing: an "alternative" search lands on an alternative frame, a "versus" search on a comparison frame (shared constraint 8, applied to the page's own title and hero).
- The migration answer precedes the final ask, and the concessions live in or beside the table, never quarantined below the last CTA.

Seam note: competitor-profiling owns the competitive frame at intake (Phase 0/1); the competitors companion owns these sections' structure and copy in Phase 2/3. This archetype consumes both, and the check date on the table is refreshed per run, not inherited from the last one.

---

## docs-dev-tool-landing

For commercial developer tools: APIs, SDKs, hosted infrastructure, developer platforms. The reader is a practitioner who will decide in the docs, not on the marketing page; the page's job is to get them to a first successful call before the polish can be doubted.

**Goal.** First successful call: a key obtained, the quickstart run, real output seen. Time-to-hello-world is the number this page lives or dies on. Signup is instrumental (it gates the key), never the finish line; a signup that stalls before the first call is this funnel's silent churn.

**Buyer entry states.** Practitioners, in two states. Solution-aware evaluators own the problem, are comparing approaches and vendors, and will open the docs in a second tab before believing anything on the landing page; for them the page competes with its own documentation and wins by getting out of the way. Product-aware arrivals come from a changelog, a colleague, or another tool's docs, half-sold and reaching for the quickstart. Behind the practitioner often stands an economic buyer who approves the invoice; material for that reader (security, compliance, SLA) exists on the page and never leads it. The spec states the mix.

**Jobs the page must do.**

- State what the tool does and what it takes off the reader's plate, in one sentence a practitioner can evaluate for fit. No marketing adjectives; this audience reads them as noise at best and as cover at worst (the oss-project rule, carried whole).
- Show working code within the first scroll: a real request and its real response, in the languages the audience writes, tabbed when there is more than one. For this reader the code block is the product visual, and a fabricated response fails the integrity gate exactly as a fabricated testimonial would.
- Run the quickstart from key to first successful call in the fewest real steps: where the key comes from, what the free tier allows without a card, real commands with real output. The oss-project screen rule carries: a hello-world longer than one screen is an onboarding problem the page cannot fix.
- Put the docs one click from everywhere, starting in the hero region. The docs are this page's deep proof (see Proof requirements); a dev-tool page that hides them behind a demo form has disqualified its most qualified readers (shared constraint 9).
- Show how it works for the trust-evaluating reader: architecture at a glance, data handling, latency and reliability posture, stated plainly. Status page and SLA live here when they exist.
- Disclose pricing: the free tier and its limits, the unit the paid tiers meter, the rough point where the first invoice arrives. Practitioners disqualify silently on hidden pricing, and a page whose only route is a sales call reads as expensive before any price is seen.
- Answer the will-it-last objection: versioning and deprecation policy, who runs it in production, how long it has been running. A practitioner adopting a dependency is underwriting its future.
- Close by repeating the key-and-quickstart action with one line restating the first-call outcome.

**Proof requirements.** The working call is the heaviest proof: real request, real response, runnable when the product allows it. Named production adopters and creditable usage numbers support it. Docs quality is proof this buyer samples directly, so the docs link is this contract's taste-it move (the newsletter-capture rule, generalized). Cut thin proof rather than pad it; the oss-project desperation rule applies unchanged.

**CTA policy.** Default policy, with get-a-key / run-the-quickstart as the primary action. Navigation: standard and docs-forward (Docs, Pricing, Status, Changelog). The enterprise or sales route stays visually quiet beside the self-serve path.

**Ordering constraints.** Adds to the shared set:

- Working code appears within the first scroll; for this audience the 5-second test is passed by code, not by a headline about code.
- The pricing model is disclosed before the final ask (the saas-homepage rule, unchanged).
- The sales route never precedes the self-serve quickstart path; routing a practitioner to a call before a key reads as a tool built for procurement, not for them.

Boundary: an open source core with a hosted commercial tier straddles this contract and oss-project; merge per the compiler (union of jobs, the goal from whichever conversion the page is measured on, strictest policy). A dev tool whose buyer is not its user compiles the saas-homepage enterprise variant instead.

---

## waitlist-coming-soon

For pre-launch pages: the product is being built, gated in a private beta, or announced but not shippable. The page asks for trust before there is a product to earn it, which makes it the purest test of the integrity rules in this file.

**Goal.** A qualified email before the product exists. Qualified is the word doing the work: a waitlist of the mildly curious is a launch-day unsubscribe list, and the honest jobs below cost some signups on purpose so the ones that remain are worth having.

**Buyer entry states.** Almost always single-source: a founder's post, a launch thread, a podcast mention, an early press hit; message match binds (shared constraint 8). Two temperatures arrive from the same source. The intrigued browser spends an email the way pocket change is spent, cheap to give and quick to forget. The pain-carrier has been waiting for someone to build exactly this, and reads the page checking whether these builders understand the problem. The page is written for the pain-carrier; the browser is welcome but never courted with inflation.

**Jobs the page must do.**

- State what is coming, for whom, and the honest state of the product in the hero: building, in private beta, launching on a date. A date appears only when it is real; "coming soon" with no date is more honest than a date that will slip (the urgency doctrine, applied before launch).
- Name the problem and the mechanism: with no product to demonstrate, the reasoning is the pitch. Say why this approach will work where the existing ones have not, concretely enough to be falsifiable. Vague vision copy recruits vague signups.
- Show what actually exists, labeled as what it is: a mockup captioned as a mockup, a prototype clip captioned as a prototype, a build-in-public changelog. A render styled to pass as a shipping product fails the integrity gate; on this page the gate reads hardest, because nothing exists yet for a false impression to be checked against.
- Establish the builders: what they have shipped before, linked and real, and why they own this problem. With zero product proof the founder history carries the page (see Proof requirements).
- Report traction only when creditable: a waitlist count that is real, design partners named with permission, nothing otherwise. A page that shows zero momentum honestly outranks one that manufactures some; manufactured momentum is this archetype's signature fabrication.
- State the exchange plainly: what joining gets (early access, founding pricing, progress updates and their cadence) and when the reader hears next.
- Specify the post-conversion moment: the confirmation delivers something now (the design memo, the demo clip, the first update) and names when the next contact lands, per the shared section and the `thank-you-post-conversion` contract.

**Proof requirements.** The unique problem of this contract: product proof does not exist, and nothing may pretend to be it. The honest inventory is founder history (real and linked), the mechanism's reasoning, artifacts of building (prototype clips, changelog, commits) labeled as artifacts of building, creditable waitlist counts, and named design partners with permission. Everything on that list is checkable, which is the point: this page earns trust by being verifiable at the exact moment lying would be easiest.

**CTA policy.** Default policy; the form takes an email (rule 7). Qualification fields are the one sanctioned addition, and only when access is genuinely limited and selection genuinely happens; say so beside the field. Navigation: none or minimal; there is nowhere else worth sending them yet.

**Ordering constraints.** Adds to the shared set:

- The product's honest state (building, beta, date) is stated before the form is reached; a signup that believed it was getting a product today is a churn already booked.
- The mechanism precedes any founding-pricing ask (shared constraint 4 in pre-launch form: reasoning before commitment).
- Traction proof, when it exists, rides in the form's viewport; when none exists, the founder proof takes that seat (shared constraint 2, satisfied with the thinnest inventory in this file).

Boundary: a newsletter page sells a recurring thing that already exists and can be tasted; this page sells access to a thing that cannot be tasted yet. When a pre-launch page also runs a content list (building-in-public updates as the draw), merge with newsletter-capture per the compiler.

---

## event-webinar

For registration pages against a real date: webinars, live workshops, launch events, conference sessions, live demos. Free registration is the default frame; a paid ticket merges campaign-landing's offer jobs (see the boundary note).

**Goal.** Registration: a name and an email committed against a date. The goal behind the goal is attendance; a registration that never shows up converted nothing, so this contract treats the calendar add and the reminder path as part of the conversion, not as aftercare.

**Buyer entry states.** Single-source traffic dominates (an email to a list, a post, a partner's newsletter), and message match binds (shared constraint 8). Two states share it. Host-led arrivals come for the person or the brand, are mostly sold, and need the logistics fast: when, how long, what happens live. Topic-led arrivals come for the problem the session covers and need the payoff made concrete before they will trade a calendar slot for it. Distance to the date changes the page: weeks out, the session's value does the selling; days out, the date itself is the urgency, and it is honest by nature.

**Jobs the page must do.**

- Pass the 5-second test with the date in it: what the session is, who it is for, when (date, start time, named timezone), how long, on what platform, with registration in view. On this page the when is part of the what.
- Sell the session, not the topic: what an attendee walks away with, stated concretely ("leave with your first detection rule running" outranks "learn about detection engineering"). The transformation framing from course-sales, scaled to an hour.
- Say why live beats the recording for this session: the Q&A, the live teardown, the thing that only happens in the room. This is the load-bearing objection for the busy reader deciding whether to attend or wait for the replay (shared constraint 6: answer it in place).
- State the replay policy plainly, whichever way it goes. A page that hides an existing replay to force attendance spends trust it will want back at the next event; a page with no replay says so and lets that be the honest urgency it is.
- Establish the presenter in proof-dense terms: why this person, on this topic, is worth the hour.
- Apply the urgency that is native here: the date is real, a capacity cap when one exists, a registration deadline when one is real. This is the one archetype where urgency is structural rather than applied, and it still must be checkable; a seats-remaining counter with no cap behind it fails the integrity gate.
- Answer the logistics objections where they arise: cost if any, what is needed to attend, whether cameras are on, whether the session is recorded, who else will be in the room when that matters.
- Specify the post-conversion moment: the confirmation lands the calendar file (.ics or provider add-link) as the immediate deliverable and names what arrives by email and when, per the shared section and the `thank-you-post-conversion` contract. The registration is not done until the session is on the calendar.

**Proof requirements.** Presenter credibility carries the ask. The strongest artifact is a clip from a past session (the taste-it move again: let the reader sample the room). Attendee quotes and outcomes appear when real and attributed; a creditable registered-or-attended count supports. First-session pages substitute the presenter's own body of work, the course-sales first-cohort rule scaled down.

**CTA policy.** Default policy, with registration as the single action. The form takes a name and an email as the baseline; every added field costs registrations (rule 7), and a qualification field is sanctioned only for capacity-capped sessions that genuinely select. Navigation: none for single-source campaign traffic, minimal otherwise.

**Ordering constraints.** Adds to the shared set:

- Date, time, and duration appear in the hero; a reader who scrolls to learn when the event is has been made to work for the page's most basic fact.
- The replay policy is stated before the final ask; the attend-or-wait decision is this page's standing objection and may not be left to the confirmation email.
- For paid tickets, campaign-landing's constraint carries: the offer is not itemized before the session's mechanism (what happens live and why it works) is established.

Schema note: Gate 6's JSON-LD templates include `Event`; the Phase 2 spec supplies its real values (startDate and endDate with timezone, attendance mode, location URL, offers when the ticket is paid) so the schema mirrors the visible page exactly, per the ship-gates rule that forbids schema-only content and invented dates, prices, or seat counts.

Boundary: a paid ticket makes this a purchase against a date; merge with campaign-landing per the compiler (registration stays the goal, the offer and risk-reversal jobs join, and the strictest CTA policy wins, which here means campaign-landing's no-nav rule). A recurring session series with no fixed date is a different promise; it compiles newsletter-capture or saas-homepage instead. This contract exists for a real date.

---

## thank-you-post-conversion

For the page a just-converted reader lands on: the signup confirmation, the checkout success, the application-received screen. Every archetype in this file has this moment (the shared post-conversion section above binds them all), and it is the highest-trust moment the funnel ever produces. When the parent page's next screen is a page this skill can build, it is built to this contract in the same pass.

**Goal.** Make the conversion stick, then spend the moment once: the next action that turns a signup into a subscriber who reads, a purchase into a first use, an application into a kept appointment. Pick one as primary, derived from the parent page's goal.

**Buyer entry states.** One state, unique in this file: converted. The reader just handed over an email, money, or an application, and arrives carrying two questions in order: did it work, and what happens now. Paid conversions add a third, the remorse window: the quiet did-I-make-a-mistake that opens the moment the card is charged. Awareness states do not apply; the parent conversion defines the sub-state (just-subscribed, just-purchased, just-applied, just-booked), and each changes what making it stick means. The spec names the parent page and the sub-state.

**Jobs the page must do.**

- Confirm the conversion unambiguously in the first line: what just happened, stated as fact. Every other job waits until the did-it-work anxiety is dead.
- Deliver something immediately: the promised artifact, the best of what they signed up for, or the first concrete step already underway. This is the shared section's second obligation and this page's center; a thank-you page that only thanks is a dead end wearing manners.
- Set expectations for what arrives when, and from whom: the first issue, the onboarding email, the reply to the application, named specifically enough that the reader recognizes it when it lands and notices when it does not.
- Name the single next action and make it the page's one CTA: the confirm click for double opt-in flows, the calendar add, the first-run step, the install.
- Spend the moment's trust on at most one honest ask beyond the next action, when one worth making exists: a one-question survey (what nearly stopped you feeds `voc.md` with the objection map's ground truth), a share, or a genuinely related next offer. At most one; the moment is easily overspent, and a thank-you page with four asks converts none of them.
- For paid conversions, close the remorse window: restate the guarantee or refund terms and say when and how support answers. Reassurance is cheap here and expensive later, in a refund request.

**Proof requirements.** The lightest in this file: the conversion already happened, and proof serves only whatever ask this page makes. An upsell ask carries proof adjacency like any CTA (shared constraint 2); an activation ask's proof is the product doing the thing. Padding this page with trust signals the reader no longer needs reads as insecurity after the sale.

**CTA policy.** One primary next action. In double opt-in flows the confirm instruction IS the hero and the only call to action above the fold, because an unconfirmed signup is a conversion the funnel already lost; every other ask waits below it. Navigation: minimal or none; the page's job is forward motion, not a return to browsing.

**Ordering constraints.** Adds to the shared set:

- Confirmation precedes everything, including delivery and any ask; a reader unsure whether the purchase worked buys nothing else.
- Delivery precedes any additional ask: give before asking again.
- On paid conversions the remorse-window jobs (guarantee restatement, support path) appear before any upsell.

The 5-second test (shared constraint 1) translates naturally here: what just happened, what you get, what to do next, readable at a glance by someone whose only question is whether it worked.

---

_Provenance: reconciled 2026-07-07 against marketingskills 2.3.0 (copywriting page templates, cro, product-marketing). The archetype structures are page-foundry's own opinionated superset; the integrations, built-for, and enterprise/B2B patterns were added from copywriting's copy-frameworks. pricing-page, comparison-alternatives, and thank-you-post-conversion added 2026-07-18 from the v3.0 catalog audit (`plans/research/pf-archetypes.md` section 4); docs-dev-tool-landing, waitlist-coming-soon, and event-webinar added 2026-07-18 from the same audit. Re-reconcile when those companions change._
