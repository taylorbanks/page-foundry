# Security

This skill contains one executable: `skills/page-foundry/scripts/voice_scan.py`.
Standard library only, no network access, no subprocess calls; it reads only the
files you pass it. Everything else is Markdown that your agent interprets.

The skill instructs agents to install companion skills only from the pinned
sources named in its SKILL.md companion table, only after explicit user
approval, never from search results or unpinned repos.

Report issues via GitHub issues, or privately to the address in the repo
profile for anything sensitive.
