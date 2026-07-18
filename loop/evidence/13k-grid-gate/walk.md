# Gate 5 grid and recomposition check: fixture walk

Backlog 13k (order-audit F8), TESTS.md 48. The new gate line performed on two fixture builds against `token-plan.md` in this directory. Static half only: the screenshot walk of note-named breakpoints needs a live render and runs in DOGFOOD-FULL; this walk proves the CSS-versus-spec read catches real divergence and passes a conforming build.

## Spec (from `token-plan.md`)

```
| 1024px and up | 1120px | 12 | 24px |
| 768 to 1023px | 720px | 6 | 16px |
| under 768px | 100% minus 16px padding | 4 | 16px |
```

Recomposition notes: hero stacks at 768 (visual below headline, CTA full-width); features 3-up to 2-up at 768; 2-up to 1-up at 480.

## Conforming build (`page-match/`): PASS

Verbatim grep of `page-match/theme.css`:

```
2:  --container-max: 1120px;
3:  --grid-cols: 12;
4:  --gutter: 24px;
7:  :root { --container-max: 720px; --grid-cols: 6; --gutter: 16px; }
10:  :root { --container-max: calc(100% - 16px); --grid-cols: 4; --gutter: 16px; }
```

Every spec row implemented as custom properties, re-set per breakpoint. Recomposition notes in the CSS: the 1023px block stacks the hero (`grid-template-columns: 1fr`, `.visual { order: 2 }`, full-width CTA) and takes `.features` to `repeat(2, 1fr)`; the 480px block takes it to `1fr`. All three notes present.

## Drifting build (`page-drift/`): FAIL, four findings

Verbatim grep of `page-drift/theme.css`:

```
2:  --container-max: 1240px;
3:  --grid-cols: 12;
4:  --gutter: 30px;
```

1. Container 1240px against a spec'd 1120px.
2. Gutter 30px against a spec'd 24px, and 30 is off the 4pt scale.
3. The 768 and mobile spec rows are unimplemented: no media query re-sets the custom properties, so the tablet grid the spec commits to never exists.
4. Recomposition note violated: the 1023px media block carries hero rules only; `.features` stays `repeat(3, 1fr)` at 768, where the note says two-up. Verbatim block:

```
@media (max-width: 1023px) {
  .hero { grid-template-columns: 1fr; }
  .hero .visual { order: 2; }
  .hero .cta { width: 100%; }
}
```

Per the gate line, each finding is fixed in the page or the spec is amended with the reason recorded in the token plan file; silent divergence fails. Finding 4 is exactly the case the screenshot half exists for on a real run: a breakpoint named by a note, sitting between the standard widths, that must be looked at rather than inferred.
