# process.md: Interceptor Phase 3 record (page-foundry dogfood)

The Phase 3 process trail for the Interceptor copy: the copy-editing changelog, the red-team read, and the voice chain (word scan, pattern pass, humanizer). It records how `body-draft.md` became `approved-draft.md`. Pattern-example fragments are in code spans so this record itself scans clean (the scanner strips code spans before the pattern regexes).

## Copy-editing changelog (`marketing-skills:copy-editing`)

Invoked on copywriting's draft, naming three sweeps: the cut, So-What, and Specificity. What it changed:

- **Cut.** S8 lost the sentence `This matters more than it might seem.` It carried no information a reader could act on, so it died by the cut question (what does the reader lose if this sentence goes: nothing).
- **Tighten.** The meta description dropped from 169 to 145 characters so it does not truncate in a search result, while keeping the brand, the mechanism (no CDP fingerprint), and the outcome (sites do not flag it). The hero subhead was already at length and was left intact.
- **Sharpen (Specificity sweep).** S5 replaced the vague `your most sensitive apps` with the four the denylist actually names: Keychain, 1Password, System Settings, and banking apps. A concrete list a reader recognizes beats a category they have to trust.
- **Sharpen (So-What sweep).** Every surviving claim was checked against "so what": S3's mechanism answers why the tool will not fall behind the next detector update; S5's safety controls answer that the account and its data stay the reader's; S6's no-maintenance claim answers less upkeep than a stealth patchset, so every surviving claim earned its keep as a benefit rather than a bare feature.

No sentence was cut that carried a claim; the cut removed decoration only, and the So-What and Specificity sweeps sharpened the copy the cut spared.

## Red-team read

One skeptical reader per segment and entry state from `product-marketing.md`, each carrying the brief's Switching Dynamics (the Habit force as their reason to leave, the Anxiety force as their doubt at the CTA), plus one anti-persona reader whose correct ending is to leave.

- **Reader A, AI-agent builder whose agent is flagged behind a login.** Habit: an existing CDP or headless agent. Anxiety: the real-browser and extension requirement. Walk: the hero names their exact pain, S3 explains why their current setup leaks, S4 shows the one-call read an agent wants, S5 answers account risk. Reaches the CTA; no bounce point.
- **Reader B, QA or release engineer doing real-browser deploy verification.** Habit: headless CI. Anxiety: the unclear CI-headless story. Walk: S6 and S7 say plainly that the CI-headless story is `[TK]` and route pure-CI work elsewhere, so B is not misled; the real-sessions claim (S5) and the record-and-replay line (S4) name B's job. Reaches the CTA. Soft note below.
- **Reader C, developer automating canvas editors (Google Docs, Figma).** Habit: none strong. Anxiety: does it read canvas at all. A detection-led page gives C no foothold until S4's `There is more here than stealth` line names the scene graph. That line was kept load-bearing by this read: without it, a qualified reader (the tool does serve canvas) concludes "not for me", which conversion rule 10 counts as a defect. Reaches the CTA via S4; no bounce point.
- **Reader D, builder needing OS-level or native automation.** Anxiety: the unauthenticated local socket. Walk: S5 states the socket limit plainly and bounds it (the browser-only package ships without the bridge), and the S4 capability line names the bridge. Reaches the CTA; no bounce point.
- **Reader E, individual operator automating their own accounts.** Anxiety: getting the account flagged or banned. Walk: S1 and S5 (real sessions kept local, safety controls, no automation signal). Reaches the CTA; no bounce point.
- **Anti-persona, batch headless scraping at scale behind residential proxies.** S6 and S7 route this reader to Browser and BrightData. Correctly self-selects out. Good: an anti-persona reaching the CTA convinced would mean the page over-promised.

Findings:

- **One fix, already in the draft.** Reader C's foothold: the S4 `more than stealth` line naming network capture, record-and-replay, the canvas scene graph, and the bridge. Present in the copywriting draft, confirmed load-bearing here, and phrased as a noun list rather than a verb run so it stays clean under the pattern scan.
- **One accepted soft note.** The page does not foreground Reader B's deploy-verification job by name (it leads on detection, per the spec's dominant solution-aware segment). Accepted, not fixed: B is a served-but-secondary segment, reaches the CTA through the real-sessions value and the record-and-replay capability line, and the spec deliberately compressed to the detection wedge. Carried to the run's open items as a candidate for a launch-time test (does a deploy-verify referral segment convert), not a Phase 3 rewrite.

## Voice chain

### Word scan

- `body-draft.md`: 0 FAIL, 3 WARN (the three AI-pattern WARNs below), verbatim scanner output in the commit.
- `approved-draft.md`: 0 FAIL, 0 WARN.

### Pattern pass

Three `AI language pattern` WARNs in the draft, each resolved (not accepted) because each had a cleaner positive form that kept the claim:

1. **S3, negative parallelism.** Draft: `It's not a stealth patch layered on top of CDP, it's the CDP surface taken away.` Rewritten to the positive claim stated once: `It takes that surface away rather than patching over it one tell at a time.` Same claim (removes the surface rather than masking tells), no `it's not X, it's Y` frame.
2. **S4, three parallel verb-clauses.** Draft: `interceptor open <url> opens the page, reads its structure, and returns the visible text in a single call.` Rewritten: `interceptor open <url> returns a page's structure and its visible text together in a single call.` Same claim (one call yields structure plus text), the three-verb rhythm gone.
3. **S9, copula avoidance.** Draft: `The documented bug list serves as a credibility signal.` Rewritten: `That documented bug list is a credibility signal.` Plain copula, same claim.

No WARN was accepted-with-reason this run; all three had clean rewrites.

### Humanizer pass (`humanizer` skill, one pass, meaning arbitrated)

Ran once on the final copy, after the word scan and the pattern pass. `references/voice.md` is the arbiter. Applied rewrites, each meaning-preserving:

- **Roster-opener uniformity.** Several sections opened with `Interceptor`. S6 was reopened from `Interceptor's advantage over a CDP framework...` to `Against a CDP framework or a stealth patch, the difference is maintenance.` The remaining `Interceptor`-opened sections (S5, S7, S9) keep distinct grammatical shapes and were left, since varying them further would have been change for its own sake.
- **One empty sentence cut.** The S8 `This matters more than it might seem.` line (also caught by copy-editing's cut) removed.
- **One false-range reshape.** S8 `from custom rendering-engine APIs to in-browser extensions` became `at the rendering-engine level and as in-browser extensions`; the two are approaches, not points on a scale, so the `from X to Y` frame was the tell.

Arbitration, recorded: the humanizer's "add first-person soul and personality" guidance was **rejected**. The arbiter register in `references/voice.md` is plainspoken, declarative, low-hype, builder-to-builder, humor off by default. Injecting blog-voice first person ("here's what gets me...") would change the register, which the meaning-preservation guardrail defines as a defect, not a fix. The skill's own rule is that meaning and register arbitrate and `voice.md` is the arbiter, so the register held. One pass, not iterate-to-zero-tells; no claim was changed by any applied rewrite.

Result: `approved-draft.md`, scanner-clean at 0 FAIL / 0 WARN, humanizer pass complete. Approval is real; the freeze waits for the copy-fit pass per AUDIT-F1b.
