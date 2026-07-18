# Token plan fixture: grid spec + recomposition notes

Test fixture for the Gate 5 grid and recomposition check (backlog 13k, TESTS.md 48). A fictional dev-tool page; values are the spec the two fixture builds are checked against.

## Layout grid spec

| Breakpoint | Container max | Columns | Gutter |
|---|---|---|---|
| 1024px and up | 1120px | 12 | 24px |
| 768 to 1023px | 720px | 6 | 16px |
| under 768px | 100% minus 16px padding | 4 | 16px |

Custom properties in `theme.css`: `--container-max: 1120px`, `--grid-cols: 12`, `--gutter: 24px` (re-set inside the 768px and mobile media queries). Gutters sit on the 4pt scale.

## Recomposition notes

- **Hero at 768px:** the two-column media object stacks; the visual moves below the headline block, the CTA goes full-width under both.
- **Densest section (feature grid) at 768px:** three-up becomes two-up on the 6-column grid.
- **Densest section at 480px:** two-up becomes one-up, full column width.
