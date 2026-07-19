# conversion-audit.md: Interceptor (page-foundry Gate 1 dogfood)

Gate 1 (conversion audit) for the Interceptor page. The MECLABS Conversion Sequence heuristic scored twice: the builder's self-score from full context, then the score of record from a fresh agent given only the page and the brief, never the spec, the drafting context, or the self-score. The divergence is recorded and analyzed. This scoring runs on `copy/approved-draft.md` as the pre-build proxy for the rendered page (the build lands at DOGFOOD-6); the honest completion of this gate re-scores on the rendered page at DOGFOOD-7, and the note on that is at the end.

## MECLABS scores

Formula: C = 4M + 3V + 2(I − F) − 2A. Each factor 1 to 5.

| Factor | Weight | Self (full context) | Independent (cold) | Gap |
|---|---|---|---|---|
| M, motivation match | 4 | 5 | 4 | 1 |
| V, value clarity | 3 | 5 | 4 | 1 |
| I, incentive | 2 | 3 | 2 | 1 |
| F, friction | 2 (neg) | 3 | 4 | 1 |
| A, anxiety | 2 (neg) | 2 | 3 | 1 |
| **C** | | **31** | **18** | **13** |

Self: 4(5) + 3(5) + 2(3 − 3) − 2(2) = 20 + 15 + 0 − 4 = **31**.
Independent: 4(4) + 3(4) + 2(2 − 4) − 2(3) = 16 + 12 − 4 − 6 = **18**.

The independent agent's verbatim return (fenced, so this record scans clean):

```
SCORES
M: 4 — Hero and S2 problem framing ("works on your machine, then the site flags it as a bot or logs it out") mirror the ICP's exact entry state, so intent match is strong for this narrow, high-pain audience.
V: 4 — By one scroll the differentiated claim is clear and credible to an engineer: it removes the CDP surface rather than patching tells, explicitly beating stealth patches; only dampened because the core "sites don't flag" proof is vendor-stated with reproduction unproven.
I: 2 — The reward for acting now is a free tool, but the one thing that lets you act (the install command) and the quickstart proof are both absent, so there is no concrete payoff to seize at this moment.
F: 4 — The primary CTA install command is missing right now, and real setup weight (Chrome/Brave window open, manual dev-mode extension load, .pkg installers, macOS permissions, no CI/headless story) is high for an ask billed as "one command."
A: 3 — Heavy candor (documented bugs, safety controls, "read the code before you trust it") genuinely disarms this skeptical audience, but residual risk stays moderate: the core stealth claim has no independent reproduction, adoption proof is zero, and the license is unknown at decision time.
C: 18 (4M + 3V + 2(I−F) − 2A = 4·4 + 3·4 + 2·(2−4) − 2·3 = 16 + 12 − 4 − 6 = 18)
FLAGGED: I low (2), F high (4)
TOP FINDING: A fully motivated engineer who accepts the mechanism argument reaches the point of action and finds nothing to run: the primary CTA install command is absent and the quickstart command-plus-output that would prove the tool works is also absent. The page's own close insists "the install is one command" and "the quickstart above are the proof," yet at this moment neither exists on the page, so the strongest motivation-and-value section in the funnel dead-ends into an empty CTA. Everything upstream builds intent the page then cannot let the visitor convert on.
```

## Divergence analysis (13 points is wide, and the reason is precise)

Gate 1's own doctrine: a page that scores well only for its author depends on context a cold visitor lacks, and a wide gap is a finding about the page. Here the gap is not diffuse; it concentrates on exactly the factors an element currently marked `[TK]` moves, and the builder scored each of those anticipating the fill that a cold visitor cannot see:

- **I (3 vs 2) and F (3 vs 4): the install command.** The primary CTA is `[TK: browser-only install command, confirmed against the repo README at build]`. To the builder it is a slot that holds a real one-line command at DOGFOOD-6. To a cold visitor it is an empty CTA: the incentive to act now has nothing to act on, and the friction of "where do I even start" is maximal. The auditor is right about the page as it stands.
- **V (5 vs 4): the quickstart output.** The heaviest `oss-project` proof, the tool doing real work, is `[TK: real quickstart command and its real output, captured at build]`. The builder scored the value proposition on the mechanism argument, which is fully present and legible; the cold reader correctly docked value clarity because the claim's strongest proof is a placeholder.
- **A (2 vs 3): the un-fillable-by-build residue.** The vendor-stated stealth result with `[TK]` independent reproduction, zero adoption proof (stars, users, all `[TK]`), and the `[TK]` license are real trust gaps at the moment of action. These do not fill at build; the page manages them with candor (naming them as unknown rather than inventing them), which is why A is well-controlled but not low. The builder scored the candor generously; the cold reader weighted the residual risk higher, and that is the honest read.

The one point of M gap (5 vs 4) is ordinary auditor conservatism on a strong match; it is not a finding.

