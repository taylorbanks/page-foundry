# Voice

This file governs every word that ships on a page, and it is the single source of truth for the mechanical scanner (`scripts/voice_scan.py` parses the blocks marked `scan:` below). Edit this file, or run the Voice wizard in SKILL.md, and both the writing guidance and the scanner change together.

**First run:** this file ships with a neutral default register. Run the Voice wizard ("set up my voice") to make it yours, or edit the sections below directly; the scanner follows this file, so guidance and enforcement change together. The AI-flagged vocabulary list near the bottom is owner-independent; keep it unless you have a specific reason not to. An owner's saved voice file can be dropped over this one at any time (overlay install).

<!-- voice-config
owner: default
em_dash: fail
en_dash: fail
max_exclamations: 1
-->

## Register (owner-configurable; the wizard rewrites this section)

Neutral default until an owner configures their own:

- Plain language, short sentences, active voice. Write like a competent person explaining something to a peer.
- Specific beats clever. Concrete nouns and real numbers beat adjectives every time.
- Claims are checkable. If no reader could prove a sentence wrong, it is not saying anything; cut it.
- Describe the work; do not praise it. "Scans your whole estate in 20 minutes" beats "blazing-fast industry-leading scanning".
- One idea per sentence. If a line needs a second read, split it.
- Humor only if the owner's brand uses it; the default is none.

## Punctuation (defaults; owners change these via the wizard, enforced via voice-config above)

- **No em dashes, no en dashes in prose.** Use commas, semicolons, periods, or restructure. Hyphens in compound words are fine. Numeric ranges use "to".
- No exclamation points in body copy beyond the configured maximum (currently 1 per page, and only if the brand uses them at all).
- Sentence case for headings and buttons unless the design direction states otherwise.

## Banned list

Zero FAIL occurrences in shipped copy. The scanner enforces the lists below mechanically; the intent is broader than the literal list: anything that pattern-matches to AI-generated or generic-marketing voice is out, even if not listed. One term per line; lines starting with `#` are comments.

<!-- scan:banned-phrases -->
# AI-flagged vocabulary
delve
dive deep
deep dive
robust
streamline
streamlined
seamless
seamlessly
holistic
cutting-edge
cutting edge
state-of-the-art
state of the art
game-changer
game changer
game-changing
revolutionize
revolutionary
transformative
unlock
unleash
elevate
empower
empowering
supercharge
harness
foster
realm
tapestry
testament
embark
beacon
paradigm
synergy
effortless
effortlessly
frictionless
innovative
world-class
best-in-class
industry-leading
next-level
turbocharge
skyrocket
crucial
pivotal
furthermore
moreover
in today's
in an era of
in the ever-evolving
ever-evolving
look no further
take it to the next level
at the end of the day
digital landscape
threat landscape
# Empty marketing phrases
no fluff
no hype
no bs
real talk
the ultimate
you'll ever need
join the revolution
don't miss out
trusted by thousands
# Hedge filler
arguably
essentially
basically
simply put
needless to say
it goes without saying
as you may know
<!-- /scan:banned-phrases -->

Words banned only in figurative use are listed below; the scanner reports them as WARN for human judgment (it cannot do part-of-speech tagging, and some have legitimate literal uses, like "leverage" as a noun).

<!-- scan:judgment-words -->
navigate
leverage
landscape
journey
ecosystem
intuitive
vital
<!-- /scan:judgment-words -->

## Replacement strategy

Do not synonym-swap a banned word; that produces the same sentence in a cheaper suit. Restructure around the concrete fact the sentence was gesturing at:

- Banned: "Leverage our robust platform to streamline your security workflow."
- Wrong fix: "Use our powerful platform to simplify your security workflow." (Same empty sentence.)
- Right fix: "Connect your scanner output once. Triage drops from four hours a week to twenty minutes." (A fact a reader can check.)

If no concrete fact exists to anchor the sentence, the sentence was decoration. Delete it.

## Voice check, beyond the scan

After the mechanical scan passes, read the page top to bottom once and ask of each section: would the owner say this sentence out loud to a client across a table? If it would sound like a brochure, rewrite it as the spoken version.
