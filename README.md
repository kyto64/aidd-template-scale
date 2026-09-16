# aidd-template-scale

**AI-driven development** template (scale): everything in **lean**, plus VitePress docs site, UI/E2E skills, lefthook, gitleaks, and Dependabot.

Still **no application code** — configure [stack-paths.md](./docs/development/stack-paths.md) after you add a UI.

## Use this template

1. **Use this template** on GitHub to create your repository.
2. Clone and complete the [adoption checklist](#adoption-checklist).

## vs lean

| Feature | lean | scale |
|---------|------|-------|
| rulesync + Issues workflow | yes | yes |
| VitePress `docs-site/` | no | yes |
| UI skills (`spec-to-screen`, etc.) | no | yes (gated by stack-paths) |
| `agentic-e2e` (Linux/WSL) | no | yes |
| lefthook + gitleaks pre-commit | no | yes |
| Dependabot | no | yes |

## Overlay maintenance

This repository is assembled from **aidd-template-lean** (SSOT) plus `overlay/`:

```bash
bash scripts/assemble-from-lean.sh ../aidd-template-lean
```

See `LEAN_REF` for the lean commit used in the last assemble.

## Adoption checklist

- [ ] All lean checklist items (labels, Actions, rulesync)
- [ ] Fill [docs/development/stack-paths.md](./docs/development/stack-paths.md) before UI/E2E skills
- [ ] `cd docs-site && pnpm install && pnpm build`
- [ ] Install lefthook: `lefthook install` (optional locally)
- [ ] Replace `PROJECT_NAME` placeholders

## Tools (pinned)

| Tool | Version |
|------|---------|
| rulesync | 8.17.0 |
| Node.js | 22+ |
| pnpm | 9.x (docs-site) |
| gitleaks | 8.x |
| lefthook | 1.6+ |
| gh | 2.82.1+ |

## agentic-e2e OS support

**Linux and WSL only** for bundled Chrome scripts. On macOS, use manual browser testing or your own E2E runner.

## License

MIT — see [LICENSE](./LICENSE).