**Interpretation.** The divergence is a true finding, and it is the finding this stage should produce: the page's conversion rests on two elements that are correctly deferred to the build under the integrity rule (an install command must be verified against the live README, not fabricated; the quickstart output must be a real capture, not invented). Until they exist, the page cannot be scored as convertible, and the cold audit quantifies how much of the builder's confidence rode on their eventual presence: 13 of 31 points. This is not a copy defect to fix in Phase 3; it is the reason DOGFOOD-6 (build) and DOGFOOD-7 (gates on the rendered page) exist.

## Gate 1 checklist

- **5-second test (headline + subhead + CTA label):** the headline and subhead pass cold: a reader learns what the tool is, who it is for, and the wedge (a real browser sites do not flag, via an extension with no CDP fingerprint). The CTA label is the install command, `[TK]` until build; the 5-second comprehension does not depend on it. PASS, with the CTA-label fill tracked to DOGFOOD-6.
- **Headline within budget:** "Automate a real browser sites don't flag" is 40 characters, under the ~44 target and the 70 ceiling. PASS.
- **Exactly one primary CTA, repeats identical:** one primary action, the install command, in the hero (S1) and repeated at the close (S11) in identical wording. Secondary actions (Docs, GitHub, Community, License, Security) stay as quiet text links. PASS (structure; the exact string fills identically in both slots at build).
- **Proof within one viewport of every CTA:** the hero CTA carries the Stealth Verification result beside it; the close CTA follows the quickstart (the heaviest proof, before the ask, shared constraint 3) and names it in place. PASS on placement; the quickstart proof's content is `[TK]` until build, tracked above.
- **campaign-landing nav/message-match line:** N/A, this is `oss-project`.
- **Forms:** N/A, no form on this page (open-source acquisition, not email capture).
- **MECLABS scored independently:** done, above, with both scores and the divergence.
- **Flagged factors addressed or accepted:** dispositions below.
- **Red-team read:** done in `copy/process.md`; summary below.
- **Anti-template check:** N/A. This is the property's first run (`foundry-log.md` Run 1); no prior `skeleton` line exists to converge with. The shipped skeleton (job order hero, problem, mechanism, quickstart, data-handling-and-safety, comparison, not-for, why-now, project-status, FAQ, close; axes demo-led, install-command, interleaved, compressed) is recorded for the next run's check.

## Flagged-factor dispositions

- **I low (2): accepted, with a re-score at DOGFOOD-7.** The incentive is an honest one, a free open-source tool installed in one command, and the page deliberately does not manufacture a false one: `persuasion-map.md` rejected scarcity and urgency as exactly the hype this buyer distrusts. The real incentive (the one-command install and the quickstart payoff) is `[TK]` at this stage and present on the rendered page; I re-scores at DOGFOOD-7. I will not reach 5 on an honest oss-project page, and that ceiling is correct, not a defect.
- **F high (4): accepted, part fills at build, part is inherent and named.** The dominant friction the cold auditor hit, the missing install command, fills at DOGFOOD-6. The residual friction (a real Chrome or Brave window, a manually loaded extension, macOS grants on the full package) is inherent to the product and stated honestly; the page lowers it the one way it can, by leading with the browser-only package as the shortest path (the Fogg ability move from `persuasion-map.md`). Accepted with that disposition; F re-scores at DOGFOOD-7 once the install command is present.

## Red-team summary (full walk in `copy/process.md`)

One skeptical reader per segment and entry state, plus the anti-persona. Every qualified reader (A through E) reaches the CTA structurally: A's detection pain, C's canvas foothold (the S4 "more than stealth" line), D's socket answer, E's account-safety answer, and B's real-sessions and record-and-replay path all land before the ask. The anti-persona (batch scraping at scale) is routed to Browser and BrightData by S6 and S7 and correctly self-selects out. One accepted soft note: the page does not name Reader B's deploy-verification job explicitly (it leads on the dominant detection segment); B is served-but-secondary and reaches the CTA through adjacent value, carried to open items as a launch-time test rather than a Phase 3 rewrite. Caveat consistent with the MECLABS finding: "reaches the CTA" is a structural claim; the CTA's content (the install command) is `[TK]` until build, so the red-team confirms the path, and DOGFOOD-7 confirms the destination.

## Completion note

Per the plan, DOGFOOD-7 treats Gate 1 as already scored and does not re-run it from scratch; this audit is the record. The honest completion of the independent audit is a re-score on the rendered page at DOGFOOD-7, once the install command (DOGFOOD-6, verified against the live README) and the quickstart output (DOGFOOD-6, real capture) are present. The prediction this audit makes is testable: I and F recover once the install command is on the page, V recovers once the quickstart output is real, and A stays near 3 because independent stealth reproduction, adoption proof, and the license remain `[TK]` and are managed by candor, not filled by the build. If the rendered re-score does not move I, F, and V up, that is a real defect to open; if it does, the 13-point divergence was the pre-build artifact this analysis says it is.

---
Provenance: self-score by the builder (Fable) from full Phase 1 to 3 context; independent score by a fresh general-purpose agent (opus) given only `copy/approved-draft.md` (page order, pre-build proxy) and `product-marketing.md` (the brief), with the spec, message architecture, persuasion map, and all drafting context withheld. MECLABS rubric from `skills/page-foundry/references/conversion-rules.md`; the scores are the heuristic's design diagnosis, not claimed product metrics.
