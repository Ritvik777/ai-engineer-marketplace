# AI Engineer — Claude Code Plugin Marketplace

Packages the senior-engineer workflow (subagents + /build command + hooks + skill)
into a single installable plugin. Install it into any project in one command — no more
copying a `.claude` folder around.

## What's inside
```
ai-engineer-marketplace/
├── .claude-plugin/
│   └── marketplace.json          # the catalog (lists the plugin)
└── plugins/
    └── ai-engineer/
        ├── .claude-plugin/
        │   └── plugin.json        # the plugin manifest
        ├── agents/                # architect, code-reviewer, codebase-explorer, debugger
        ├── commands/build.md      # /ai-engineer:build
        ├── hooks/
        │   ├── hooks.json         # safety + format + test hooks
        │   └── guard.sh
        └── skills/test-writer/    # testing conventions
```

## Install it (local — no GitHub needed)
From inside any project, start Claude Code and run:

```
/plugin marketplace add /Users/ritvik/Desktop/ClaudeSetup/ai-engineer-marketplace
/plugin install ai-engineer@ai-engineer-marketplace
```

That's it. Restart the session, then check:
- `/agents`  → architect, code-reviewer, codebase-explorer, debugger
- `/hooks`   → the three hooks, now provided by the plugin
- the command is `/ai-engineer:build <feature>` (plugin commands are namespaced)

## Share it with a teammate
Push this folder to GitHub, then a teammate runs:

```
/plugin marketplace add <your-org>/ai-engineer-marketplace
/plugin install ai-engineer@ai-engineer-marketplace
```

`/plugin marketplace add` works with a GitHub repo (`owner/repo`), a git URL, or a local
path. For private repos, Claude Code uses your existing git credentials — if `git clone`
works in your terminal, it works here.

## Update it later
Edit the plugin files, bump `version` in `plugin.json`, push, and teammates refresh with:

```
/plugin marketplace update ai-engineer-marketplace
```

## Notes
- CLAUDE.md is intentionally NOT in the plugin — it's project-specific. Keep a per-project
  CLAUDE.md; the plugin provides the reusable machinery (agents, command, hooks, skill).
- The hook commands assume `ruff` and `pytest`. Swap them in `hooks/hooks.json` for your
  stack, or generalize them, before sharing widely.
