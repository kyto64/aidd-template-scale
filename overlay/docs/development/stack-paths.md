# Stack paths configuration

Fill in this file before using UI/E2E skills (`spec-to-screen`, `screen-to-spec`, `agentic-e2e`).

## Required fields

| Key | Description | Example |
|-----|-------------|---------|
| `screen_spec_dir` | Directory for screen markdown specs | `docs/product/screens/` |
| `implementation_root` | Root path for UI implementation | `src/` or `client/src/` |
| `local_base_url` | Base URL when app is running locally | `http://localhost:5173` |
| `start_command` | How to start the app for E2E | `npm run dev` |

## Current values (edit me)

```yaml
screen_spec_dir: ""
implementation_root: ""
local_base_url: ""
start_command: ""
```

## Gate

Skills check this file. If any required value is empty, they **stop** and print this checklist.
