# 15b micro-dogfood: detect.mjs over the live docs page

Command, run 2026-07-18 from the pinned local clone (`~/projects/impeccable`, commit 8967edc, installed-skill frontmatter version 3.9.1):

```
node ~/projects/impeccable/skill/scripts/detect.mjs --json docs/index.html docs/theme.css
```

Verbatim JSON output: `detect-output.json` in this directory. Two findings, both true positives, matching the empirical claim in issue #15:

1. `numbered-section-markers` (advisory) on `docs/index.html`: the pipeline section labels `01` to `06`.
2. `side-tab` (warning) on `docs/theme.css` line 88: `border-left:6px solid var(--red)`.

Exit-code semantics, verified against both a clean fixture and a findings file:

- clean input prints `[]` and exits 0
- findings present: JSON array of findings, exit 2

An earlier check in this iteration read exit 0 on the findings case because `$?` was read after a pipe into `head`, so it reported the pipe tail's status. The unpiped re-run corrected it before any doctrine text was written. Gate doctrine states the verified behavior: exit 0 clean, non-zero with findings, and the finding list is the JSON array.

Ignore mechanism, verified from `detect.mjs --help` and the clone's own `.impeccable/config.json`: the detector respects `detector.ignoreRules`, `detector.ignoreFiles`, and `detector.ignoreValues` (entries carry `rule`, `value`, optional `files`, `createdAt`, and a `reason` string), plus inline `impeccable-disable` comments. This is why Gate 5's accepted-findings record is the product's own `.impeccable/config.json` rather than a parallel page-foundry file: the file the detector already honors is the one that cannot drift from what the detector does.

The two findings on our own page stand as open items for the docs property; they are not accepted-findings candidates until the owner decides they are deliberate. Recorded in the report draft.
