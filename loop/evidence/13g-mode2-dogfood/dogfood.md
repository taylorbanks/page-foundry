# 13g micro-dogfood: Mode 2 discovery on a source-less fixture brief

Date: 2026-07-18 (overnight loop). Proves the behavior the 13g text authorizes, end to end, with real network output.

## Fixture

A minimal intake for ripgrep (real OSS tool, technical ICP: developers searching large codebases). The fixture brief points at zero VOC sources; the intake handed over neither reviews nor transcripts nor forum links. Under the v2.x-through-13e text, this run would have skipped customer-research and asked the user to describe buyer language in the interview. Test 37's old closing line codified exactly that.

## What the new text routes

Phase 0 step 3 now says: pointed-to sources thin or absent, customer-research runs its digital-watering-hole research (its own Mode 2), sources chosen from its ICP table. For a technical-buyer ICP that table names Reddit role subreddits, G2/Capterra, Hacker News, and Indie Hackers (verified against the pinned skill: `~/.claude/plugins/cache/marketingskills/marketing-skills/2.3.0/skills/customer-research/SKILL.md`, "Mode 2: Digital Watering Hole Research", ICP source table). The probe picked Hacker News.

## The probe (real, run once)

```
curl -s "https://hn.algolia.com/api/v1/search?query=ripgrep&tags=comment&hitsPerPage=12"
```

Twelve real comments came back; three carried usable buyer language (workflow speed versus AI agents, codebase exploration pairing, lightweight-tooling preference). Trimmed raw output for those three is committed as `probe-output.json`. The `voc.md` fragment discovery produced from them, in the shipped format with every quote carrying platform, permalink, author, and date, is `voc-fragment.md`.

## Interview effect

With the fragment in hand, the interview drops the buyer-language question entirely. What discovery could not supply for this fixture, and the interview still asks: entry states per segment, traffic source, the real proof inventory, claims that cannot be made. That split is the acceptance line "the interview then asks only what discovery could not supply" working on a real input.

## Outbound-web note verified

The probe is an open-web read, which is why the phase text now says so out loud and why a run without network access must record the gap in the brief rather than skip quietly. This machine had network; the no-network path is doctrine plus test 44's closing line, not something this dogfood can exercise.
