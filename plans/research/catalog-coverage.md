# Full-catalog coverage: what page-foundry uses, should use, and deliberately excludes

Audit date: 2026-07-17. Catalogs swept: marketingskills 2.3.0 (44 skills), gstack (command set), impeccable 3.9.1 (23 commands; dispositioned in impeccable-core.md and the WS3 issue), anthropics official plugins, vercel-labs agent-skills. Answers the owner's question: are we leaving available functionality on the table? Yes, in nine places.

## marketingskills: 16 of 44 used today

**Used (16):** product-marketing, customer-research, marketing-psychology, cro, copywriting, copy-editing, pricing, competitors, aso, launch, lead-magnets, popups, signup, analytics, ai-seo, schema. (Quality of use is WS2's subject; several are name-only today.)

### Add: material improvements sitting on the table (9)

| Skill | Where it lands | Why |
|---|---|---|
| **site-architecture** | Phase 2 adjunct + the scope-escalation seam | Our scope notes literally say "flag site-architecture work separately" — there is a skill for the thing we flag. Owns: where this page sits in the site, nav policy inputs, URL/slug decisions, and the multi-page moment (homepage + pricing page) when a property outgrows one page. Invoke on escalation instead of only flagging. |
| **competitor-profiling** | Phase 0/1 competitive frame | Distinct from `competitors` (which builds comparison PAGES). Profiling-from-URLs is exactly the input the positioning sentence ("unlike ALTERNATIVE") and objection map need. Fixes a misassignment: WS2 previously routed `competitors` into Phase 0/1; the right skill is this one. `competitors` stays archetype-side for comparison-alternatives pages. |
| **seo-audit** | Gate 6 companion | We already consume its ai-writing-detection list inside voice.md (v2.6) but never invoke the skill. On-page SEO audit of the built page belongs in the AI-discovery/meta gate. |
| **ab-testing** | Post-ship loop (foundry-log) | The log's `conversion data` must change a decision; ab-testing turns that doctrine into designed experiments (headline/hero variants on shipped pages). Closes the loop the log format was built for. |
| **image** | Phase 5 asset production | Marketing image generation: hero images, OG cards. We hand-roll og.jpg today. Slots under the integrity rule (no fabricated product shots; real screenshots stay real). |
| **onboarding** | thank-you-post-conversion archetype (WS1b) | Activation and time-to-value is that archetype's whole job; the skill owns the domain. |
| **launch** (upgraded role) | Keep archetype-side for campaign/launch pages, ADD post-ship seam | After the gates pass, offer a launch plan for the page (announcement strategy, channels, sequencing). Today launch is one of the "seven companions sharing one sentence" (D grade); it gets a real contract in both places. |
| **directory-submissions** | Post-ship enhancer, opt-in | Distribution for the shipped product page (directories, listings). Fits the post-ship seam next to launch. |
| **emails** | newsletter-capture / thank-you handoff addendum, opt-in | The welcome sequence is the other half of a capture page's conversion. Offered, not default; page-foundry stays a page skill. |

**Borderline, offered as opt-in enhancers where the archetype matches:** ad-creative (campaign-landing message match: the ad and the page written as a pair), free-tools (when the lead magnet IS a tool), paywalls (pricing-page psychology adjunct; the surface itself is in-app).

### Excluded, with reasons (stay excluded)

content-strategy (multi-page editorial planning; evaluated and excluded in v2.6 — stands), programmatic-seo (pages at scale, not a page), video (motion is Remotion's lane; revisit only as a fallback if Remotion is absent), social / pr / co-marketing / marketing-ideas / marketing-plan / cold-email / sms / prospecting / revops / sales-enablement / churn-prevention / community-marketing / referrals / ads (campaign and lifecycle operations beyond the page's boundary). Exclusions are recorded so the quarterly reconciliation re-tests them instead of re-litigating from scratch.

## gstack

Used: design-consultation, design-shotgun, design-html, plan-design-review, design-review, qa. **Add: `diagram`** — architecture/how-it-works diagrams for oss-project and saas-homepage sections; today those sections say "one diagram" with no producer. Rest of the command set (deploy/ops/ios/benchmark) is out of the page lane; browse stays excluded (Interceptor is the browser policy).

## impeccable

Dispositioned in WS3: document, palette, detect, critique, polish, live, overdrive in; shape/init excluded (double-interview), clarify excluded (voice gate owns copy). No change.

## anthropics official / vercel-labs

frontend-design, skill-creator (build-time), web-artifacts-builder, theme-factory (leaving the table per dedup) — no additional catalog finds relevant to a marketing page. security-guidance, code-review et al. are out of lane. vercel-labs: web-design-guidelines remains the only fit.

## Standing rule (extends issue #6)

The quarterly companion reconciliation reconciles versions AND catalogs: new skills in pinned sources get dispositioned (add / enhancer / exclude-with-reason) in this file, so functionality stops silently accumulating on the table.
