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

### The distribution seam (revised 2026-07-17 after owner challenge)

The first draft excluded the whole campaign-ops lane. Wrong cut. The boundary that keeps page-foundry coherent is "the page and its announcement" vs "ongoing marketing operations" — and the announcement side has a unique asset: the run's artifacts. A post-ship **distribution seam** (opt-in, after gates pass) lets `launch` orchestrate `social`, `pr`, `ad-creative`, `emails`, and `directory-submissions`, each consuming the run's message architecture, VOC, and voice rules — so the announcement inherits the page's message instead of being written from scratch. Message match works in both directions: the ad and the page written as a pair. This is exactly what a user cannot get by invoking those skills standalone, because standalone they lack the artifacts.

### Excluded, with reasons (stay excluded)

- **content-strategy** — plans editorial calendars and topic clusters for content marketing. Nothing in it builds, improves, or announces a page; it plans a publishing program. Evaluated in v2.6, re-tested here: still no seam that consumes or feeds page artifacts.
- **programmatic-seo** — templated pages at scale is the philosophical opposite of per-page anti-uniformity, so it is not a v3.0 companion. Recorded as a **future mode candidate** ("foundry at scale": conversion contract + gates applied across N data-driven pages) if demand shows; that would be its own major version, not a bolt-on.
- **cold-email / sms / prospecting / revops / sales-enablement / churn-prevention / community-marketing / referrals / ads (campaign management)** — lifecycle and outbound operations that neither consume nor produce page artifacts; wrapping them makes page-foundry a diluted marketing-plan skill.
- **marketing-plan / marketing-ideas** — the strategy layer above page-foundry; orchestrating upward inverts the relationship. A marketing-plan run may CALL page-foundry, not the reverse.
- **video** — motion stays in the Remotion stack (below); revisit only as a fallback.

## gstack

Used: design-consultation, design-shotgun, design-html, plan-design-review, design-review, qa. **Add: `diagram`** — architecture/how-it-works diagrams for oss-project and saas-homepage sections; today those sections say "one diagram" with no producer. Rest of the command set (deploy/ops/ios/benchmark) is out of the page lane; browse stays excluded (Interceptor is the browser policy).

## impeccable

Dispositioned in WS3: document, palette, detect, critique, polish, live, overdrive in; shape/init excluded (double-interview), clarify excluded (voice gate owns copy). No change.

## anthropics/skills (upstream repo swept 2026-07-17: 17 skills)

Used: frontend-design, theme-factory (leaving per dedup), web-artifacts-builder, skill-creator (build-time). **Adds:**

| Skill | Where | Why |
|---|---|---|
| **webapp-testing** | Gates 3 and 5 executor | Playwright toolkit for local webapps: screenshots, browser logs, UI verification. The render gate currently names "Playwright, headless Chrome, or gstack /design-review" with no skill behind the first option; this is that skill. For users without a browser-automation setup, it is the difference between a real render gate and an N/A. |
| **canvas-design** | Phase 5 asset production (OG cards, poster-style art) | Design-philosophy-driven static art in png/pdf. Default owner for OG-card production (on-token, deterministic); marketingskills `image` handles photographic/AI-generated needs. One owner per asset type, both under the integrity rule. |
| **algorithmic-art** | Opt-in enhancer (signature elements, generative heroes) | p5.js generative art with seeded randomness. For the rare property whose register supports it (personal-home, creative portfolio, overdrive-style heroes). Pairs with impeccable overdrive; propose-first, never default. |

Excluded: brand-guidelines (applies ANTHROPIC's brand specifically, not a generic brand tool), docx/pdf/pptx/xlsx/slack-gif-creator/internal-comms/doc-coauthoring/mcp-builder/claude-api (out of lane).

## vercel-labs/agent-skills (upstream repo swept: 13 skills)

Used: web-design-guidelines. **Conditional add:** react-view-transitions — only when the build path is web-artifacts-builder producing React; static HTML pages get view-transition guidance from impeccable animate instead. **Borderline opt-in:** deploy-to-vercel — a post-build deploy seam for users who want hosting handled; page-foundry stays host-agnostic ("HTML you own"), so this is offered, never default. Excluded: react-best-practices / react-native / composition-patterns (code-lane), vercel-optimize (platform-specific; Gate 4 owns the budget), writing-guidelines (the voice gate owns prose; two style authorities is one too many).

## Motion stack (remotion-dev/skills swept: 9 skills; plus ecosystem)

The companion table's single vague "remotion (official skill), confirm exact repo" line becomes a concrete stack: **remotion-best-practices** (431K installs; the doctrine), **remotion-create** + **remotion-render** (build and render the clip) — invoked together when a spec's motion slot is justified (hero demo clips, product loops). **remotion-captions** when the clip carries speech. Governance unchanged: impeccable animate.md duration/easing rules + our "motion earns its slot" doctrine decide WHETHER; the Remotion stack decides HOW. Evaluate-before-trust: heygen-com/hyperframes css-animations (73K installs) as a lighter CSS-motion path for micro-animation without video weight — third-party, needs the same read-the-source diligence as any companion before pinning.

## Standing rule (extends issue #6)

The quarterly companion reconciliation reconciles versions AND catalogs: new skills in pinned sources get dispositioned (add / enhancer / exclude-with-reason) in this file, so functionality stops silently accumulating on the table.
