# 15a micro-dogfood: PRODUCT.md handoff, proven against impeccable itself

Item: 15a (#15). The new SKILL.md doctrine says page-foundry writes the product's root `PRODUCT.md` from its own brief before any impeccable command runs, so no impeccable command ever re-interviews the user. This dogfood compiles a real PRODUCT.md from this repo's own real brief and proves impeccable accepts it.

## Inputs (all real, none invented)

- `.agents/product-marketing.md` (this repo's brief, 2026-07-07): users, purpose, positioning source, CTA, proof inventory, brand voice, objections.
- `.agents/message-architecture.md`: the positioning sentence, the message hierarchy (became the belief ladder, in order), the 10-second line.

## Mapping applied (the doctrine, exercised field by field)

| PRODUCT.md section | Source |
|---|---|
| Register | `brand` per doctrine (marketing page is a brand surface) |
| Platform | `web` per doctrine |
| Users | brief Target Audience + Jobs to be done |
| Product Purpose | brief one-liner + What it does + Business goal |
| Positioning | message-architecture positioning sentence, verbatim |
| Conversion & proof | brief Primary CTA + secondary; 10-second line = message hierarchy claim 1; belief ladder = hierarchy claims 1 to 5 in order; proof = the three real pages + author credibility + honest low-install note |
| Brand Personality | brief Brand Voice fields |
| Anti-references | brief objection 1 and Words to avoid, buyer quote carried verbatim |
| Design Principles | brief value themes, verbatim |
| Accessibility | left out: the brief holds nothing for it (doctrine: a field the brief cannot fill stays out) |

## Result

`node ~/projects/impeccable/.claude/skills/impeccable/scripts/context.mjs` run with cwd at the dogfood directory (clone pinned at `8967edc`, SKILL.md frontmatter `version: 3.9.1`):

- exit 0; zero `NO_PRODUCT_MD` in the output (the interview-divert path never fires).
- The compiled PRODUCT.md prints as the context block every impeccable command reads first.
- Tail of output routes by our Register value: `NEXT STEP: This project's register is` `brand` `. You MUST now read` `reference/brand.md`.

Verbatim output in `context-output.txt`; the compiled file in `PRODUCT.md` beside it. Correction to the iter-17 report line: the pinned clone at `8967edc` carries frontmatter version 3.9.1, not 3.2.1 as the 13f note said.
