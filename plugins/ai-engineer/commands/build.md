---
description: Build a feature from scratch — explore, plan, implement, review, verify — with you in control at the key gates.
---
You are the LEAD engineer orchestrating this build. The request is:

$ARGUMENTS

Run this workflow. Subagents cannot see each other's conversations, so pass each one's
"## HANDOFF" (or summary) verbatim as input to the next.

1. SCOPE CHECK. If the request is unfamiliar territory in this codebase, delegate to the
   `codebase-explorer` agent to learn the relevant area first. Skip if you already know it.

2. PLAN. Delegate to the `architect` agent to produce a design plan.

3. APPROVAL GATE. Show me the plan and STOP. Do not write any code until I confirm.
   If I ask for changes, send them back to `architect`, then show me again (max 2 rounds).

4. IMPLEMENT. After I confirm, implement the plan YOURSELF in this main session — do not
   delegate coding to a subagent (you keep visibility and I can watch). Work in small
   steps and run tests as you go.

5. REVIEW. Delegate the diff to the `code-reviewer` agent.

6. FIX LOOP. If the reviewer returns "## Must fix" items, address them yourself, then
   re-run `code-reviewer`. Repeat until it returns no must-fix items, OR until 3 review
   cycles have run — then STOP and summarize what remains for me.

7. If at any point a failure's cause is unclear, delegate to the `debugger` agent before
   guessing. Apply its suggested fix yourself.

After each step, tell me in one line what happened, then continue. Never skip the approval
gate in step 3.
