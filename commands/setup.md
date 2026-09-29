---
description: Build your personal OS in the current folder (folders, CLAUDE.md, memory), switch on the automatic daily logs, then start the guided tour.
---

# /personal-os:setup

Set up a personal OS in the folder this session is working in.

1. **Check the folder.** List what is in it. If it already holds `.claude/personal-os.json`, say it is already set up and go straight to step 4. If it holds other files, say that nothing will be overwritten (existing files are kept) and ask whether to continue. An empty folder needs no question.
2. **Find the plugin root.** The session context has a line starting `personal-os plugin`, which gives the version and the root path. If it is missing, find it with `ls -d ~/.claude/plugins/cache/*/personal-os/*/ | sort -V | tail -1`.
3. **Run the setup script** and show its output:
   `bash "<plugin root>/scripts/setup.sh" "<this folder's absolute path>"`
   If bash is not available (Windows without Git Bash), say so, point to `winget install Git.Git`, and stop.
4. **Hand over to the tour.** Tell the user that the hooks switch on from the **next** session in this folder, then follow the instructions in `<plugin root>/commands/start.md` from step 1.
