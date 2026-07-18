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

## Archetype mapper

Current archetypes: `oss-project`, `saas-homepage`, `campaign-landing`, `mobile-app`, `course-sales`, `membership-community`, `newsletter-capture`, `personal-home`.

When the right archetype is not obvious, ask (or infer from the brief) three questions:

1. **What is the conversion?** Install/star → oss-project. Trial/demo → saas-homepage. One-time purchase of a defined offer → campaign-landing or course-sales. Recurring subscription to people + content → membership-community. Email address → newsletter-capture. Store install → mobile-app. "Know who I am, then one action" → personal-home.
2. **Is the relationship one-time or ongoing?** One-time purchases sell a transformation with an endpoint (course-sales, campaign-landing). Ongoing subscriptions sell a living thing and must prove it is alive (membership-community, saas-homepage, newsletter-capture).
3. **Where does the traffic come from?** A single controlled source with one intent pushes toward campaign-landing's contract (no nav, message match binding) regardless of what is being sold. Mixed/organic traffic pushes toward homepage contracts (nav, fuller story).

**Straddling.** A page straddling two archetypes gets a merged contract: the union of both jobs lists, the goal from the archetype matching the CONVERSION, and the strictest applicable CTA and navigation policy. A paid workshop sold from one ad campaign merges campaign-landing and course-sales: campaign-landing's goal and no-nav policy, plus the curriculum and instructor jobs. A paid newsletter merges newsletter-capture and membership-community the same way. Record the merge in the page spec so the gates audit the right constraints.

**Nothing fits.** The shared constraints plus `references/conversion-rules.md` already amount to a contract; fill the six blocks by hand, state in the spec that the page is off-archetype, and when the same hand-filled contract recurs across runs, promote it into this file using the schema above.

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

Conversion goal: store install (mobile visitors) or send-to-phone (desktop visitors).

1. **Hero.** What the app does and for whom, store badges (App Store / Google Play) above the fold, device-framed screenshot or short screen recording of the core loop. On desktop viewports, add a QR code next to the badges.
2. **Ratings proof.** Star rating and review count if creditable; pull one or two short review quotes (real ones, attributed as the store displays them).
3. **Core loop in screens.** 3 or 4 screenshot-led blocks walking the primary use case. Captions in outcome language. Keep copy aligned with the ASO keyword set (use the aso skill if installed) so the page and the listing reinforce each other.
4. **Differentiator block.** The one thing competing apps in the category do not do. For privacy-forward apps, the privacy posture goes here, stated plainly: what is collected, what is not, where data lives.
5. **Platform and requirements.** OS versions, offline behavior, account requirements, price/IAP model. Answering this on the page prevents store-page bounce.
6. **Final CTA.** Badges and QR again, one line restating the outcome.

Navigation: minimal (Support, Privacy). Keep total page weight very low; most traffic is mobile.

---

## course-sales

For courses, workshops, cohorts, and other paid training with a defined start and end. The reader is buying a transformation, not a curriculum; pages that describe the course lose to pages that sell the outcome.

Conversion goal: enrollment (or application, for high-ticket cohorts).

Length scales with price: under roughly $200, a focused page converts; above roughly $500, buyers expect a full long-form treatment with a detailed curriculum breakdown. Well-built course pages convert in the 5 to 15 percent range from warm traffic; cold-traffic expectations are far lower.

1. **Hero.** The transformation, named, with the timeframe if honest ("from overlooked to short-listed in eight weeks" beats "an 8-module career course"). Who it is for. Primary CTA. Next cohort date if cohort-based.
2. **The gap.** Where the reader is now versus where they want to be, in their words, and why effort alone has not closed it. This is the problem section reframed for education: the obstacle is usually missing structure or missing feedback, not missing motivation.
3. **Why existing paths fail.** Free YouTube, certifications that did not move the needle, generic advice. Concede what those are good for; position the course against their real gaps.
4. **The method.** The named mechanism that produces the transformation. For an instructor with deep field history, the method carries the credibility; the resume supports it, not the reverse.
5. **Curriculum as outcomes.** Module-by-module, framed as "after this module you can X", not lesson counts and video minutes. Include format logistics: live vs recorded, duration, time commitment per week, tools required.
6. **Instructor.** Short, proof-dense, written in third person or first consistently. Years, named employers/clients within what can be said, student results.
7. **Student results.** The heaviest proof on the page, placed immediately before the offer. Named testimonials with specific outcomes; video testimonials when available. `[TK]` and cut if none exist yet; first-cohort pages substitute the instructor's own results and a founding-cohort framing.
8. **The offer.** Everything included, itemized (modules, calls, community access, templates, recordings), with the price framed against the cost of staying stuck. Payment plans materially lift conversion for prices above a few hundred dollars; offer one when economics allow.
9. **Guarantee.** 30 days is the floor expectation; longer signals confidence. State the exact terms. High-ticket application-based offers may replace the guarantee with the application itself as risk filter; say so plainly.
10. **Honest urgency.** Cohort start dates and real seat caps are legitimate urgency; use them. Evergreen self-paced courses skip this section rather than faking it.
11. **FAQ.** Time commitment, prerequisites, refund terms, "what if I fall behind", "is this for me if [edge case]".
12. **Final CTA block.** Transformation restated, strongest single proof element, button.

