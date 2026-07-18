# 13c micro-dogfood: mechanical quote trace (Gate 2 + Gate 8)

Date: 2026-07-18 · Item: 13c (#13) · Files under test: the new Gate 2 quote-search bullet and Gate 8 fabricated-attribution bullet in `references/ship-gates.md`, against the voc.md schema published in SKILL.md Phase 1.

Fixtures (test data, not real VOC): `voc-fixture.md` (one Verbatim entry with source, one Paraphrase entry, one Recurring-language entry) and `page-fixture.html` (three rendered quotes: one verbatim, one paraphrase styled as a quote, one invented).

Procedure executed exactly as the gate text describes: strip tags, extract each quoted string, search the voc file's Verbatim section for it character for character; on a miss, check the Paraphrase section to classify the failure. Output (`trace-output.txt`):

```
3 quotes extracted from rendered page:
  GATE 2 PASS  (verbatim match)      : "I set it up on a Tuesday and stopped thinking about it."
  GATE 8 FAIL  (paraphrase as quote) : "Setup takes minutes and then it fades into the background."
  GATE 8 FAIL  (matches nothing)     : "This tool changed how our whole team works."
```

What this proves, per the item's acceptance: the quote-integrity check runs as a text search with no judgment call in the loop. The verbatim quote passes, the paraphrase wearing quotation marks fails as fabricated attribution, and the invented quote fails as matching nothing. Both defect classes the issue names (paraphrase posing as verbatim; fabricated quotes) are caught mechanically against `voc.md`.
