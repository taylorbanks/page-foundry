# dogfood-6a: build-time repo verify and copy-truth reconciliation

DOGFOOD-6's Phase 5 charter includes "verify the repo URL resolves before it lands in shipped copy." Run against the live repository, that gate caught real drift since the DOGFOOD-1 snapshot (iter 52). This iteration reconciled the frozen `copy-approved.md` to the live facts through the voice chain and re-froze it. The build itself is DOGFOOD-6b.

## What the repo-verify gate found (live sources)

| Fact | Value now | How verified |
|---|---|---|
| Repo name | Renamed `slop-browser` to `Interceptor` | `curl -I github.com/.../slop-browser` returns `301` to `github.com/Hacker-Valley-Media/Interceptor`; `gh api repos/Hacker-Valley-Media/slop-browser --jq .full_name` returns `Hacker-Valley-Media/Interceptor` |
| Old URL | Still resolves via redirect | `301` redirect, not a `404` |
| Browser install | Signed `.pkg` download from GitHub Releases, then double-click, then load the unpacked extension | Live README "Install In 60 Seconds": two installers ship per release, `Interceptor-Browser-<version>.pkg` recommended default, no macOS permission prompts |
| Install as a command | Does not exist | README shows no `brew`, `curl`, or `npm` one-liner; only the `.pkg` download and a build-from-source path |
| Usage surface | `interceptor open <url>` returns tree plus text in one call | README Quick Start: `interceptor open "https://example.com"` "Open, wait, return tree + text (1 command)" |
| License | Non-standard, GitHub classifies as `Other` | `gh api ... --jq .license.spdx_id` returns `NOASSERTION`, `.license.name` returns `Other` |
| Star count | 310 | `gh api ... --jq .stargazerCount` (not quoted on the page by editorial choice) |
| Screen state | Locked | `ioreg -n Root -d1 -a` shows `CGSSessionScreenIsLocked` true, so window-server capture is blocked (lesson 35) |

## Claims corrected in `copy-approved.md`

Each change is forced by a verified fact above, re-entered through the voice chain per the Phase 3 step 5 re-entry rule that the snapshot header already named. None is a stylistic rewrite: the humanizer guardrail forbids claim-changing de-patterning, and none of these is de-patterning.

- **S9 URL**: `github.com/Hacker-Valley-Media/slop-browser` to `github.com/Hacker-Valley-Media/Interceptor`. The star-count sentence dropped its `[TK]` (the number is now known) and kept the page's stated stance of not leaning on vanity metrics.
- **S10 FAQ Q1**: the "the repo is named `slop-browser`, is this a serious tool" question is obsolete (the repo is named `Interceptor`). Replaced with "how do I know it works before I install," which serves the same objection (credibility for a code-first reader) using the same true substance: open code, builds from source, limitations documented in the open. The three named limitations were re-verified in the local source `~/.claude/skills/Interceptor/SKILL.md` (lines 288 to 290: screenshot ignores scroll position; `--clip` broken; `eval` blocked on strict-CSP sites).
- **S10 FAQ Q3 license**: `[TK: license identifier]` resolved to the repo's declared non-standard license (`Other`).
- **S1 and S11 install slots**: `[TK: browser-only install command]` resolved to the real install: download the signed `Interceptor-Browser` package from GitHub Releases and double-click. There is no install command to resolve to.
- **S11 close line**: "the install is one command" was false (install is a `.pkg` download). Corrected to "the install is a signed download you double-click." S4's separate "the whole surface is one command" is about usage (`interceptor open <url>`) and stays, verified true.
- **S4 figcaption**: previously stated output was "captured from the live build." No output was captured (locked screen), so the figcaption was corrected to say real output goes here once the tool runs against a live page, and the output `[TK]` label was updated to note it is pending an unlocked-screen capture.

## What stayed `[TK]`, and why (integrity)

- **Quickstart output** (S4): capturing real output needs the live tool driving a live page; the overnight screen was locked. Per the integrity rule, this stays a labeled `[TK]`, never a fabricated transcript. The unlocked-capture rerun at DOGFOOD-7 resolves it alongside the 390 and 1440 renders (both blocked by the same lock).
- **Independent stealth-check reproduction** (S1 readout): unchanged, still `[TK]`. The vendor-stated results carry their "vendor-stated" label.

## Gate-8 watch items carried to DOGFOOD-7

Deferred here to keep this iteration scoped to the repo-identity facts the Phase 5 gate covers. These are proof-provenance checks that Gate 8 owns:

- S4 names "canvas editors like Google Docs and Figma." The live README names `Canva`, `Google Docs`, and `Google Slides` as scene-graph targets and describes design tools generically; `Figma` is not named in the source. Gate 8 should confirm or swap `Figma` for a source-named app (`Canva`).
- S8 names felarof, Intuned, Browser Cash, and pydoll; S5 names the safety controls; the S1 readout names four stealth results. All were sourced in DOGFOOD-1; Gate 8 re-verifies provenance against the renamed repo.
- Build-layer (DOGFOOD-6b): the S9 status-line element and the hero and close CTA blocks must render the reconciled copy (repo name `Interceptor`, a download CTA rather than a copyable command block, no `stars: [TK]` field).

## Voice chain record

`python3 skills/page-foundry/scripts/voice_scan.py copy-approved.md` returns `PASS`, exit 0 (103 banned, 8 judgment, 10 patterns loaded). `bash loop/verify.sh` exits 0 (GREEN). Every corrected line was drafted to the voice rules and scanned on write.

## OWNER-REVIEW

- The hero and close CTA change shape, from a copyable install command to a signed-package download, because the tool has no install command. This is truth-forced, but it changes the primary call to action; confirm the editorial handling.
- The page declines to quote the real star count (310), keeping the existing anti-vanity stance. Reversing that to quote 310 is a defensible alternative.
- The S10 FAQ Q1 was replaced rather than edited in place, because its premise (the `slop-browser` name) no longer exists.
