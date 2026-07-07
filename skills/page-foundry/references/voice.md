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
optimize
optimise
utilize
utilise
facilitate
comprehensive
groundbreaking
bolster
underscore
unveil
nuanced
multifaceted
intricate
paramount
# AI openers, transitions, and closers
at its core
that being said
it's worth noting that
it is worth noting that
this begs the question
in conclusion
to sum up
in essence
with that in mind
imagine a world where
a myriad of
a plethora of
shed light on
pave the way for
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
ultimately
undoubtedly
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
enhance
<!-- /scan:judgment-words -->

## AI language patterns

A word list catches vocabulary; it cannot catch grammar. The tells that most give AI writing away are structural, so the gate checks patterns too. These fire as WARN; the copywriter reviews and rewrites each in Phase 3. The `scan:patterns` block below is the machine-readable subset; the Phase 3 pattern pass and the humanizer skill catch the rest that a regex cannot.

Patterns to kill on sight (from Wikipedia's "Signs of AI writing" and the seo-audit ai-writing-detection list):

- **Negative parallelism.** "It's not just X, it's Y." "Not only X but also Y." State the positive claim once.
- **Tailing negation fragments.** A sentence ending in a tacked-on "no guessing," "no wasted motion," "not a hunch." Write it as a real clause or cut it.
- **Copula avoidance.** "serves as," "stands as," "functions as," "acts as a." Use "is" or "are."
- **Forced rule of three.** Three parallel items or adjectives grouped to sound comprehensive. Use two, or four, or a plain sentence.
- **Authority tropes.** "the point is," "at its core," "what really matters," "the real question is." Drop the ceremony and state the point.
- **Significance inflation.** "marks a pivotal moment," "represents a shift," "a testament to." Describe what happened, not its importance.
- **Superficial -ing tack-ons.** A comma followed by "highlighting / underscoring / showcasing / reflecting..." that adds fake depth. Cut it.
- **False ranges.** "from X to Y" where X and Y are not on a scale. List the things instead.
- **Terse noun-pair fragments.** "Seven phases, eight gates." A punchy fragment pairing two counts. Make it a sentence.
- **Three parallel verb-clauses.** "It runs the skills, gates the result, and hands back a page." Three present-tense verb clauses in a row read as generated. Break the rhythm: two sentences, or vary the verbs and shapes. (Caught by the `three parallel verb-clauses` regex.)
- **Parallel-list uniformity.** A list where every item opens the same way ("Finds... / Pulls... / Structures... / Writes..."). Uniform openings across a set read as machine-made even when each item is fine alone. Vary the grammatical shape item to item. (The scanner flags a plain prose run of these; a list spread across separate DOM elements with labels is beyond regex, which is why the humanizer pass is a hard gate, not a suggestion.)

<!-- scan:patterns -->
# AI language patterns, WARN-level. Format: NAME|||REGEX (case-insensitive). Reviewed and fixed in Phase 3.
negative parallelism|||\bit'?s not (just |merely |simply |only )?[^.,;:]{1,45}[,;:]\s*it'?s\b
negative parallelism|||\bnot only\b[^.]{1,50}\bbut\b
tailing negation|||[.;:]\s*no [a-z]{3,},\s*no [a-z]{3,}
copula avoidance|||\b(serves|stands|functions|acts) as (a |an |the )
authority trope|||\b(the point is|what really matters|the real question is|the heart of the matter|the deeper point)\b
significance inflation|||\b(marks|marking|represents|signals) a (pivotal|key|defining|turning|significant) (moment|point|shift|role)\b
superficial -ing|||,\s+(highlighting|underscoring|emphasizing|showcasing|reflecting|symbolizing|ensuring|fostering|cultivating)\b
three parallel verb-clauses|||\b[a-z]+s\b[^,.;:!?]{2,60},\s+[a-z]+s\b[^,.;:!?]{2,60},\s+(?:and|then)\s+[a-z]+s\b
<!-- /scan:patterns -->

## Replacement strategy

Do not synonym-swap a banned word; that produces the same sentence in a cheaper suit. Restructure around the concrete fact the sentence was gesturing at:

- Banned: "Leverage our robust platform to streamline your security workflow."
- Wrong fix: "Use our powerful platform to simplify your security workflow." (Same empty sentence.)
- Right fix: "Connect your scanner output once. Triage drops from four hours a week to twenty minutes." (A fact a reader can check.)

If no concrete fact exists to anchor the sentence, the sentence was decoration. Delete it.

## Voice check, beyond the scan

After the mechanical scan passes, read the page top to bottom once and ask of each section: would the owner say this sentence out loud to a client across a table? If it would sound like a brochure, rewrite it as the spoken version.

---

_Provenance: banned and judgment lists reconciled 2026-07-07 against marketingskills 2.3.0 (copywriting, copy-editing) and the seo-audit ai-writing-detection list, which copywriting itself defers to. Re-reconcile when those companions change; keep this list a superset of the AI-writing-detection vocabulary._
