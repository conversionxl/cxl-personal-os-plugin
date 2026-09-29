---
description: Set up and tour your personal OS. Checks prerequisites, links memory, explains folders, hooks, and commands, then personalizes CLAUDE.md and creates your first projects.
argument-hint: [tour]
---

# /personal-os:start

Welcome the user to their personal OS and get it working. This is their first session in the repo, or they want the tour again. If `$ARGUMENTS` is `tour`, skip setup (steps 1 and 2) and step 5, and give only the explanation in steps 3 and 4.

Work through the steps in order. Keep each message short and skimmable; this is an onboarding, not a lecture. Pause where the step says to wait.

## 1. Check the setup

Run these checks and show the result as one table (item | status | fix if missing):

| Check | How | Why it matters |
|---|---|---|
| `git` | `git --version` | The repo is versioned and synced through git. |
| `jq` | `command -v jq` | Every hook needs it. Without it the daily logs never get written, and nothing errors. |
| `claude` CLI | `command -v claude` | The daily log and team update hooks call headless Claude. |
| `gh` (optional) | `gh auth status` | Only needed to push the repo to your own GitHub. |
| Memory link | Is `~/.claude/projects/<slug>/memory` a symlink to this repo's `.claude/memory`? The slug is the repo's absolute path with every `/` replaced by `-`. | Without it, memory stays machine-local. |
| Git remote | `git remote -v` | Optional. With no `origin`, the folder works on this machine only; see step 2. No git at all is allowed too. |
| Hooks running | Read `.claude/state/hooks-heartbeat`. It should exist, with `last_run` = today and `missing=` empty. | The heartbeat is written by `health.sh`, which needs only bash. No file means hooks never ran this session. A `missing=` value names what to install. |

**Detect the OS first** (`uname -s`, or `$env:OS` / `ver` if bash is not available). On Windows, also check:
- **Git Bash**: `where bash` or `command -v bash`. Claude Code on Windows needs Git for Windows, and every hook is a bash script. Install: `winget install Git.Git`.
- **jq on the PATH that Git Bash sees**: `bash -c "command -v jq"`. Install: `winget install jqlang.jq`. winget adds it to PATH only for new processes, so **fully quit and reopen VS Code** afterwards, then re-run `/personal-os:start`.
- If `winget` itself is missing (older Windows or a locked-down work laptop), give the manual route: download `jq-windows-amd64.exe` from https://jqlang.org/download/, rename it `jq.exe`, and put it in `C:\Program Files\Git\usr\bin`.

Install hints for anything missing: macOS `brew install jq gh`; Windows `winget install jqlang.jq GitHub.cli`; Linux via the package manager.

## 2. Fix what you can

