# 21a micro-dogfood 1: the Gate 6 on-page line walked against a real page

Date: 2026-07-18. Target: `docs/index.html` (the live homepage source, a real shipped page). Method: the on-page framework the new Gate 6 line names (title and meta against intent and truncation, heading structure, image alt coverage, link text, indexability), executed mechanically with a python extraction over the raw HTML. The seo-audit companion was not invoked as a skill here; the walk proves the line's checks are executable against a real page and produce dispositions, which is what the doctrine asks of a run.

## Raw extraction (verbatim script output)

```
title (59 chars): 'page-foundry: a whole marketing team on every page you ship'
meta description (174 chars): 'An open-source Claude Code skill that runs the best marketing and design skills in order, gates the result, and ships a page in your voice that does not read or look AI-made.'
canonical: 'https://taylorbanks.github.io/page-foundry/'  robots-meta: None
headings in order: [('1', 'A whole marketing team on every page you'), ('2', 'Three real pages. They look nothing alik'), ('2', 'Every page an agent writes comes out a l'), ('2', 'One command runs the skills a good page'), ('2', 'Eight gates. A page that fails one does'), ('2', 'You own the page. Or hand it off.'), ('3', 'Build mode'), ('3', 'Handoff mode'), ('2', 'Read the source before you trust it.'), ('2', 'One command.')]
h1 count: 1
imgs: 3, missing alt: 0
links: 19, vague-text links: 0
```

## Dispositions, per the new line's fixed-or-accepted doctrine

- Title: 59 characters, inside the search-result budget, names the product and the promise. PASS.
- Meta description: 174 characters. FINDING: over the roughly 160-character truncation point, so the closing claim ("does not read or look AI-made") is the part a search result cuts. Routed to 19b (the docs truth pass owns docs copy edits; this walk's job is to surface, not to fix out of order). Not accepted; open.
- Heading structure: one `h1`, `h2` sections with `h3` only nested under a parent `h2`. PASS.
- Image alt coverage: 3 images, 0 missing alt. PASS.
- Link text: 19 links, 0 vague ("click here" class). PASS.
- Indexability: no robots meta (indexable by default), canonical present and absolute. PASS.

One real finding surfaced and routed with a reason; five checks passed on a page this repo actually ships. The line does what it says.
