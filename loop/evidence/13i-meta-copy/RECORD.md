# 13i micro-dogfood: the head is copy

Item: fix_plan 13i (audit F6). Phase 3 step 2 now requests copywriting's meta-content output, the full voice chain applies to it, the snapshot opens with the `<title>` and meta description as labeled entries, and Gate 6 diffs the built head against those entries instead of judging head wording fresh at ship time.

Two behaviors demonstrated mechanically, fixtures in this directory.

## 1. The voice chain catches unvoiced meta once meta is routed through it

`meta-unvoiced.md` holds a title and description of the kind that ships today when the head bypasses Phase 3 (`Leverage our robust platform to streamline pages`). `meta-voiced.md` holds entries written under the voice rules.

Verbatim scanner output, run 2026-07-18:

```
FAIL  loop/evidence/13i-meta-copy/meta-unvoiced.md:1  banned phrase: 'robust'
FAIL  loop/evidence/13i-meta-copy/meta-unvoiced.md:1  banned phrase: 'streamline'
FAIL  loop/evidence/13i-meta-copy/meta-unvoiced.md:2  banned phrase: 'seamlessly'
FAIL  loop/evidence/13i-meta-copy/meta-unvoiced.md:2  banned phrase: 'cutting-edge'
FAIL  loop/evidence/13i-meta-copy/meta-unvoiced.md:2  banned phrase: 'harness'
FAIL  loop/evidence/13i-meta-copy/meta-unvoiced.md:2  banned phrase: 'effortlessly'
WARN  loop/evidence/13i-meta-copy/meta-unvoiced.md:1  judgment word (figurative use is banned): 'leverage'
6 violation(s). ... exit 1

PASS  loop/evidence/13i-meta-copy/meta-voiced.md ... exit 0
```

The exact head copy the old Gate 6 would have met for the first time at ship, with its voice judgment left to gate-time discretion, fails the mechanical scan six ways when it is routed as copy. That is the routing 13i adds.

## 2. The Gate 6 head diff is executable exactly as the gate now states it

`head-matching.html` carries the labeled entries from `meta-voiced.md` verbatim; `head-drifted.html` carries a builder-rewritten title over the same description. Extracting `<title>` and the description content and comparing each against the snapshot entries (extraction script inline in the iteration log):

```
--- head-matching.html
  title: MATCH
  description: MATCH
--- head-drifted.html
  title: DRIFT
    snapshot: page-foundry: a brief in, a shipped page out
    built:    Page Foundry | AI Landing Page Builder
  description: MATCH
```

A drifted head surfaces as a named mismatch with both strings shown, which is what the rewritten Gate 6 line demands: diff against the snapshot, route a mismatch through the Phase 3 step 5 re-trigger, never judge head wording fresh at the gate.

## Scope note

The fixtures are test fixtures in the TESTS.md style, clearly synthetic, quoted in backticks where they contain banned vocabulary. The end-to-end path (copywriting invocation to snapshot to gate) runs at DOGFOOD-FULL; this record proves the two mechanical claims the new doctrine makes.
