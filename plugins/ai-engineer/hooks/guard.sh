#!/usr/bin/env bash
# PreToolUse guard for Bash commands.
# Claude Code passes the event JSON on STDIN. We read tool_input.command and
# exit 2 to BLOCK (exit 0 = allow). Exit 2 is what enforces; exit 1 only warns.

input=$(cat)
cmd=$(printf '%s' "$input" | python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_input',{}).get('command',''))" 2>/dev/null)

# Destructive patterns to block. Tune to your project.
if printf '%s' "$cmd" | grep -qiE 'rm -rf (/|~|\$HOME|\*)|:\(\)\{|mkfs|dd if=|>\s*/dev/sd|git push.*--force|git reset --hard|DROP TABLE|TRUNCATE |DELETE FROM .* WHERE 1|\.env'; then
  echo "guard.sh BLOCKED a potentially destructive command: $cmd" >&2
  exit 2
fi

exit 0