Navigation: none (treat as campaign-landing). Forms: enrollment goes straight to checkout; applications ask the minimum to qualify.

---

## membership-community

For paid communities, memberships, and subscription groups (Skool, Circle, Discord-based, or self-hosted). The product is access to people plus ongoing material; the page must prove the thing is alive, because the reader's core fear is paying for a ghost town.

Conversion goal: join (or join waitlist / apply, for curated communities).

1. **Hero.** Who gathers here and what membership changes for them. Member count and activity only if creditable. Primary CTA.
2. **Who it is for, who it is not for.** An explicit not-for list (wrong stage, wrong goals, wrong expectations) qualifies buyers, reduces churn, and reads as confidence. This section earns more trust than any superlative could.
3. **Inside the community.** Real screenshots of real threads, wins, and calls (redact member details as needed). Show the artifact, not an illustration of "community". A short screen recording of scrolling the feed outperforms any copy here.
4. **What membership includes.** Itemized: the community itself, calls and their cadence, courses or classroom content, templates, events, direct access to the founder and at what level. Be precise about cadence; "monthly calls" is a promise the page is making.
5. **The founder.** Why this person's room is worth being in: field history, what they share inside, how present they actually are. Presence claims must be honest; "I answer every post" is verifiable by members within a week.
6. **Member outcomes.** Named member wins with specifics (the role landed, the raise, the first client). Place before pricing.
7. **Pricing.** Monthly and/or annual, what each includes, founding-member pricing only if real and time-bound. Cancel-anytime stated plainly; for recurring offers, ease of leaving is a buying factor.
8. **FAQ.** Time required to get value, lurker-friendliness, refund/cancel mechanics, platform logistics, privacy of what members post.
9. **Final CTA.** One line on what changes the week they join, button.

Navigation: none or minimal. Integrity note: activity proof must be current; a screenshot of a busy week eight months ago fails the integrity gate if the room has gone quiet.

---

## newsletter-capture

For mailing list and newsletter signups, free or as the top of a paid funnel. The entire page exists to make one exchange feel obviously worth it: an email address for a specific, recurring value.

Conversion goal: email signup. Dedicated newsletter pages convert dramatically better than embedded forms; double-digit rates are achievable with matched traffic.

1. **Hero.** What the reader gets, how often, and who it is for, in one or two lines ("One exploitable misconfiguration, every Tuesday, for people who defend networks"). Email field plus button directly in the hero; the form IS the page. Single field only: email. Every additional field costs signups.
2. **What is inside.** Three or four concrete bullets of the kind of thing a subscriber receives, written as specifically as the actual issues. Frequency and length expectations stated ("5 minutes, weekly") because inbox anxiety is the real objection.
3. **Proof.** Subscriber count when creditable, reader quotes, recognizable readers or "read by people at X" only when real. A link to one or two best past issues is the strongest proof available: let them taste it.
4. **About the writer.** Two or three lines; why this person's signal is worth inbox space.
5. **Final form.** Repeat the field and button with the promise restated. State the privacy position in one line (no sharing, unsubscribe anytime).

After signup, the confirmation/thank-you page is part of this archetype's spec: deliver something immediately (best-issue links or the promised lead magnet) and set expectations for what arrives when.

Navigation: none. Total page weight: minimal; this page gets linked from everywhere.

---

## personal-home

For a person: consultant, builder, speaker, writer. The reader arrived from a talk, a post, a podcast, or a search of the name, and is answering one question: is this person worth my next ten minutes, and what do I do with that interest?

Conversion goal: one primary next action. Pick it deliberately: book a call, subscribe, read the work, or follow. Everything else is secondary.

1. **Hero.** Name, and one positioning line that says who you help do what ("I help overlooked security engineers get paid like the people they outperform"). Not a job title list. Primary CTA.
2. **Proof of work.** Selected, not exhaustive: 3 to 6 items spanning the work that matters now (projects, companies served, talks, things built, things written). Each item links somewhere real. Curate ruthlessly; a personal page is a portfolio of judgment.
3. **Current focus.** What you are building or taking on now, which doubles as qualification for inbound ("currently advising X kind of company on Y").
4. **Credibility narrative.** A short bio in the owner's actual voice, written like a person and not a LinkedIn summary. Years, the arc, the unusual parts. First or third person, consistently.
5. **Routes.** The two or three standing offers: work with me, join the community, read the newsletter. Each one line plus link; the primary CTA visually leads.
6. **Contact.** Direct and simple. State response expectations honestly.

Navigation: minimal (Work, Writing, Contact). This archetype tolerates the most aesthetic risk on the whole list; the page is the person, and a distinctive direction (see design-direction.md) does more work here than anywhere else.

---

_Provenance: reconciled 2026-07-07 against marketingskills 2.3.0 (copywriting page templates, cro, product-marketing). The archetype structures are page-foundry's own opinionated superset; the integrations, built-for, and enterprise/B2B patterns were added from copywriting's copy-frameworks. Re-reconcile when those companions change._
