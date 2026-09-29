---
description: Weekly health check. Finds contradictions, stale claims, orphan notes, missing concepts, neglected projects, and unsourced claims. Reports first, fixes only on confirmation.
argument-hint: [check name | folder]
---

# /personal-os:lint

Run the repo health check. Find the errors that quietly rot a second brain, before they surface at the worst moment. Report everything, propose fixes, change nothing without confirmation.

- If `$ARGUMENTS` names one check (for example `contradictions` or `neglected projects`), run only that check.
- If `$ARGUMENTS` names a folder, run all checks but report only findings whose fix lives in that folder.

## Before you start

- **Read `daily-logs/lint-exceptions.md`.** Everything listed there was reviewed and accepted. Do not report it again unless the facts behind it changed, and then say what changed.
- **File modification dates are not a staleness signal.** Cloning, syncing, and earlier lint runs all reset them. Judge recency only from dates written inside files and from mentions in `daily-logs/`.

## Scope

- **Check:** `projects/`, `frameworks/`, `wiki/`, `drafts/`, and `CLAUDE.md`.
- **Read for evidence, don't lint:** `daily-logs/` (historical, allowed to be old) and `raw/` (unprocessed by definition; that is `/personal-os:ingest`'s job).
- `.claude/` counts as a source of links when judging orphans, but is not linted itself.

## The six checks

1. **Contradictions.** The same fact stated differently in two places: a number, a deadline, a decision open in one file and closed in another. Quote both with file paths and say which one recent evidence supports.
2. **Stale claims.** Any number, status, or "current state" statement older than 60 days with no refresh. Ask the real question: is the work stuck, or is the file out of date?
3. **Orphan notes.** Files nothing links to. Recommend connecting (from where) or removing (why it is safe).
4. **Missing concepts.** Terms, names, or ideas in 3 or more files with no page of their own. Propose where the page belongs (`wiki/` for concepts and people, `frameworks/` for methods). Skip generic vocabulary.
5. **Neglected projects.** Judge each `status: active` project against its own `cadence`:
   - Last real activity = the later of its latest in-text date and its latest mention in `daily-logs/`.
   - Budget: weekly 7 days, monthly 30, quarterly 90. Flag when past budget plus half again (weekly at 10+ days, monthly at 45+).
   - Say how many cadence cycles were missed, not only the day count.
   - Is `next_action` still right, or overtaken?
   - A project with no `cadence` field is its own finding.
   - Then the honest question: done, paused, or ignored? Propose updating `status` or `cadence` so the file tells the truth.
6. **Unsourced claims.** Stats, benchmarks, quotes, or external dates with no source. Hand-written opinion and strategy need no citation. Performance numbers always do.

## Report

```
# Lint: YYYY-MM-DD

## Summary
<one line per check: count + 🔴 fix now / 🟡 fix soon / 🟢 clean>

## 1. Contradictions
| Fact | File A says | File B says | Which is right (evidence) |
## 2. Stale claims
| File | Claim | Age | Stuck or stale |
## 3. Orphan notes
| File | Connect from / remove | Why |
## 4. Missing concepts
| Term | Appears in | Proposed page |
## 5. Neglected projects
| Project | Cadence | Last activity | Cycles missed | next_action still right? | Verdict |
## 6. Unsourced claims
| File | Claim | What a source would look like |
```

Then a numbered fix plan, smallest safe change per finding. **Wait for confirmation.** The user may approve all, some, or none by number. Apply only what was approved, additively where possible. Before deleting an orphan, show a summary of its content.

## Finish

- What was fixed, by number.
- **Append every declined finding to `daily-logs/lint-exceptions.md`**: date, finding, file, and the user's reason. If no reason was given, ask for one in a single line. This is what stops next week's lint from repeating itself.
- **Save the report to `daily-logs/YYYY-MM-DD-lint.md`, even on a clean run.** The session-start reminder uses this file to know when the last lint ran.
- Compare with the previous lint report: what got worse, what stayed fixed, and any finding appearing for the third time (the fix is not holding; change the approach, not the file).
