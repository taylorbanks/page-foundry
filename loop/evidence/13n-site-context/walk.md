# 13n micro-dogfood · site context precedes the compiler; PRODUCT.md at sign-off

Item 13n (audit F12, `plans/research/order-audit-synthesis.md` finding 12; mechanics from `order-audit-redteam.md` (c) and (d)). Two behaviors exercised: the compiler consuming `site-context.md` written before it ran, and the PRODUCT.md field walk proving the sign-off write is complete. Fixture inputs are labeled as fixtures; the compile delta below is against the real prior compile in `loop/evidence/12b-contracts/docs-dev-tool-compile.md`, which ran site-blind because the input did not exist yet.

## 1. The compile, with site context (multi-page property)

Input: `site-context-fixture.md` in this directory. The compiler ran per the new `references/archetypes.md` "Site context binds the compilation" block. What changed against the 12b compile of the same fixture brief, ruling by ruling:

- **Nav policy.** 12b guessed "navigation standard, docs-forward" from the brief's traffic answer. Now traced: the contract's nav ruling reads "Docs, Pricing, Sign in, per the site-context nav line; nothing strikes them" and names the file. Same conclusion, now an input rather than an inference; on a property whose site carried different chrome, the guess had nothing to catch the difference.
- **The pricing shape (a changed decision).** 12b kept the pricing-disclosure job on the page: "published usage rates plus the free-tier cap." The site context says `/pricing` is live with exactly that content, so the offer-and-pricing shape forks to the teaser line linking the full pricing page. The free-tier terms stay in the quickstart where the archetype's contract demands them; the rate table leaves the page. This is the fork the audit called compiled-on-guessed-context: without the input, the compiler duplicated a live pricing page because it could not know one existed.
- **The post-conversion moment.** 12b inferred "the first-call moment lands in the product's own console, which the platform owns." Now the contract cites the inventory line for `console.loghound.example`: the thank-you page is not buildable this pass, named as a ruling read from the file rather than an assumption the spec had to state.
- **The straddle.** The brief tempts merging `docs-dev-tool-landing` with `saas-homepage` for the economic buyer. The site-context ruling is split, so no merged contract is compiled: the page compiles alone against `docs-dev-tool-landing`, and the planned `/security` page carries the economic buyer's depth as flagged separate work. Under the pre-13n text the merge decision had no input to consult; the straddling rules would have weighed the union of jobs on this one page.

Scope check: the ruling flags `/security` as separate work and this run builds none of it, per the step 1 scope sentence.

## 2. The negative (single-page property)

The 12b waitlist fixture (`loop/evidence/12b-contracts/waitlist-compile.md`): one page, one launch post, no site. Step 1 skips silently; site-architecture is not invoked; the compile runs exactly as it did in 12b, and the contract records that it compiled without site context. Per TESTS.md 51, invoking site-architecture here, or demanding the file, is the failure.

## 3. PRODUCT.md at sign-off: the field walk

Every field the integration note has PRODUCT.md take, mapped to the phase that produces its input, walked on the fixture:

| Field | Source | Exists at sign-off |
|---|---|---|
| `## Register` | constant (`brand`) | yes |
| `## Platform` | constant (`web`) | yes |
| `## Positioning` | the brief's positioning sentence (Phase 0) | yes |
| `## Users` | the brief's ICP and jobs (Phase 0) | yes |
| `## Conversion & proof`: CTA set | the contract's CTA policy (Phase 2): get-a-key primary, sales route quiet | yes |
| `## Conversion & proof`: belief ladder | the Phase 1 message hierarchy, in order | yes |
| `## Conversion & proof`: proof inventory | the brief's proof inventory (Phase 0) | yes |
| `## Brand Personality` | the brief's voice fields and anti-references (Phase 0) | yes |

No row draws on Phase 3 or Phase 4 output: copy and tokens appear nowhere in the schema, which is the redteam (c) observation that the Phase 4 timing was pure delay. The two fields that made "end of Phase 1" wrong (CTA set, belief ladder) both exist once the spec is signed, so sign-off is the earliest complete moment, and the failure window the old timing left open (an interrupted run, or a user-run impeccable command between phases, triggering impeccable's own interview) closes.

The Phase 4 side is now a re-verify: the singleton rule (merge, never clobber) applies to anything the product's own team added between sign-off and Phase 4, per the rewritten integration note and TESTS.md 51.