- If memory is not linked, run `bash .claude/link-memory.sh` and show its output.
- If there is no `origin` (or it points at a CXL repo), explain that their daily logs, projects, and memory are private, so any GitHub copy should be **their own private repo**. Offer the commands, and run them only on a yes:
  ```
  gh repo create <name> --private --source . --remote origin --push
  ```
  (After `git remote remove origin`, if one exists. If they don't use `gh`, give the manual steps: create an empty private repo on GitHub, then `git remote set-url origin <url>` and `git push -u origin main`.)
- If they do not want GitHub, that is fine: everything works on one machine. Say in two lines what they give up (version history, sync across machines, and the git-based setups later in the cohort) and that they can add it later. Do not push them.
- Anything you cannot fix (a missing install), list it once with the command to run, and continue.

**If the hooks are not running and cannot be fixed now** (no admin rights, a locked-down laptop), switch the user to the manual fallback and say so plainly:
- Daily logs will not write themselves. Run `/personal-os:shutdown` at the end of every session; it writes the log without hooks.
- At the start of a session, Claude reads the newest logs itself (CLAUDE.md tells it to).
- The weekly team update will not write itself either. Run `/personal-os:team-update last-week` on Mondays.
Nothing else in the repo depends on hooks.

## 3. Explain how it works

Explain in this order, briefly, using a table or short bullets for each part. Read `CLAUDE.md` first so the explanation matches this repo exactly.

1. **The problem.** Claude starts every session with no memory of the last one. This repo gives it memory using plain Markdown files the user owns.
2. **Two kinds of memory.**
   - *Built-in memory* (`.claude/memory/`): a small set of standing facts, like preferences, key people, and where things live. Updated when Claude learns something durable.
   - *Daily logs* (`daily-logs/`): what happened each day, like work done, decisions, commitments, and what to pick up next. Written automatically.
   Memory answers "what is always true". Logs answer "where did we leave off".
3. **The folders.** Walk the folder table from `CLAUDE.md`: `projects/`, `raw/`, `daily-logs/`, `frameworks/`, `wiki/`, `drafts/`, `team-updates/`, and the `.claude/` folders (commands, skills, agents, hooks, memory). For each, give one line on what goes there and one example from marketing work (for example: "a pasted call transcript goes in `raw/`", "your campaign QA checklist goes in `frameworks/`").
4. **Projects come first.** Every command, skill, or agent they build later should serve a project. That is why the next step creates projects.

## 4. Explain the hooks and commands

**Hooks** run by themselves. Show the hooks table from `CLAUDE.md` and add the two things users usually miss:
- The daily log is written when the session **ends** (typing `/exit`, or closing the session cleanly). If the editor is killed instead, `catch-up-logs.sh` backfills that day the next time a session starts, so nothing is lost.
- `/personal-os:shutdown` is the richer, interactive version of the automatic log. When they run it, the automatic hook sees that and does not write a duplicate.

**Commands** are triggered by name. In Claude Code, type `/` and the name. The personal OS commands come from the plugin, so they start with `personal-os:`, in the Code tab and in Cowork alike. Commands they build themselves go in `.claude/commands/` and have no prefix. Show the commands table from `CLAUDE.md`, then suggest a rhythm:

| When | Run |
|---|---|
| Before a meeting | `/personal-os:brief <person or project>` |
| Whenever `raw/` fills up | `/personal-os:ingest` |
| End of day | `/personal-os:shutdown` |
| Once a week | `/personal-os:lint` and `/personal-os:team-update last-week` |

Finish this step with one line on the difference between the three kinds of building blocks they will create in the cohort:
- **Command**: a prompt you trigger by name, for a task you repeat.
- **Skill**: know-how Claude loads automatically when a task matches it.
- **Agent**: a specialist Claude hands a whole job to, with its own instructions and tools.

Point to the examples in `.claude/skills/` and `.claude/agents/`.

**Stop here if this is a `tour` run.**

## 5. Personalize

Ask these four questions in one message, and wait for the answers:

1. What's your name, role, and company?
2. What are you responsible for? What are you measured on?
3. What are the 2 to 5 projects taking most of your time right now?
4. How do you like to work with Claude? (For example: "be blunt", "always ask before writing", "keep it short".)

Then:
- Fill in the **About me** section of `CLAUDE.md` from answers 1, 2, and 4. Edit only that section.
- For each project in answer 3, propose a folder name and a one-line scope, as a numbered list. **Wait for confirmation.** Then create `projects/<name>/<name>.md` for each, from `projects/_template.md`, with the frontmatter filled in (`status: active`, a `cadence` they choose, a real `next_action`). Leave sections blank rather than inventing content.
- If Gmail, Google Calendar, or a project management connector is available in this session, offer to fill in the project files from what those tools show. Base every line on what the tools return, and say where it came from. If no connector is available, say so and skip.
- Save one memory file for anything durable they said about how they work, and add it to `.claude/memory/MEMORY.md`. Write both with the shell (a heredoc), not the file-edit tools: in Cowork the file tools cannot write inside `.claude/`. If the shell is not ready yet, wait and retry. Never save memory anywhere else.

## 6. Wrap up

End with:
- What was set up (a short checklist: ✅ done, ⚠️ needs their action).
- Their first three moves: drop something into `raw/` and run `/personal-os:ingest`; run `/personal-os:brief` on one of their projects; run `/personal-os:shutdown` at the end of today.
- One line: "Run `/personal-os:start tour` any time to see this explanation again."
