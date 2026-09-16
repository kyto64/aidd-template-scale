---
name: screen-to-spec
description: |
  Draft or update a screen spec markdown from an existing UI component.
  Requires docs/development/stack-paths.md to be filled in.
targets:
  - claudecode
  - agentsskills
disable-model-invocation: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Grep
  - Glob
---

# Screen to spec

Component or screen name: **$ARGUMENTS**

## Gate: stack-paths.md

1. Read `docs/development/stack-paths.md`
2. If any required field is empty → **STOP**. Tell user to fill stack-paths and retry.

## Steps

1. Locate component under `implementation_root` (Grep/Glob by name).
2. Read component, styles, routes, and related API calls.
3. Draft `docs/product/screens/<kebab>.md` using `_template.md` structure.
4. Note gaps as open questions in the spec.

## Output

- Path to created/updated spec file
- Suggested follow-up for `/spec-to-screen` if code should be refactored to match spec
