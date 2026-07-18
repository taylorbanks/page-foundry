# 21a micro-dogfood 2: the post-ship experiment paragraph walked on a fixture

Date: 2026-07-18. No shipped page-foundry page has live conversion data yet (the truthful state; the loop fabricates nothing), so this walk uses a FIXTURE log entry, labeled as such throughout, to prove the new Phase 6 paragraph turns its inputs into the `experiments.md` shape the companion table promises. Every number below is fixture input, not a claim about any real page.

## Fixture input: a repeat-run `foundry-log.md` entry (FIXTURE, not a real run)

```
### 2026-06-01 · build · saas-homepage  [FIXTURE]
- headline: Ship the audit before the auditor asks
- skeleton: hero, objections, proof, pricing, cta · problem-first/split/borrowed/dense
- meclabs: C=27 (M8 V7 I5 F4 A3)
- gates: 8 pass
- companions: full core set
- degraded: none
- open items: hero candidate B (outcome-first framing) scored 26 vs winner's 27; unresolved
- conversion data: 4,120 visits, 87 signups, 2.1%, source: launch post + organic  [FIXTURE]
- learnings: pricing section outperformed scroll expectations
```

Contest per the paragraph's trigger list: two hero candidates the last run scored within a point of each other, recorded in the open items. Real numbers exist (fixture). The seam fires.

## Walked output: the `experiments.md` the paragraph produces

```
# Experiments  [FIXTURE walk output]

## EXP-1: hero framing, problem-first vs outcome-first
- Hypothesis: if the hero leads with the outcome ("ship the audit") instead of the
  problem, signups rise, because the log's top VOC theme is time-to-done, not fear.
- Variable: hero headline + subhead only (candidate A vs scored candidate B). One variable.
- Sample size floor: 2,900 visitors per arm for 80% power detecting 2.1% -> 2.9%,
  pre-committed; at the fixture's traffic, roughly three weeks. No peeking before the floor.
- Primary metric: signup conversion. Decision rule: B ships only if it clears A at the
  floor; a result under the floor keeps A and records the null.
```

## What the walk proves

- The trigger condition is readable straight off the log format: `open items` held the contested pick and `conversion data` held the numbers, no new fields needed.
- Every element the table row's OUTPUT column names appears: if-then hypothesis, single variable, pre-committed floor, primary metric with a decision rule. The shape came from the companion's own doctrine (hypothesis first, test one thing, pre-determine sample size, no early stops).
- The result path closes: the decision rule writes its outcome back as the next entry's `conversion data`, where the change-a-decision rule already binds.
- The guard held: this walk designed nothing for a real page, because no real page has traffic; that is exactly the unlaunched-page refusal the paragraph and test 58 encode.
