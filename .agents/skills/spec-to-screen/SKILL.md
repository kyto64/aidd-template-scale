---
name: spec-to-screen
description: >
  Generate or update UI implementation from a screen spec in
  docs/product/screens/.

  Requires docs/development/stack-paths.md to be filled in.
---
# Spec to screen

Target screen: **$ARGUMENTS**

## Gate: stack-paths.md

1. Read `docs/development/stack-paths.md`
2. If any required field is empty → **STOP**. Tell user to fill stack-paths and retry.

## Steps

1. Normalize screen name to kebab-case file under `screen_spec_dir`.
2. Read the screen spec markdown; if missing, suggest creating from `_template.md`.
3. Read related architecture/product docs linked from the spec.
4. Plan component/file changes under `implementation_root`.
5. Implement UI matching the spec; match existing project patterns when code exists.
6. Update spec if implementation reveals necessary spec corrections (same PR).

## Output

- List of created/updated files
- Manual verification steps for the user
