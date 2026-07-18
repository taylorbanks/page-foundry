# FIXTURE · approved draft · copy-fit input · trim walk

This file is a labeled test fixture for the copy-fit pass's trim and re-entry branch. The product (`gridwatch`, a schema-change monitor CLI) is fictional; no copy here ships anywhere. The fixture exists so the walk can exercise an edit, which the real homepage material did not need.

## Head

TITLE: gridwatch: see which queries a schema change breaks
META DESCRIPTION: A CLI that watches staging schema changes and names the queries each one breaks, before the deploy that would find out in production.

## Section 3: What you get

Shape (from the signed spec): feature list, three columns at 1440.

H2: What you get

- Names the queries each staging schema change breaks.
- One YAML file per environment, checked into the repo beside the code it guards and reviewed in the same pull request.
- Blocks deploys that carry an unreviewed breaking change.
