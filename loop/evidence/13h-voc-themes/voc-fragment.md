# Dogfood fixture: `voc.md` fragment in the 13h format

The block below applies the new synthesis layer to real discovery output for the ripgrep fixture brief (same fixture as the 13g dogfood, re-probed with more results plus an archive sample; see `dogfood.md`). Every quote carries a theme tag on its attribution line, and the ranked Themes section sits between Paraphrase and Recurring language, exactly as the shipped format in SKILL.md Phase 1 now specifies. The whole fragment sits in a code fence for evidence hygiene (quoted source text is scanner-exempt inside fences; `loop/lessons.md` entries 3 and 5). Each quote is a contiguous verbatim span from a longer comment, typos preserved; the permalink holds the full text. Raw API output: `probe-output.json` in this directory.

```
## Verbatim
> Of course that then leads you down the rabbit hole of whether the llm should exectute a known-good ripgrep, tree, etc. instead of depending on PATH resolution
— Hacker News, https://news.ycombinator.com/item?id=48920025 · wongarsu · 2026-07-15 · agent-pairing

> I find a llm in a harnes combined with manual ripgrep exploration is really effective of getting codebases.
— Hacker News, https://news.ycombinator.com/item?id=48876721 · gunalx · 2026-07-11 · agent-pairing

> That's nearly as good as a small markdown file! But not as good as a directory of markdown files and access to ripgrep.
— Hacker News, https://news.ycombinator.com/item?id=48886912 · cadamsdotcom · 2026-07-13 · agent-pairing

> Build your own MCP of allowed tools. Cargo. Ripgrep. File read and write, including directory listing and find.
— Hacker News, https://news.ycombinator.com/item?id=48768628 · lowbloodsugar · 2026-07-02 · agent-pairing

> I have a tool that wraps ripgrep so that search results always includes context and from time to time, the agent will use ripgrep by itself and when I ask why, it would go "yeah I should have done that"
— Hacker News, https://news.ycombinator.com/item?id=48638607 · sdesol · 2026-06-23 · agent-pairing

> Lightest weight: bat and ripgrep
> Though not a traditional ide
— Hacker News, https://news.ycombinator.com/item?id=48797044 · dv_dt · 2026-07-05 · lightweight-tooling

> With no Emacs, I use `ripgrep` (sometimes with fd for the file candidates) and `less`.
— Hacker News, https://news.ycombinator.com/item?id=48798893 · skydhash · 2026-07-05 · lightweight-tooling

> I find that yes, I'm a little slower with regexes instead of GPT mini/Luna models as a find/replace engine, but I am quickly getting grasp of it, and I see the future where I'm faster with Neovim and ripgrep than Codex.
— Hacker News, https://news.ycombinator.com/item?id=48913543 · bpavuk · 2026-07-14 · manual-speed-vs-ai

> As for a large code base I found ripgrep + rg.el (the interface in Emacs) to be pure gold!
— Hacker News, https://news.ycombinator.com/item?id=34078504 · cyneox · 2022-12-21 · large-codebase-emacs

## Paraphrase
- sdesol comments repeatedly (eight hits in one probe) on agents needing context-shaped search results around ripgrep; one author, counted once toward any theme (https://news.ycombinator.com/item?id=48638607 and siblings)

## Themes
1. agent-pairing: 5 of 9 sources · intensity medium · confidence High · newest 2026-07-15
2. lightweight-tooling: 2 of 9 sources · intensity medium · confidence Medium · newest 2026-07-05
3. manual-speed-vs-ai: 1 of 9 sources · intensity medium · confidence Low · newest 2026-07-14
4. large-codebase-emacs: 1 of 9 sources · intensity high · confidence Low · newest 2022-12-21 (out of the twelve-month window)

## Recurring language
- "exploration" — appears in the agent-pairing sources (gunalx) and echoes across sdesol's sibling comments
- "lightest weight" — dv_dt; skydhash's stack description carries the same preference without the phrase
```
