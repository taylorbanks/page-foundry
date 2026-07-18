# AUDIT-F1b micro-dogfood · the copy-fit pass

Exercises the new `## The copy-fit pass` section of SKILL.md on two walks. Walk A uses real material (the shipped homepage's head and hero, the real 13d hero candidates, the real `docs/theme.css`) and proves the nothing-to-change branch: the freeze still happens. Walk B uses a labeled fixture and proves the edit branch: shape-fit finding, trim, meaning arbitration, voice-chain re-entry, freeze. All scan and diff output below is pasted verbatim from the runs.

## Walk A · real material · freeze-only branch

Inputs: `real/approved-draft.md` (head and hero extracted verbatim from `docs/index.html`), `loop/evidence/13d-hero-candidates.md` (the real Phase 3 candidates A, B, C with unit scores; C picked 15/15), and the shipped direction read from `docs/theme.css`.

**Step 1, hero re-pick against the real hero form.** The shipped form, from `docs/theme.css` lines 47 to 62: text-led hero, H1 at full wrap width, then a 1.5fr/1fr row placing the subhead (max-width 36ch) beside the CTA stack (install command, star link, proof line), collapsing to one column at 52rem. Reopening the three candidates under that form:

- Candidate C (the Phase 3 pick): the H1 works as a full-width statement, and its four-sentence subhead wraps tall in the 36ch column, which the form absorbs because the CTA stack beside it is also tall. The shipped page renders this balance; that is existence proof, not judgment.
- Candidate A: its fragment headline leans on the subhead to complete the thought, and in this form the subhead sits in a narrow column below-left rather than directly under the H1, so the dependency reads worse under exactly this form. The form moves A down, independent of its Phase 3 score.
- Candidate B: two short clauses sit fine at full width; the form neither hurts nor promotes it.

Call: C confirmed, reason recorded above. The re-pick stayed inside the scored candidates; no new drafting occurred (the behavior line the pass demands).

**Step 2, shape fit.** Only the hero is in this walk's scope, stated in the draft file. Confirmed: the shipped render fits the form.

**Step 3, trims.** None needed.

**Step 4, re-entry and freeze.** Zero sections edited, so the planned re-entry set is empty and no re-scan of edited sections was owed. The freeze still ran: `real/copy-approved.md` written, opening with the labeled TITLE and META DESCRIPTION entries, body verbatim from the draft. This is the "a pass with nothing to change still writes the snapshot" behavior.

Mechanical proof the body is verbatim (diff of everything from `## Head` down, draft vs snapshot):

```
DIFF-REAL-EXIT:0
```

(empty diff, exit 0)

Scan of the snapshot:

```
WARN  loop/evidence/audit-f1b/real/copy-approved.md:8  AI language pattern (three parallel verb-clauses)  | META DESCRIPTION: An open-source Claude Code skill that runs the best marketing and design
```

WARN justification: the flagged line is the live page's meta description, quoted verbatim, and it carries a three-verb-clause pattern (`runs ... gates ... and ships ...`). It shipped before the 13f pattern rules existed. Walk A edited nothing, so the pass owed it no re-scan; the finding belongs to the shipped page and was routed to #19 (docs truth pass) as a comment rather than fixed here, because editing live page copy is not this item's scope.

## Walk B · labeled fixture · trim and re-entry branch

Inputs: `fixture/approved-draft.md` (fictional product, labeled FIXTURE in the file; exists because the real material needed no edit and the edit branch has to be exercised too). Direction excerpt for the walk: the signed shape is a feature list, three columns at 1440, with the density note that list items hold to one line, about 62 characters, at that width.

**Step 1, hero re-pick.** Out of the fixture's scope (no hero section in the file); the fixture exercises steps 2 through 4.

**Step 2, shape fit.** Item 2 measures 117 characters against the one-line budget of about 62, so it wraps to two lines in the three-column shape. Fit problem, therefore a copy edit; the shape itself is untouched (changing it would be Phase 4 step 3's recorded override, which this walk correctly never reaches).

**Step 3, trim.** Before and after, with the meaning arbitration the guardrail demands:

- Pre (117 chars): `One YAML file per environment, checked into the repo beside the code it guards and reviewed in the same pull request.`
- Post (64 chars): `One YAML file per environment, reviewed with the code it guards.`
- Arbitration: the pre-trim line claims (a) one file per environment, (b) the file lives in the repo beside the code, (c) it is reviewed in the same pull request. The trim keeps (a) whole and compresses (b) and (c) into `reviewed with the code it guards`, which implies in-repo placement rather than stating it. Recorded as an accepted compression: same review entails same repo. A run whose brief treats the in-repo fact as load-bearing would reject this trim and re-draft instead; the arbitration line exists so that call is visible.

**Step 4, re-entry and freeze.** The edited section took its planned trip: scan of the frozen fixture snapshot came back PASS (verbatim below), and the semantic read for structural uniformity found the three item openings after the trim are `Names` / `One` / `Blocks`, so the edit introduced no parallel-roster pattern and no rewrite was proposed. The read was performed inline for this dogfood; a live run invokes the humanizer companion for it, per the pass's step 4 and the companion table.

```
PASS  loop/evidence/audit-f1b/fixture/copy-approved.md
```

The freeze wrote `fixture/copy-approved.md`, and the draft-vs-snapshot diff shows exactly the one trim and nothing else:

```
13c13
< - One YAML file per environment, checked into the repo beside the code it guards and reviewed in the same pull request.
---
> - One YAML file per environment, reviewed with the code it guards.
DIFF-FIXTURE-EXIT:1
```

## Behaviors confirmed, mapped to test 55

- Phase 3 ends at `approved-draft.md`; `copy-approved.md` exists only after the pass: both walks wrote the snapshot as the pass's last act, and no snapshot predates it in either directory.
- Hero finalist confirmed or re-picked among already-scored candidates, call and reason recorded: Walk A step 1.
- Section copy confirmed to read as its shape at the plan's density: Walk A step 2 (confirm), Walk B step 2 (fit finding).
- Trims fit copy to the budget without changing claims, with arbitration recorded: Walk B step 3.
- Every edited section takes one planned trip through the voice chain: Walk B step 4 (scan verbatim; semantic read recorded honestly as inline for the dogfood).
- Snapshot opens with the labeled TITLE and META entries: both `copy-approved.md` files.
- A pass with nothing to change still writes the snapshot: Walk A step 4, empty diff at exit 0.
- One pass, bounded: neither walk looped; Walk B's single re-entry covered the single edit.

Not exercised here, by design: the handoff propose-then-lock reduction (doctrine only, no package in scope) and a hero bounce to Phase 3 step 2 (no candidate failed the form). Both remain DOGFOOD-FULL or TESTS territory.
