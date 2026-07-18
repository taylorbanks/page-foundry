# Security

This skill contains one executable: `skills/page-foundry/scripts/voice_scan.py`.
Standard library only, no network access, no subprocess calls; it reads only the
files you pass it. Everything else is Markdown that your agent interprets.

The skill instructs agents to install companion skills only from the pinned
sources named in its SKILL.md companion table, only after explicit user
approval, never from search results or unpinned repos.

Companion skills are separate installs that ship their own code. The impeccable
companion (pbakaus/impeccable, Apache 2.0), for example, ships dependency-free
Node scripts, among them a deterministic design anti-pattern detector; those run
only when you have installed that companion, from its own tree. page-foundry
bundles none of a companion's code and gains no executable of its own by
integrating one. Review a companion's scripts in its repo before installing it,
the same way you read this skill's scanner.

Report issues via GitHub issues, or privately to the address in the repo
profile for anything sensitive.
