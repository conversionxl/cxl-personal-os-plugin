# Personal OS plugin

The plug-and-play route to the personal OS from the CXL AI Native Marketer cohort. It builds the same system as the [starter repo](https://github.com/conversionxl/cxl-personal-os): project folders, daily logs written automatically, memory that travels with your folder, and the personal OS commands. You don't need VS Code, and you don't need to clone a repo.

Already set up the starter repo? Keep it. Both routes are the same system.

## Install

Install it **one way only**. Installed twice, every hook runs twice.

**From the Claude app settings** (recommended: no typing)

1. Open **Customize** in the left sidebar. In Cowork, open the Cowork tab first.
2. Click **Browse plugins**, then **Personal**, then **+**, then **Add marketplace from GitHub**.
3. Enter `https://github.com/conversionxl/cxl-personal-os-plugin`, then add **personal-os**.
4. Make an empty folder, such as `Documents/personal-os`. Open it in the Code tab or in Cowork and type `/personal-os:setup`.

The plugin is saved to your claude.ai account, not your computer, so it follows you to chat, Cowork and Claude Code.

**From Claude Code, if you don't use the Claude app**

In a terminal or VS Code session, in an empty folder:

```
/plugin marketplace add conversionxl/cxl-personal-os-plugin
/plugin install personal-os@cxl-personal-os-plugin
/personal-os:setup
```

**Installed both ways by accident?** Run `/plugin` in Claude Code. If you see both `personal-os@synced` and `personal-os@cxl-personal-os-plugin`, uninstall the second.

## Where it works

| Where | What loads |
|---|---|
| Claude Code: Code tab, terminal, VS Code | Everything |
| Cowork | Commands, skills, agents and hooks. The automatic daily log also needs the `claude` CLI and `jq` wherever Cowork runs |
| claude.ai chat | Skills only |
| claude.ai/code online sessions | Nothing. Plugins do not load there |

## Commands

| Command | What it does |
|---|---|
| `/personal-os:setup` | Builds the personal OS in the current folder and makes it a git repo. Never overwrites a file |
| `/personal-os:start` | Checks setup, explains the system, fills in "About me", creates your first projects |
| `/personal-os:brief` | Everything the folder knows about a person, project or topic |
| `/personal-os:ingest` | Files what you dropped into `raw/` |
| `/personal-os:shutdown` | End of day: reconciles, routes commitments, writes the daily log |
| `/personal-os:lint` | Weekly health check |
| `/personal-os:team-update` | A standup-style update from your daily logs |

## How the hooks stay out of your other folders

The plugin is installed once for your whole account, so its hooks would otherwise run in every folder you open. They run only where `/personal-os:setup` has written `.claude/personal-os.json`. Delete that file to switch them off in a folder.

## Changing how it works

Your folder is yours: `CLAUDE.md`, projects, memory and your own `.claude/skills/` are plain files. The plugin's commands and hooks update with the plugin. To change one, copy it into your folder's `.claude/commands/` and edit the copy. That is the first step toward the full VS Code route.
