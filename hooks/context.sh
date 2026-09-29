#!/usr/bin/env bash
# SessionStart: tell the session where the plugin lives, so /personal-os:setup
# can find its template. One line in folders that are not set up; nothing else.
[ -n "$CC_AUTO_SHUTDOWN" ] && exit 0
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
printf 'personal-os plugin root: `%s`\n' "$ROOT"
