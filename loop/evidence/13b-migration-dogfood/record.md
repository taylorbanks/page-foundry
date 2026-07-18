# 13b micro-dogfood: Phase 0 v2.x adoption executed on a fixture

Date: 2026-07-18 (iteration 12). All content below is labeled FIXTURE; no real product data.

## What was tested

SKILL.md Phase 0 step 2 (new in 13b) was executed by hand, exactly as written, against a
workspace holding v2.x state. The step under test:

```
Adopt v2.x state. Versions before 3.0 left run artifacts beside the page output, in the page
directory or the workspace root: foundry-log.md, copy-approved.md, saved page specs, token
plans, sometimes the brief itself. Check those locations; move anything found into the foundry
directory (copy-approved.md into copy/, a saved spec to page-spec.md, token plans into tokens/,
the log and the brief to their step 1 homes) and tell the user what moved. When a log exists in
both places, append the old entries the new file lacks, oldest first, then delete the old file:
run records are history, and adoption drops none of it.
```

## Fixture (before)

```
./.agents/foundry/acme/foundry-log.md    <- partially-created v3 log, one entry (2026-07-01)
./.agents/product-marketing.md           <- repo-case brief (step 1 home; must not move)
./pages/acme/copy-approved.md            <- v2.x snapshot beside the page output
./pages/acme/foundry-log.md              <- v2.x log, two entries (2026-05-01, 2026-06-10)
```

The double-log fixture exercises the merge rule, the hardest branch: a run that started on v3
before adoption ran would produce exactly this state.

## Result (after)

```
./.agents/foundry/acme/copy/copy-approved.md
./.agents/foundry/acme/foundry-log.md
./.agents/product-marketing.md
```

- `copy-approved.md` moved into `copy/`, per the step's move table.
- Logs merged: the two old entries the new file lacked were appended oldest first, ahead of the
  newer v3 entry; result is one chronological log with all three entries. Old file deleted.
- The brief stayed at `.agents/product-marketing.md`: its step 1 home in the repo case, so
  there was nothing to move. This is the marketingskills-convention exception working.
- `pages/acme/` holds zero run state afterward. No orphaned files.

Merged log (fixture):

```
# foundry-log (FIXTURE)

### 2026-05-01 · build · saas-homepage
- headline: Fixture headline one
- open items: fixture item A

### 2026-06-10 · build · saas-homepage
- headline: Fixture headline two
- learnings: fixture lesson

### 2026-07-01 · build · saas-homepage
- headline: Fixture headline three
```

## Verdict

The prose was executable with no improvised decisions: every file in the fixture had exactly one
destination named by the step, and the merge rule fully determined the double-log outcome. That
is the bar for migration text an agent runs unattended.
