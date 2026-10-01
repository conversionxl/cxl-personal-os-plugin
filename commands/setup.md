---
description: Build your personal OS in the current folder (folders, CLAUDE.md, memory), switch on the automatic daily logs, then start the guided tour.
---

# /personal-os:setup

Set up a personal OS in the folder this session is working in.

1. **Check the folder.** List what is in it. If it already holds `.claude/personal-os.json`, say it is already set up and go straight to step 4. If it holds other files, say that nothing will be overwritten (existing files are kept) and ask whether to continue. An empty folder needs no question.
2. **The plugin root** is `${CLAUDE_PLUGIN_ROOT}`. The session context also has a line starting `personal-os plugin` with the version and the same path.
3. **Run the setup script** and show its output:
   `bash "<plugin root>/scripts/setup.sh" "<this folder's absolute path>"`
   If bash is not available (Windows without Git Bash), say so and offer to install it with `winget install Git.Git`, running that on a yes. Then tell the user to fully quit and reopen the Claude app and run `/personal-os:setup` again, and stop. On Windows, pass paths in the form bash accepts, such as `C:/Users/<name>/Documents/personal-os`.
4. **Hand over to the tour.** Tell the user, in bold, that daily logs switch on from the **next** session in this folder: "When we finish, close this session and start a new one here. That is when the automatic daily logs begin." **In Cowork** (the shell reports Linux and `CLAUDE_PROJECT_DIR` is empty), say instead that daily logs are not automatic there, because Cowork runs hooks in its own workspace, where this folder isn't: run `/personal-os:shutdown` at the end of each day, or use the Code tab (Environment: Local) for automatic logs. Then follow the instructions in `<plugin root>/commands/start.md` from step 1.
