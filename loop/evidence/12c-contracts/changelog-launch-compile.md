# 12c micro-dogfood · changelog-launch-post compile

FIXTURE. The product and release below are invented for compiler testing only. This file contains proof REQUIREMENTS, never proof content; no user, metric, or feature output appears here or may be reused anywhere. The point of this compile is to exercise the new question-1 mapping and the contract's boundaries against `saas-homepage` and `campaign-landing`, the two archetypes a launch-post brief would otherwise fall into.

Fixture brief, in full: a small SaaS time-tracker ships an API with webhooks, gated to its paid tier. Announcement goes to the existing-user email list and a public launch thread the same morning. Some free-tier users have gone quiet. One breaking change: an old export endpoint is deprecated with a migration window. This property has no `foundry-log.md` yet.

## The five questions

1. **Conversion:** re-engaging existing users around a shipped release. → `changelog-launch-post`, per the compiler's new question-1 mapping. Not `saas-homepage`: the primary reader already has an account, and the page is the release, not the product. Not `campaign-landing`: the email is a single source, but the goal is a customer trying a feature, not a stranger converting on an offer, and the page keeps the site's nav.
2. **Relationship:** ongoing and already established; the page's work is reviving and deepening it, not starting it.
3. **Traffic:** two named sources (the list, the launch thread); message match binds the hero to what the announcement promised: the API, not the quarter's roadmap.
4. **Awareness state:** product-aware of the product, unaware of the release, for the primary reader; the launch thread also delivers strangers, served second by contract.
5. **Decision weight:** light for paid users (turn it on), mid for free users (the upgrade ask carries the tier delta); the page states both terms plainly.

## Filled contract

**Goal.** The update tried: a paid user creates a key and receives a first webhook. Upgrade-start is the secondary route for free users; the stranger's signup is tertiary and never leads.

**Buyer entry states.** Existing customers dominate per the brief, including the gone-quiet cohort the re-introduction framing exists for. The affected segments the spec must name: paid (gets it now), free (gated, tier delta stated), and users of the deprecated export endpoint (breaking-change cohort).

**Jobs, kept or struck.**

- Lead with what changed in outcome terms: KEPT; the version number rides along.
- Show the change working: KEPT; the fixture supplies no screenshot, per the fabrication rule; the compile records the requirement.
- Who gets it, on what terms: KEPT and load-bearing; the paid gate and the deprecation both live here, and the migration note reaches export-endpoint users before any ask.
- Shortest try-it path: KEPT; the deep link lands on the key-creation screen, not the login page.
- Stranger block after the update story: KEPT; the launch thread guarantees strangers.
- Changelog honesty (known limits, fixes alongside features): KEPT.

**Axes.**

- Narrative shape: demo-led; the reader knows the product, so the fastest honest claim is the feature working.
- Hero form: product-in-hero; the feature's screenshot is the hero visual.
- Proof strategy: interleaved trivially; the demonstration is the proof and rides with the claim, and no other proof inventory exists for a same-day release.
- Density: compressed; a release post that runs long buries the migration note its most affected readers came for.

**Ordering constraints engaged.** The shared ten, plus the contract's three: the change before the upgrade ask, breaking changes before the try-it ask for affected readers, the stranger block after the update story.

**Boundary check.** The same release promoted only to strangers (a paid campaign for the API as an acquisition hook) compiles `campaign-landing` or `docs-dev-tool-landing` depending on the conversion, because the reader is no longer a customer. A release so large it repositions the product compiles `saas-homepage` for the relaunch page, with this contract handling the announcement beside it.
