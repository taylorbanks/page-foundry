---
version: alpha
name: page-foundry
description: Design system projection for the page-foundry docs homepage, compiled from the property's committed tokens.
colors:
  primary: "#ff3b1d"
  red: "#ff3b1d"
  ink: "#0a0a0a"
  ink-2: "#2b2b28"
  bg: "#fafaf7"
  panel: "#ffffff"
  wash: "#f0efe9"
  dim: "#4a4a45"
typography:
  display:
    fontFamily: '"Helvetica Neue", "Arial Black", "Arial Bold", Arial, sans-serif'
    fontWeight: 800
    lineHeight: 0.94
    letterSpacing: "-0.03em"
  body:
    fontFamily: '-apple-system, BlinkMacSystemFont, "Helvetica Neue", Arial, sans-serif'
    fontSize: 1.02rem
    lineHeight: 1.5
  mono:
    fontFamily: 'ui-monospace, "SF Mono", Menlo, Consolas, "Liberation Mono", monospace'
    fontSize: 0.86rem
rounded:
  none: 0px
components:
  button-copy:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.ink}"
  button-github:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.bg}"
  command-bar:
    backgroundColor: "{colors.ink}"
    textColor: "{colors.bg}"
    typography: "{typography.mono}"
  section-tag:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.ink}"
---

## Overview

page-foundry is a gated pipeline that turns one product brief into one shipped marketing page, built for people who ship many pages and want none of them reading or looking AI-made. This page sells it to a solution-aware developer audience: readers who already know agent-written pages convert poorly and are comparing fixes. The page's single job is the install command. The committed direction is "Slab": brutalist-minimal, white ground, pure black ink, one screaming red, thick borders, oversized grotesque display type. It reads as honest to a practitioner audience; commit fully or not at all.

## Colors

Red (`primary`) is used only for large display text, borders and rules, section tags, and black-on-red buttons. Small text is always black on white; `dim` carries metadata and captions; `wash` and `panel` are the only surface variations. No gradients anywhere. Contrast is WCAG 2.2 AA from the ground up: black-on-red buttons measure 5.9:1.

## Typography

Display is an oversized grotesque: weight 800, uppercase, tight tracking, line height under 1. Body is the system sans at a calm size and normal case. The monospace stack carries commands, metadata, and the gate report; it signals real terminal output, never decoration. No other faces enter the page.

## Layout

One centered column, max width 76rem, horizontal padding `clamp(1rem, 4vw, 1.6rem)`. Sections stack full-width and are separated by 3px black rules, with vertical padding `clamp(2.6rem, 7vw, 4.6rem)`. Density is compressed: this audience decides in minutes, so the page favors tight, bordered grids (an uneven two-column showcase, a three-column roster) over airy scroll theater. Page structure and section order are not this file's contract; they come from the page spec.

## Elevation & Depth

Flat, and deliberately so. There are no shadows on the property. Depth comes from 3px black borders, surface shifts between `bg`, `panel`, `wash`, and the inverted ink-on-black report card. Nothing floats.

## Shapes

Square. Corner radius is 0 everywhere; the shape language is the 3px black border and the hard rule. Nothing is pill-shaped, nothing is rounded.

## Components

The command bar is ink-on-black with monospace text and an attached red copy button, uppercase, weight 800. The GitHub button inverts to black with light text. Section tags are small red blocks with black uppercase text. Focus visibility is a 3px red outline offset 2px on every interactive element. Links are black, underlined by weight or a 4px red underline in the star treatment, and turn red on hover.

## Do's and Don'ts

Do style exactly one action as the primary CTA; every repeat of it is identical in treatment. Do not add logo strips, star ratings, avatar rows, or count badges that are not in the package. And reject these defaults regardless of direction:

- Purple-to-blue gradient on anything.
- The big-stat-number + small-label + gradient-accent hero; use it only when the metric genuinely is the claim.
- Inter (or any default sans) as the display face with no stated reason.
- Three-column icon-card feature grids with line icons and centered text.
- The cream background + serif display + terracotta accent combo, the near-black + acid green (or vermilion) combo, and the hairline-rule broadsheet look, when chosen by default rather than for cause.
- Uniform border radius on every element; identical card shadows everywhere.
- Abstract blob illustrations, isometric people, stock photos of meetings.
- Emoji as section markers.
- AI-generated hero imagery that depicts nothing real about the product. Real screenshots, real terminal output, real diagrams, real photography only.
- Any staged reconstruction of the product in use: a hand-built terminal, a mocked screenshot, or a console showing output that was not actually produced. Show a real artifact of real use, or describe the thing in words.
- When the request is "bolder": cyan/purple gradients, glassmorphism, neon accents on dark backgrounds, gradient text on metrics, and scroll-fade-rise reveals on every section are the saturated AI defaults for impact. Reject them first, then raise impact by making the committed design language more decisive inside the existing tokens.
