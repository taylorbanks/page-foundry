# Lessons (append-only; read every iteration)
# format: cause -> rule
TESTS.md fixture phrases in double quotes hit the scanner as real prose -> quote banned-phrase fixtures in backticks (code spans are scanner-exempt)
Edit old_string composed from memory missed "CTA instance" wording -> copy exact file text into old_string, never retype from recall
Quoted research prose in an evidence file tripped the banned-word scan ('arguably' inside a quotation) -> backtick any quoted source text in evidence/records, same rule as fixtures
gh issue view plain output came back empty (exit 0) through the RTK bash wrapper -> fetch issues with gh --json + explicit -R and print via python, never trust empty-but-green gh output
Axes doctrine draft named the foundry-log skeleton line before 11g builds it -> doctrine prose may not name mechanisms a later backlog item owns; describe only what exists at commit time
Two-tier rewrite left step 2 still saying "outdated exactly like missing" until a full-diff re-read caught it -> after changing a policy, grep the whole file for the old policy vocabulary before staging
Persisted cwd from a prior Bash call made `cd rel/path && write-file` skip the write while later heredocs still ran on stale files -> absolute paths for every file write in loop shell commands; never chain work after a cd that can fail
Evidence file's independent-score section drafted before the scoring agent ran (caught pre-dispatch) -> never write a result section before the run that produces it; scaffold the heading, leave the body empty until real output exists
Subagent told to "return raw data" wrote its artifact into the live .agents/ tree anyway -> dogfood subagent prompts must name the exact output path (or forbid writes); relocate strays out of the live artifact tree before commit
Em/en dashes typed into fresh evidence prose FAILed the first scan -> draft evidence files to voice rules from the start (no dashes, ranges as 'to'); the scan confirms, it does not clean up
Dedup decision comment assigned voice_scan two absorbed rules; no fix_plan item owned them and 13a-e all shipped without it -> when decomposing an issue, enumerate deliverables from its comments as well as its body and give every one a backlog owner before authoring starts
Em dash leaked into two freshly authored files in one iteration despite lesson 12 -> scan every authored md file the moment it is written, before the next edit, not at gate time
runner limit-grep missed real CLI phrasing ("You've hit your session limit · resets 3:30am") -> limit detection must include "session limit|resets [0-9]" AND a duration heuristic (fail <90s = suspected limit); never trust string-match alone against phrasings that drift
Piped detect.mjs into head and read $? as exit 0 on findings (head's status); unpiped re-run showed exit 2 -> never derive a tool's exit semantics from a piped $?; re-run unpiped (or use pipestatus) before writing doctrine
Bare source filename in prose ('optimize.md' in a provenance stamp) tripped the banned-word scan -> backtick every filename reference in prose and headings, same rule as fixtures
Walkthrough doc (2186228) shipped with no fix_plan owner or progress line; audit had to verify it after the fact -> every authored document, even reference prose, gets a backlog owner before commit; unowned commits are how claims outrun verification
