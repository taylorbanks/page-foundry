# 11g micro-dogfood · anti-template check at Gate 1

Two walks of the new Gate 1 checklist item, exactly as written in `references/ship-gates.md`, against a FIXTURE log. The log below is synthetic test data (no real property has three v3 runs yet); it is labeled as such and exists only to exercise the check's two branches. Nothing in it is presented as a real conversion result.

## Fixture: `foundry-log.md` for a hypothetical property, three prior runs

```
### 2026-05-02 · build · saas-homepage
- skeleton: hero, problem, mechanism, proof, objections, close · problem-led/copy-plus-CTA/interleaved/compressed
- conversion data:

### 2026-05-30 · build · saas-homepage
- skeleton: hero, problem, mechanism, proof, objections, close · problem-led/copy-plus-CTA/interleaved/compressed
- conversion data:

### 2026-06-21 · build · saas-homepage
- skeleton: hero, problem, mechanism, proof, objections, close · problem-led/copy-plus-CTA/interleaved/compressed
- conversion data:
```

(Non-skeleton lines trimmed for the walk; the check reads only `skeleton` and `conversion data`.)

## Walk 1: new spec repeats the skeleton, no data behind it

New page's spec records: `hero, problem, mechanism, proof, objections, close · problem-led/copy-plus-CTA/interleaved/compressed`.

- Compare against the last three runs' `skeleton` lines → match, all three.
- Matched runs' `conversion data` → empty on every one.
- Branch taken: **flagged**. Three structurally identical pages with nothing measured is convergence the reference produced, not convergence the buyer produced.
- Resolution demanded by the check: the spec shows why this buyer's objection map landed on the same structure, or the skeleton goes back to Phase 2. The fixture spec has no such justification → skeleton goes back to Phase 2.

Result: the check catches exactly the defect issue #11 names (100 pages converging on one wireframe) at the gate, before ship.

## Walk 2: same history, data on the matched run

Same fixture, except the 2026-06-21 run carries `conversion data: 4100 visits, 213 signups, 5.2%, organic` (fixture numbers, labeled as such).

- Compare → match as before.
- Matched run's `conversion data` → present.
- Branch taken: **passes**. Converged because it converts; the repeat is justified by measurement, not habit.

Result: the check does not punish a structure that earned its repetition, which is the "converged-because-it-converts is fine" half of the plan's doctrine.

## Walk 3: no prior log

A first run on a fresh property has no `foundry-log.md` → the check reports **N/A**, per its final clause. No false flag on page one.

## Mechanical acceptance check (issue #11: "no archetype contains a numbered section sequence")

Run against the shipped file:

```
$ awk '/^---$/{found=1} found && /^[0-9]+\. /' references/archetypes.md
(no output)
$ awk '/^---$/{found=1} found && /[Ss]lot [0-9]/' references/archetypes.md
(no output)
```

Zero numbered list lines and zero slot references in the eight archetype bodies (everything after the `---` separator; the numbered lists above it are the schema definition, the shared constraints, and the compiler's five questions, which are doctrine, not section sequences).
