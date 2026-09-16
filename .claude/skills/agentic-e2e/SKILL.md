---
name: agentic-e2e
description: >
  E2E UI verification via headless Chrome and CDP. Requires stack-paths.md and a
  running app.
---
# Agentic E2E

User request: **$ARGUMENTS**

## Gate: stack-paths.md

1. Read `docs/development/stack-paths.md`
2. If any required field is empty → **STOP**.

## Gate: OS support

Supported for **Linux and WSL** only (see skill README in repo). On other OS, stop and ask user to run manual browser tests.

## Steps

1. Confirm app is running (`start_command` / `local_base_url`).
2. Launch Chrome: `.claude/skills/agentic-e2e/launch_chrome.sh`
3. Drive UI: `node .claude/skills/agentic-e2e/cdp_drive.mjs --url "<url>" --expect "<text>"`
4. Report pass/fail with screenshot path if script provides one.
5. Stop Chrome when done.

## Notes

- Do not store credentials in scripts; use test accounts via env vars your project defines.
- This skill does not replace full E2E suites — use for targeted agent verification.
