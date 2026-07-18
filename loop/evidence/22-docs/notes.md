# 22: the docs page answers its own detector

Dispositions for the six findings routed to #22, executed 2026-07-18. Two came from the detector (15b dogfood), two from the AUDIT-F2 comp round, two from the #18 Gate 3 walk.

## The two detector findings

1. `side-tab` (warning, `theme.css` line 88): restyled. The founder quote and the orchestrator callout drop the red left bar for the page's own boxed idiom, a `var(--bd)` ink border on the white panel. The stylesheet no longer contains a one-sided colored border.
2. `numbered-section-markers` (advisory, `index.html`): accepted, in `.impeccable/config.json` at repo root under `detector.ignoreValues`, scoped to `docs/index.html`, with the reason in the entry: the roster ordinals and the gate numbers are the page's content rather than decorative scaffold. The how-it-works section claims the pipeline runs in order; the gates are numbered 1 to 8 in the product's own ship-gates doctrine. Flagged OWNER-REVIEW in the report draft, since the issue invited owner input on which branch each finding takes.

The split is deliberate: one finding restyled, one accepted, so the repo demonstrates both branches of the findings-are-floors doctrine on its own homepage, through the same config file Gate 5 tells every run to use.

## The two comp-round findings (showcase module)

Treatment branch taken, per the round-1 note's second option: the two small showcase cards now carry a bottom fade (`mask-image` linear gradient, opaque to 55 percent, transparent by 97 percent, with the `-webkit-` twin). They read as deliberate page-top peeks instead of near-illegible full pages, and the StreamPatron capture's mid-glyph line cut dissolves before it renders at every width.

The StreamPatron source capture was not recropped, though the issue comment suggested that mechanism. Reasons, recorded as an autonomous decision: the displayed box runs from roughly 2.6:1 to 3.1:1 across breakpoints while the headline block plus badge is close to 2.9:1 with no margin, so every static crop puts a glyph edge at some width; and this macOS silently center-crops under `sips --cropOffset` (lesson 28), which makes crop surgery the least trustworthy tool in reach tonight. The fade resolves the defect the owner named (a cut that reads as a broken render) structurally, at all widths, with one CSS declaration. OWNER-REVIEW: if he prefers recropped sources, the fade does not block that later.

## The two Gate 3 findings (interactive states)

`.nav__links a:hover` and `.foot a:hover` restyled: hover now adds a 2px underline with 3px offset alongside the color shift, so the state change no longer signals by hue alone. `.cmd__c:hover` was read as borderline in the #18 walk and needed no disposition.

## Scan evidence

- Before (15b dogfood): two findings, exit 2 (`../15b-detect-dogfood/detect-output.json`).
- After: `detect-after.json` in this directory. Output `[]`, exit 0, run from repo root so the detector reads `.impeccable/config.json` from cwd (verified in `impeccable-config.mjs`: `readDetectionConfig(process.cwd())`).
- Probe 1: `theme.css` as of HEAD, scanned alone, still fires `side-tab` and exits 2.
- Probe 2: `index.html` scanned from a cwd with no config still fires `numbered-section-markers` and exits 2.

The probes are what make the empty output trustworthy: the detector is live, the invocation is correct, and each finding disappears for its intended reason (restyle for one, scoped acceptance for the other). The acceptance suppresses nothing else; probe 1 shows `side-tab` still fires where it exists.

## Captures

- `comp-1440-after.png`: headless Chrome, window 1440x4800, full page through the footer.
- `comp-390-wrap-after.png`: 600px window over `wrap390.html`, an iframe fixed at 390px, per the window-floor caveat in the issue (headless Chrome floors bare windows at 500px and fabricates right-edge overflow). Full page through the footer; media queries honored.
- Both captures read back frame by frame: callout boxes render at both widths, fades land on both small cards, and the layout is intact through the footer.

Tooling note, recorded honestly: `interceptor screenshot` timed out after 45 seconds on every page tried tonight, including a trivial one-line probe page, over both `file://` and localhost; `interceptor screenshot --pixel` failed on the activeTab permission. Captures fell back to headless Chrome, the method REVIEW-4 already audited for the AUDIT-F2 comps, with the same wrapper technique for 390. The a11y-tree and read paths of Interceptor worked throughout; only capture and eval were down. `interceptor eval` was CSP-blocked, so the hover fix is verified at source level, which is the level Gate 3's own check operates at.
