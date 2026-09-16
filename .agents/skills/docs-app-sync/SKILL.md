---
name: docs-app-sync
description: >
  Sync VitePress navigation when docs/ markdown files are added, removed, or
  renamed.
---
# Docs app sync

When `docs/**/*.md` changes in a PR, update these three navigation surfaces in the **same PR**:

| Surface | Location |
|---------|----------|
| Sidebar | `docs-site/.vitepress/config.mjs` |
| Directory index | `docs/<area>/index.md` tables |
| Inventory | `docs/_inventory.md` |

## Steps

1. `git diff --name-status -- docs/**/*.md` (or compare to main)
2. For each added/removed/renamed page, update sidebar links and index tables
3. Update `_inventory.md` when new doc areas or directories appear
4. Run `pnpm --dir docs-site build` when Node/pnpm available

## Notes

- VitePress `srcDir` points at `../docs` — do not duplicate markdown under `docs-site/`.
