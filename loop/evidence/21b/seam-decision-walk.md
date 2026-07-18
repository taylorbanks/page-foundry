# 21b micro-dogfood: seam-decision walk on real local state

Date: 2026-07-18. Method: run the real Phase -1 detection sweep on this machine, then walk each new seam's decision text against that state and the repo's own `docs/index.html` as the fixture page. Every detection below is actual command output (the sweep commands and raw results are in the iteration log); every outcome quotes the shipped doctrine it applies. Nothing here was invoked speculatively; the walk checks that the text produces one unambiguous decision per state.

## Detection sweep (real output)

```
canvas-design: absent            image: absent
webapp-testing: absent           algorithmic-art: absent
remotion-best-practices: /Users/taylor/.claude/skills/remotion-best-practices
remotion-create: absent          remotion-render: absent
remotion-captions: absent        vercel-react-view-transitions: absent
deploy-to-vercel: absent         onboarding: absent
gstack: /Users/taylor/.claude/skills/gstack (slash commands present this session, `/diagram` included)
docs/index.html: static HTML, zero react/jsx hits, plain script tags
```

## Walk

**1. OG-card producer.** Governing line: "The generated card has one producer per install state: canvas-design, when installed, composes it directly as a real 1200x630 image file in `assets/`; without it, a one-off `og.html` in the run artifact directory ... captured to `assets/og.png`." State: canvas-design absent. Decision: the `og.html` capture path, which is exactly what the 13p iteration already dogfooded for the docs property. One state, one producer, no ambiguity. Had canvas-design been present, hand-rolling `og.html` would fail TESTS 60 as written.

**2. Photographic imagery.** Governing line: imagery bullet, "comes through the **image** skill when installed." State: absent. Decision: existing paths stand and the degraded line records the gap, per the same bullet's closing rule in TESTS 60. The docs page carries no photographic slots, so on this fixture the seam is not in scope at all, and the gate report correctly carries no `image:` line (evidence lines exist only for companions in scope).

**3. Motion.** Governing lines: "whether motion exists at all was settled in the spec" and the stack sequence. State: the docs page spec has no motion slot; locally, one of the four stack skills is present (`remotion-best-practices`) and three are absent. Decision: no invocation of anything, because the WHETHER question already answered no; the stack's partial presence argues nothing (TESTS 62: "The stack's presence argues no clip into a spec"). Note for preflight realism: a spec that DID justify a clip would find the stack incomplete here, and the Phase -1 table would report the three missing names with their install command, now concretely `npx skills add remotion-dev/skills --skill <name>`. The old table row named a repo probe (`npx skills find remotion --owner remotion-dev`) instead of pinned names; the rewrite makes the gap detectable per name.

**4. React view transitions.** Governing line: "When that build is React, invoke vercel-react-view-transitions ... the React skill has no business on a static page." State: `docs/index.html` is static HTML (zero react hits). Decision: not invoked, no evidence line, exactly the TESTS 62 negative.

**5. Browser-gate executor.** Governing lines: Gate 3 intro and Gate 5's screenshot line. State: webapp-testing absent. Decision: the fallback chain stands as before (plain Playwright, headless Chrome with the window-floor warning, gstack `/design-review`), and no executor is invented (TESTS 61 negative). The 390 window-floor trap the AUDIT-F2 iteration hit is the concrete case the new executor line exists to close when the skill is present.

**6. How-it-works diagram.** Governing line: the lexicon's "gstack `/diagram` draws it when that command is installed." State: gstack present, `/diagram` available this session. Decision: the diagram shape now has a live producer on this machine; no diagram was generated because no compiled spec in this iteration carries a how-it-works section with that shape (generating one without a consuming spec would be a staged artifact under the integrity rules).

**7. Post-ship seams.** Governing lines: "runs only when the user asks for it, never as an inferred default" and "after every gate passes." State: the docs property has no v3 gate run on record this cycle, and no distribution request exists. Decision: deploy-to-vercel is not offered (absent anyway, and host-agnostic delivery stands), and the distribution seam refuses on both grounds independently: no request, and no green gates to stand on. Both TESTS 63 negatives fire correctly from this one real state.

## Verdict

Seven seams, each producing exactly one decision from the real state with no judgment calls left to the runner. The two decisions that required a live companion (`/diagram` producer, og.html fallback) both resolved against actually-detected state rather than assumed state.
