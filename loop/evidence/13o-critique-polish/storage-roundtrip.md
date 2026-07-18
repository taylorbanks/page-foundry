# 13o evidence: the critique snapshot polish reads is mechanically real

Backlog item 13o (order-audit finding F2, separable piece) wires impeccable's `critique` output to `polish` at the Gate 5 fix loop. Before writing that doctrine, this dogfood exercised the pinned clone's real storage helper end to end, in a clean temp directory, so every mechanic the new gate text names was observed rather than assumed. Clone: `~/projects/impeccable` at `8967edc`, the same pin 15a/15b/16 used.

## What impeccable's own files say

`skill/scripts/critique-storage.mjs` header, verbatim:

> The polish workflow reads the latest matching snapshot at start as its
> fix backlog. No other skill auto-reads critique output.

`skill/reference/polish.md` step 4, verbatim:

> Exit 0 with body = found; fold the P0/P1 items into your polish list and mention the snapshot path so the user sees what you read. Exit 2 = no snapshot, continue without it.

`skill/SKILL.src.md` status flow (line 159): `critique.latest` with a low `score` or non-zero `p0` / `p1` routes to `polish` "(it reads that snapshot as its backlog)".

The capability audit (`plans/research/order-audit-capability.md`, gap 8) found page-foundry invoking `critique` as advisory and stopping: the snapshot had no consumer, so critique was ceremony.

## The round trip, observed

Run 2026-07-18 in `/tmp/13o-dogfood` (fresh directory, no prior impeccable state). All exit codes read unpiped. The snapshot body is a labeled fixture; the tool, paths, and exit codes are the real mechanism.

1. `node critique-storage.mjs slug pages/acme/index.html` printed `pages-acme-index-html`, exit 0. The slug is derived from the resolved artifact path, which is what keeps it stable across runs.
2. `node critique-storage.mjs latest pages-acme-index-html` with no snapshot on disk: no output, exit 2. Matches the polish.md "continue without it" branch.
3. `IMPECCABLE_CRITIQUE_META='{"target":"pages/acme/index.html","total_score":21,"p0_count":1,"p1_count":1}' node critique-storage.mjs write pages-acme-index-html body.md` printed the created path and exit 0:

   ```
   /private/tmp/13o-dogfood/.impeccable/critique/2026-07-18T17-19-33Z__pages-acme-index-html.md
   ```

4. `latest` again: exit 0, body returned with the frontmatter carrying `total_score: 21`, `p0_count: 1`, `p1_count: 1`, the timestamp, and the slug, followed by the fixture body with its P0 and P1 items.
5. On disk: `.impeccable/critique/2026-07-18T17-19-33Z__pages-acme-index-html.md`, the directory the companion table row already names as critique's output location.

## What this licenses

Every claim in the new Gate 5 fix-loop line is observed behavior: the snapshot persists under the product's `.impeccable/critique/` with the score and the P0/P1 counts in its frontmatter, retrievable by the exact `latest` call polish makes at its step 4. The wiring the doctrine adds ("a failed render review runs `critique`, and `polish` reads that snapshot as its backlog") is impeccable's own designed loop, not an invention of ours; page-foundry's change is only to stop dropping the baton between the two commands.
