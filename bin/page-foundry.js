#!/usr/bin/env node
"use strict";
/*
 * page-foundry installer.
 *
 * A read-before-you-trust-it CLI, on purpose: no dependencies, no network, no
 * telemetry, Node built-ins only (fs, path, os). It copies the bundled skill
 * from this package into your Claude skills directory. Nothing runs on `npm
 * install`; only the explicit `install` subcommand writes anything.
 *
 *   npx page-foundry install                 -> ~/.claude/skills/page-foundry
 *   npx page-foundry install --project       -> ./.claude/skills/page-foundry
 *   npx page-foundry install --agents        -> ~/.agents/skills/page-foundry
 *   npx page-foundry install --dir <path>    -> <path>/page-foundry
 *   npx page-foundry install --with-commands -> also writes commands/page-foundry.md
 *   npx page-foundry install --dry-run       -> print what would happen, write nothing
 *   npx page-foundry update                  -> reinstall, preserving a customized voice.md
 *   npx page-foundry uninstall               -> remove the installed skill
 *   npx page-foundry where                   -> print the resolved target
 */

const fs = require("fs");
const path = require("path");
const os = require("os");

const SKILL = "page-foundry";
const SRC = path.join(__dirname, "..", "skills", SKILL);
const PKG = require(path.join(__dirname, "..", "package.json"));

function log(msg) { process.stdout.write(msg + "\n"); }
function die(msg) { process.stderr.write("error: " + msg + "\n"); process.exit(1); }

function parseArgs(argv) {
  const flags = { _: [] };
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a === "--dir") { flags.dir = argv[++i]; }
    else if (a.startsWith("--")) { flags[a.slice(2)] = true; }
    else { flags._.push(a); }
  }
  return flags;
}

// Resolve the base skills directory from flags; the skill lands at <base>/page-foundry.
function resolveBase(flags) {
  if (flags.dir) return path.resolve(flags.dir);
  if (flags.project) return path.resolve(".claude", "skills");
  if (flags.agents) return path.join(os.homedir(), ".agents", "skills");
  return path.join(os.homedir(), ".claude", "skills"); // default: global Claude Code
}

function target(flags) { return path.join(resolveBase(flags), SKILL); }

function commandsFile(flags) {
  const base = flags.project ? path.resolve(".claude") : path.join(os.homedir(), ".claude");
  return path.join(base, "commands", SKILL + ".md");
}

// A customized voice overlay (owner is not "default") must survive an update.
function voicePath(dir) { return path.join(dir, "references", "voice.md"); }
function isCustomVoice(dir) {
  try {
    const t = fs.readFileSync(voicePath(dir), "utf8");
    const m = t.match(/^owner:\s*(.+)$/m);
    return !!(m && m[1].trim().toLowerCase() !== "default");
  } catch { return false; }
}

function copySkill(dest, flags) {
  if (flags["dry-run"]) { log("  would copy skill -> " + dest); return; }
  fs.mkdirSync(path.dirname(dest), { recursive: true });
  fs.cpSync(SRC, dest, { recursive: true });
}

function writeCommandStub(flags) {
  const file = commandsFile(flags);
  const body = [
    "---",
    "description: Build or review a homepage, landing page, or sales page with the page-foundry pipeline.",
    "---",
    "",
    "Invoke the page-foundry skill and follow its pipeline. Run with no arguments for orientation.",
    ""
  ].join("\n");
  if (flags["dry-run"]) { log("  would write command stub -> " + file); return; }
  fs.mkdirSync(path.dirname(file), { recursive: true });
  fs.writeFileSync(file, body);
  log("  command stub  -> " + file);
}

function install(flags, { force }) {
  if (!fs.existsSync(path.join(SRC, "SKILL.md"))) die("bundled skill not found at " + SRC);
  const dest = target(flags);
  const exists = fs.existsSync(dest);

  if (exists && !force && !flags["dry-run"]) {
    die("already installed at " + dest + "\n  run `page-foundry update` to overwrite, or `page-foundry uninstall` first.");
  }

  // Preserve a customized voice overlay across updates.
  let savedVoice = null;
  if (exists && isCustomVoice(dest)) {
    savedVoice = fs.readFileSync(voicePath(dest), "utf8");
    log("  note: preserving your customized references/voice.md (owner is not default)");
  }

  log((flags["dry-run"] ? "[dry run] " : "") + (exists ? "Updating " : "Installing ") + SKILL + " v" + PKG.version);
  copySkill(dest, flags);
  if (savedVoice !== null && !flags["dry-run"]) fs.writeFileSync(voicePath(dest), savedVoice);
  if (!flags["dry-run"]) log("  skill         -> " + dest);
  if (flags["with-commands"]) writeCommandStub(flags);

  if (!flags["dry-run"]) {
    log("");
    log("Done. Next:");
    log("  - open your agent and run `/page-foundry` for orientation");
    log("  - say \"set up my voice\" to configure the voice rules the scanner enforces");
  }
}

function uninstall(flags) {
  const dest = target(flags);
  if (!fs.existsSync(dest)) die("not installed at " + dest);
  // Guard: only remove a directory that is actually this skill.
  if (!fs.existsSync(path.join(dest, "SKILL.md"))) die("refusing to remove " + dest + " (no SKILL.md; not a page-foundry install)");
  if (flags["dry-run"]) { log("  would remove -> " + dest); return; }
  fs.rmSync(dest, { recursive: true, force: true });
  log("Removed " + dest);
}

function help() {
  log("page-foundry v" + PKG.version + " - installer for the page-foundry Claude Code skill");
  log("");
  log("Usage: npx page-foundry <command> [flags]");
  log("");
  log("Commands:");
  log("  install      copy the skill into your Claude skills directory");
  log("  update       reinstall, overwriting (keeps a customized voice.md)");
  log("  uninstall    remove the installed skill");
  log("  where        print the target directory");
  log("");
  log("Flags:");
  log("  --project        install to ./.claude/skills instead of ~/.claude/skills");
  log("  --agents         install to ~/.agents/skills");
  log("  --dir <path>     install under <path>/page-foundry");
  log("  --with-commands  also write a /page-foundry command stub");
  log("  --dry-run        print actions without writing");
  log("  --force          overwrite an existing install (install only)");
  log("");
  log("Other install channels: `npx skills add taylorbanks/page-foundry`,");
  log("the Claude Code plugin, or a .skill upload on claude.ai. See the README.");
}

function main() {
  const flags = parseArgs(process.argv.slice(2));
  const cmd = flags._[0];
  if (flags.version || flags.v || cmd === "version") return log(PKG.version);
  if (flags.help || flags.h || !cmd || cmd === "help") return help();
  switch (cmd) {
    case "install": return install(flags, { force: !!flags.force });
    case "update": return install(flags, { force: true });
    case "uninstall":
    case "remove": return uninstall(flags);
    case "where": return log(target(flags));
    default: die("unknown command: " + cmd + "\n  run `page-foundry --help`");
  }
}

main();
