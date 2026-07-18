# 13a micro-dogfood: tier-aware preflight

Method: a fresh-context subagent (Sonnet) read only the rewritten Phase -1, the two companion tier tables, and the orchestration doctrine in SKILL.md, then simulated a preflight scenario strictly from that text: all core companions present except humanizer MISSING, remotion (enhancer) MISSING, invocation carrying "run end to end, no questions".

Expected per the two-tier policy: halt despite the interactivity phrase; humanizer treated as core (run does not start; explicit override only, marked PARTIAL in gate-report banner + foundry-log); remotion treated as enhancer (decline proceeds, degraded line + `[TK: motion asset]`); one question, nothing installs before yes; re-detection after install.

Result: all five behaviors reproduced from the text alone, each answer citing the governing SKILL.md line. Subagent verdict: the policy as written produces the intended stop-versus-degrade split.

Verbatim subagent report (fenced; its prose is not this repo's voice-gated copy):

```
# 13a preflight micro-dogfood

**Scenario:** `page-foundry, build mode for Acme; brief at .agents/product-marketing.md; run end to end, no questions.` Detection sweep found all core companions PRESENT except humanizer MISSING, and remotion (enhancer) MISSING; all else present/current.

**A. Halt despite "run end to end, no questions"?**
Yes. `The companion stop cannot be suppressed by any interactivity phrase ('don't pause', 'no questions', 'run end to end') or by an operator-supplied or inferred instruction.` Preflight step 3 also states `**Report and ask, once. This stop is mandatory.**` — so the run stops at Phase -1 regardless of the "no questions" instruction.

**B. Humanizer's tier and what happens if declined**
Humanizer is listed in the `#### Core tier (required)` table (Phase 3, Gate 2). Declining it means `**Core companion missing: the run does not start.**` The only path forward is `an explicit per-run override: the user, in chat, told what this run loses, saying build anyway.` That override is then marked in two places: `a banner at the top of the gate report naming every overridden core companion, and the same names in the foundry-log 'degraded' field prefixed 'PARTIAL:'.`

**C. Remotion's tier and what happens if declined**
Remotion sits in `#### Enhancer tier (graceful fallback)`. Declining it falls under `**Enhancer companion missing, or any companion outdated: declining proceeds.**` — `The affected phases run on the condensed reference-file rules per the orchestration doctrine, and the decline is recorded on the gate report's 'degraded' line.` Its row also specifies the concrete fallback marker: `'remotion:' clip produced, or '[TK: motion asset]' in open items`.

**D. How many questions, and can anything install first?**
Exactly one: `Ask a single question: install and update now, or proceed without?` Nothing may install beforehand — `Nothing installs, updates, or gets skipped silently` and `The sweep must complete before any install or update command is even considered.` Installation only happens `On approval` after that single question is answered.

**E. If the user says "install humanizer" and it installs, what precedes Phase 0?**
Detection must be re-run and confirmed before continuing: `On approval, run the commands, then RE-RUN detection and confirm every name resolves before continuing.`

**VERDICT:** The tier policy as written produces the intended stop-versus-degrade split — core companions (humanizer included) hard-block the run behind a mandatory, non-suppressible, explicitly-worded override that gets loudly marked PARTIAL in two places, while enhancer companions (remotion) degrade silently-but-logged to reference-file fallbacks with a `degraded`/`[TK:]` trail, and no interactivity phrase can collapse either path into a silent skip.
```

Consistency with TESTS.md: tests 8, 9, 10, 11, 12, 17 all still hold verbatim under the tier policy (halt-and-ask for any missing companion, one question, re-detect after install, outdated offered not forced, fallback flagged degraded). The tier policy adds the PARTIAL marking on top of test 17's flow for core companions; TESTS entries for the new behavior land in 13e per the backlog.
