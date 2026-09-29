#!/usr/bin/env bash
# Runs a personal OS hook only in a folder that /personal-os:setup has set up.
# The plugin is installed once per user, so without this gate every hook would
# fire in every folder you open, writing daily logs into unrelated projects.
# The marker is .claude/personal-os.json, written by scripts/setup.sh.
[ -n "$CLAUDE_PROJECT_DIR" ] && [ -f "$CLAUDE_PROJECT_DIR/.claude/personal-os.json" ] || exit 0
exec bash "$(dirname "${BASH_SOURCE[0]}")/$1"
