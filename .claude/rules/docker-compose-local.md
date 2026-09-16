---
paths:
  - docker-dev/**
---
# Docker Compose (local development)

Apply only when a `docker-dev/` directory exists in your project.

## Rule

- Run `docker compose` / `docker-compose` **only after** `cd docker-dev`.
- Do not run compose from the repository root with `-f docker-dev/compose.yaml` in new docs or agent answers.

## Example

```bash
cd docker-dev
docker compose up -d --build
docker compose exec <service> <command>
```

If `docker-dev/` does not exist yet, skip Docker steps and note that in the PR.
