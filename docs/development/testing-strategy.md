# Testing strategy

Define how this repository validates changes.

## Layers

| Layer | When | Tooling |
|-------|------|---------|
| Unit | Functions/modules | (add: pytest, vitest, etc.) |
| Integration | API + DB | (add as needed) |
| E2E | User flows | `/agentic-e2e` + optional Playwright/Cypress |

## Ticket workflow

- `/start-ticket` runs available lint/test commands before opening a PR.
- If no toolchain exists yet, PR must state "skipped — no tests configured".

## CI

- `check_rulesync` — AI settings sync
- `docs-site` — VitePress build (scale template)

Add application test workflows when you add code.
