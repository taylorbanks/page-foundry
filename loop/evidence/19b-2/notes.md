# 19b-2 evidence: repo + release-coordinated docs truth pass

Item: fix_plan 19b-2 (#19). The repo docs are reconciled to the shipped v3.0 reality, with no forward-looking release claim on any public page.

## Changed files and why
- `README.md`: "Eight page types" became "Sixteen page archetypes, each a conversion contract rather than a fixed template" with the current archetype list, plus the ordering-from-objections line that replaces the frozen-structure framing. theme-factory came out of the Anthropic `Built on` credits because the 13a dedup took it off the pipeline.
- `skills/page-foundry/README.md`: the orientation line's "eight page types" became "the full archetype set" (orientation prints the compiler's live list, so a fixed count there was doubly wrong); the "What it makes" enumeration became the sixteen-archetype framing.
- `CHANGELOG.md`: a `v3.0.0 (unreleased)` entry covering WS1 through WS6 (contracts, nine new archetypes, evidence-based orchestration, impeccable, handoff 3.0, catalog and gate work, the comp stage, migration, tests). The historical v2.6 entry's banned-word list was wrapped in backticks so the now-scanned file reads 0 FAIL; those are word-as-word references and code spans are scanner-exempt.
- `plans/v3.0.md`: status flipped to "workstreams merged, shipped-pending-release" with the closed/open issue map.
- `docs/index.html`: the hero tag `Open source · MIT · v2.8` became `Open source · MIT`. Reasoning is in the report OWNER-REVIEW block: a pinned version on a static page drifts, and through the release window any specific value is either stale or forward-looking.
- `docs/llms.txt`: added the contract-compiler sentence and the design-detector clause; the pre-existing tailing-negation security triple was collapsed to a single-`no` list with the meaning preserved.
- `skills/page-foundry/SKILL.md`: read and left unchanged. The bare-invocation orientation already pulls the archetype list from the compiler's current list in `references/archetypes.md` and speaks in contract-compiler terms, so it carried no stale count or template claim to fix.

## Facts backing the claims
- Archetype count: 16 primary archetype contracts in `references/archetypes.md`, plus the shared `thank-you-post-conversion` page.
- theme-factory: 0 occurrences in `SKILL.md`'s companion table (removed in 13a's dedup); the README `Built on` list now matches.
- Milestone before this iteration: only #19 (this item) and #20 (tracking umbrella) open; every workstream issue closed with evidence.

## Verification
- `bash loop/verify.sh`: VERIFY GREEN (exit 0).
- `voice_scan.py` on all six changed files plus the report draft: 0 FAIL. Two WARNs remain, both inside pre-existing historical `CHANGELOG.md` entries (the v2.9 three-verb line and the v2.6 `ecosystem` judgment word); neither was introduced by this pass.
- Interceptor render of `docs/index.html`, health-checked with a probe page first: the hero tag renders `OPEN SOURCE · MIT` with no version string, and the page renders. The lesson-30 interceptor "outage" was root-caused this same night (commit 2acdc4f: `captureVisibleTab` needs a focused active tab) and the render worked cleanly here.

## Raw outputs

```
$ grep -cE '^## (oss-project|saas-homepage|campaign-landing|mobile-app|course-sales|membership-community|newsletter-capture|personal-home|pricing-page|comparison-alternatives|docs-dev-tool-landing|waitlist-coming-soon|event-webinar|agency-services|ecommerce-product|changelog-launch-post)$' skills/page-foundry/references/archetypes.md
16
$ grep -cE '^## thank-you-post-conversion$' skills/page-foundry/references/archetypes.md
1
$ grep -c 'theme-factory' skills/page-foundry/SKILL.md
0

$ python3 skills/page-foundry/scripts/voice_scan.py CHANGELOG.md README.md skills/page-foundry/README.md plans/v3.0.md docs/index.html docs/llms.txt
WARN  CHANGELOG.md:23  AI language pattern (three parallel verb-clauses)   [pre-existing v2.9 entry]
WARN  CHANGELOG.md:48  judgment word (figurative use is banned): 'ecosystem'  [pre-existing v2.6 entry]
PASS  README.md
PASS  skills/page-foundry/README.md
PASS  plans/v3.0.md
PASS  docs/index.html
PASS  docs/llms.txt
exit=0

$ bash loop/verify.sh
... VERIFY GREEN (exit 0)

$ interceptor open "file://.../docs/index.html" --full   (probe health-check returned PF-PROBE-OK first)
OPEN SOURCE · MIT
A WHOLE MARKETING TEAM ON EVERY PAGE YOU SHIP.
page-foundry · MIT · built by page-foundry
```
