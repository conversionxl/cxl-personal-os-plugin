---
description: Process everything in raw/. Make sense of each dump, propose where it belongs, and file it after you confirm.
argument-hint: [filename | dry-run]
---

# /personal-os:ingest

Process the `raw/` folder: messy notes, call transcripts, voice memo text, pasted emails, clippings, half-formed ideas. Make sense of each item, structure it, and route it to the right place in the repo.

- If `$ARGUMENTS` names a file, process only that file.
- If `$ARGUMENTS` is `dry-run`, stop after step 4 and change nothing.

## Where things go

| Destination | For |
|---|---|
| `projects/<name>/` | Anything tied to an active project: tasks, decisions, meeting notes, inputs. Read the folders in `projects/` for the current list. |
| `frameworks/` | Reusable methods, models, and checklists. |
| `wiki/` | Durable reference: people, tools, concepts, glossary. |
| `drafts/` | Content in progress: posts, emails, scripts. |
| `daily-logs/` | Only if the item is a record of a specific day's work. |

## Steps

1. **Read everything in `raw/`** (skip `raw/README.md`). List each item with a one-line summary of what it is.
2. **Make sense of each item.** What is it about? Is it a task, an idea, a decision, reference material, draft content, or project input? Search the repo for an existing home before deciding.
3. **Choose an action for each:**
   - **Merge** into an existing note (add a task to a project's open tasks, a step to a framework). Prefer this when a clear home exists.
   - **Create** a new note in the right folder when it is a new topic.
   - **Hold** in `raw/` when it is too ambiguous to route confidently.
4. **Propose the plan as a table and wait for confirmation:**
   `Raw item | action (merge / create / hold) | destination | why`
5. **After confirmation, file it:**
   - Match the frontmatter and structure of existing files in the destination folder.
   - Clear title, clean headings, loose thoughts turned into sections.
   - Wikilinks to related projects, people, and frameworks that exist.
   - **Cite the source.** Note which raw file each fact came from, so it can be traced later.
   - Merge additively. Never silently overwrite an existing note.
   - Preserve the original wording of drafts and direct quotes. Clean up structure, not voice.
6. **Ask before deleting** the original raw files. Delete only the ones the user confirms were filed correctly.

## Rules

- No email addresses, phone numbers, or other personal data about third parties in filed notes. Refer to people by name and role only.
- Never invent missing details. If a note is incomplete, file what is there and list the gaps.

## End with

- What was filed where
- What was held back, and the question that would resolve it
- Any tasks or commitments that surfaced, and which project file they went into
