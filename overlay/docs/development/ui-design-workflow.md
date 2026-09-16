# UI design workflow

Process for keeping screen specs and implementation aligned.

## 1. Spec first

1. Create or update `docs/product/screens/<screen-name>.md` using `_template.md`.
2. Review with product/design stakeholders when applicable.

## 2. Implement

1. Fill in [stack-paths.md](./stack-paths.md).
2. Run `/spec-to-screen <screen-name>` to generate or update UI code under your implementation root.

## 3. Reverse sync

When code exists without a spec:

1. Run `/screen-to-spec <ComponentName>` to draft markdown from the component.

## 4. Verify

1. Run `/agentic-e2e <url or screen> — expected text` after the app is running locally.

## Conventions

- Screen file names: kebab-case (`user-list.md`)
- One primary screen per markdown file
