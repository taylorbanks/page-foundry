# Page Archetypes

Pick exactly one archetype per page. The archetype fixes section order, CTA policy, navigation policy, and proof placement. Deviate only when the user asks, and record the deviation in the page spec.

## Archetype mapper

Current archetypes: `oss-project`, `saas-homepage`, `campaign-landing`, `mobile-app`, `course-sales`, `membership-community`, `newsletter-capture`, `personal-home`.

When the right archetype is not obvious, ask (or infer from the brief) three questions:

1. **What is the conversion?** Install/star → oss-project. Trial/demo → saas-homepage. One-time purchase of a defined offer → campaign-landing or course-sales. Recurring subscription to people + content → membership-community. Email address → newsletter-capture. Store install → mobile-app. "Know who I am, then one action" → personal-home.
2. **Is the relationship one-time or ongoing?** One-time purchases sell a transformation with an endpoint (course-sales, campaign-landing). Ongoing subscriptions sell a living thing and must prove it is alive (membership-community, saas-homepage, newsletter-capture).
3. **Where does the traffic come from?** A single controlled source with one intent pushes toward campaign-landing structure (no nav, message match binding) regardless of what is being sold. Mixed/organic traffic pushes toward homepage structure (nav, fuller story).

**Composition rules.** When a page straddles two archetypes, take the structure (section order, nav and CTA policy) from the archetype matching the CONVERSION, and borrow individual sections from the other. Examples: a paid workshop sold from one ad campaign = campaign-landing structure + the curriculum and instructor sections from course-sales. A paid newsletter = newsletter-capture structure + the pricing and what-you-get sections from membership-community. Record every borrowed section and deviation in the page spec so the gates audit the right rules.

**Nothing fits.** Build a custom spec from the shared rules below plus the conversion rules file, state explicitly that the page is off-archetype, and consider adding the new archetype to this file afterward using the same format (audience, conversion goal, numbered sections, nav policy).

Shared rules for every archetype:

- The hero must pass the 5-second test: what it is, who it is for, what to do next, readable in five seconds by someone who has never heard of the product.
- One primary CTA per page. It may repeat down the page, but it is the same action every time. Secondary actions are visually quiet (text links, ghost buttons).
- Proof lives next to the claim it supports, and within one viewport of every CTA instance.
- Sections appear in the order a skeptical reader raises objections, not the order the builder is proud of features.

---

## oss-project

For open source tools, libraries, and self-hostable software. The reader is a practitioner deciding whether to try it in the next ten minutes.

Conversion goal: install, star, or read the docs. Pick one as primary.

1. **Hero.** Plain statement of what it does and for whom. Install command in a copy-button code block directly in the hero; for a practitioner audience the install command IS the CTA. Version, license, and star badges adjacent. No marketing adjectives.
2. **Proof strip.** Stars, downloads, named adopters, "as seen in" only if real. Cut the section entirely if proof is thin; an empty proof strip on an OSS page reads as desperation.
3. **Quickstart.** From zero to first useful output in the fewest visible steps. Real commands, real output. If the quickstart needs more than one screen, the product has an onboarding problem the page cannot fix.
4. **How it works / architecture.** One diagram or terse section for the reader evaluating trust and fit. For security tooling, this is where threat model and data handling live. Plain statements only.
5. **Comparison.** Honest table or prose against the 2 or 3 alternatives the reader is already considering. Concede real tradeoffs; conceded weaknesses buy credibility for the claimed strengths.
6. **Community and contribution.** Where discussion happens, how to contribute, who maintains it, release cadence. Maintenance signals are a primary trust factor for OSS adoption.
7. **Footer CTA.** Repeat the install command. Link docs, repo, license, security policy (`SECURITY.md` link if it exists).

Navigation: minimal and allowed (Docs, GitHub, Community). Tone: terse, technical, zero hype. The brutalist/terminal aesthetic direction (see design-direction.md) is a natural fit but not mandatory.

---

## saas-homepage

For web apps and SaaS products. The homepage serves mixed intent (cold, evaluating, returning), so it gets navigation and a fuller story than a campaign page.

Conversion goal: trial signup, demo booking, or waitlist. Pick one as primary.

1. **Hero.** Outcome-first headline within the length budget (see conversion-rules.md), subhead naming who it is for and the mechanism, single primary CTA, and a product visual that shows the actual product doing the actual thing. No abstract illustrations of people pointing at charts.
2. **Social proof strip.** Logos, named users, a hard number. Directly under the hero so the first scroll lands on proof.
3. **Problem.** Name the pain in the buyer's own words (pull phrasing from Phase 1 research). One short section; agitate honestly, do not melodramatize.
4. **Solution / feature storytelling.** 3 to 5 capability blocks, each framed as outcome first, mechanism second, each with a real screenshot or short clip. A bento grid works well here when capabilities differ in weight (see design-direction.md); a linear sequence works when they form a workflow.
5. **How it works.** Three steps, numbered only because it genuinely is a sequence. Kills the "this looks complicated" objection.
6. **Deep proof.** One or two full testimonials with name, role, and a specific result. Specific beats voluminous; one quote with a number outranks six adjectives.
7. **Pricing teaser or transparent pricing.** At minimum, the model (free tier? trial? starting price?). Hiding pricing entirely is a known objection generator for self-serve products. Use the pricing skill if packaging is undecided.
8. **Objections / FAQ.** Work directly from the Phase 1 objection map. Security, data handling, migration, lock-in. Real answers, not reassurance noise.
9. **Final CTA.** Restate the primary outcome in one line, repeat the primary CTA, optionally pair with the lowest-friction secondary (docs, changelog).

Navigation: yes, standard. Footer: full.

---

## campaign-landing

For dedicated landing pages and long-form sales pages: paid traffic, launch pages, workshop and course offers, lead magnets. One traffic source, one intent, one action.

Conversion goal: the single conversion the campaign exists for.

Structural rules that differ from the homepage:

- **No site navigation.** No header menu, no footer link farm. Every exit path competes with the CTA.
- **Message match is binding.** The hero headline must use the same language as the ad, post, or email that sent the reader. If the source says "stop getting passed over for promotions", the page does not open with "career acceleration platform".
- **The CTA repeats** after every major proof or objection block, identical wording each time.

Section sequence (long-form sales structure; compress for simple lead magnets):

1. **Hook.** The promise or the pain, in source-matched language. Subhead stakes the claim.
2. **Problem and stakes.** What it costs the reader to leave this unsolved. Specific, honest, written from inside their situation.
3. **Failed alternatives.** What they have already tried and why it did not work. This is where the reader decides you understand them.
4. **The mechanism.** Why this works when those did not. The unique method, named. (For offers like workshops and coaching, the mechanism is the methodology, not the person's resume.)
5. **Demonstration.** Show it working: walkthrough, curriculum, sample, before/after. Concrete artifacts beat descriptions.
6. **Proof.** Testimonials with names and outcomes, case results, credentials. Place the heaviest proof immediately before the offer.
7. **The offer.** Exactly what they get, itemized, with the price framed against the cost of the problem. No fake strikethrough pricing.
8. **Risk reversal.** Guarantee, refund terms, or "what happens after you click". Reduce anxiety at the moment of commitment.
9. **Honest urgency.** Real deadlines, real cohort caps, or nothing. Fabricated scarcity fails the integrity gate.
10. **FAQ.** The final objections, including the awkward ones (time commitment, refunds, "is this for me if...").
11. **Final CTA block.** Promise, proof element, button.

Forms: minimum viable fields. Every field added must justify itself against the conversion data in conversion-rules.md.

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
