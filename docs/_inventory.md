# Documentation inventory

Single Source of Truth (SSOT) boundaries for this repository.

## SSOT boundary table

| Domain | SSOT location | Notes |
|--------|---------------|-------|
| Product requirements | `docs/product/` | User-facing behavior |
| Architecture | `docs/architecture/` | System design, APIs, data |
| Operations | `docs/operations/` | Runbooks, deployment |
| Development process | `docs/development/` | Workflow, tooling |
| Application code | (your app paths) | Fill in after adoption |

When documentation and code conflict, **code wins** until docs are updated in the same PR.

## Directory layout

```
docs/
├── _inventory.md          # this file
├── product/
├── architecture/
├── operations/
└── development/
```

## Adoption

After creating a repo from this template:

1. Replace placeholders in `docs/product/overview.md` and `docs/architecture/overview.md`
2. Add your application paths to the SSOT table above
3. Keep specs in `docs/` and link from PRs
