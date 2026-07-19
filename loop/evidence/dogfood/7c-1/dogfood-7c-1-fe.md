# dogfood-7c-1-fe: S4 quickstart output resolved from a live capture

DOGFOOD-7c-1 is the copy-stabilization slice of the DOGFOOD-7c split. It resolves
F-E, the last `[TK]` in the Interceptor page body: the S4 quickstart output pane.
The screen was unlocked this iteration (`CGSSessionScreenIsLocked` absent, console
user `taylor`, Chrome running), so lessons 30 and 35 no longer block a live
capture. With the screen unlocked, F-E resolved by capture, not by cutting the
pane.

## The capture

Ran the real product CLI against a real page:

```
$ interceptor open https://example.com

Tab: 1943086619 | https://example.com

[e1] link "Learn more" href="https://iana.org/domains/example"

---
Example Domain

This domain is for use in documentation examples without needing permission. Avoid use in operations.

Learn more
```

`interceptor 0.16.9` (`86e7eb6`, built 2026-06-13), exit 0. Saved verbatim at
`loop/evidence/dogfood/7c-1/s4-capture-stdout.txt`. The operation trace
(`tab_create`, `wait_stable`, `get_a11y_tree`, `extract_text`) prints to stderr;
the result above is stdout, which is what an agent consumes and what S4 shows. The
target is `example.com`, a page that exists for documentation examples, so the
demo is a real run against a page built for exactly this.

## What this backs about the output shape

S4 claims that `interceptor open <url>` returns a page's structure and its visible
text in one call. The captured result shows both: the accessibility tree (`[e1]
link "Learn more" ...`) above the `---` divider, and the visible text (`Example
Domain ...`) below it. The claim is now backed by real captured output.

## Reconciliation

- `foundry/copy/copy-approved.md` S4: the `[TK]` placeholder and its "output goes
  here once the tool runs" figcaption were replaced by the real figcaption ("Here
  is its real output against `example.com`:") and two fenced blocks, the command
  and the captured output. The preamble line that said the output stays `[TK]` now
  records this resolution.
- `pages/interceptor/index.html` S4: the `<pre class="output">` placeholder span
  was replaced by the verbatim captured output; the command `<pre>` now shows the
  concrete `interceptor open https://example.com`; the figcaption matches the
  snapshot. The dead `pre.output .tk` CSS rule, whose only user was the removed
  placeholder span, was deleted.

## Verification

- Gate 2 verbatim diff: the S4 figure's rendered text (figcaption, command,
  output) matches `copy-approved.md` word for word and in reading order; the block
  boundaries add blank lines only. The page body holds no `[TK]` marker now.
- Voice scan: `copy-approved.md` and `index.html` both PASS, 0 FAIL, 0 WARN.
- `bash loop/verify.sh`: GREEN.

## OWNER-REVIEW

- The captured output includes the tool's ephemeral `Tab: 1943086619` header line,
  shown verbatim for integrity (exactly what the tool printed). The owner may
  prefer to trim that one metadata line on the real marketing page; trimming real
  output is an editorial call, left to the owner rather than pre-trimmed here.
- `example.com` is the demo target. It is honest and stable. If the owner wants
  the demo to run against the Interceptor project's own page or another site, the
  capture is a one-command rerun.

## Still open (DOGFOOD-7c-2)

The render gates (Gate 1 re-score, Gate 4 performance, Gate 5 render review and
design detect) and the 390 and 1440 renders. Copy is frozen now, so those renders
run against stable copy.
