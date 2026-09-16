---
name: review-dependabot-pr
description: |
  Review a Dependabot pull request for upgrade risk across compatibility, security, and CI.
targets:
  - claudecode
  - agentsskills
disable-model-invocation: true
allowed-tools:
  - Read
  - Grep
  - Glob
  - "Bash(gh pr *)"
  - "Bash(gh api *)"
---

# Review Dependabot PR

PR number: **$ARGUMENTS**

## Steps

1. `gh pr view $ARGUMENTS` — confirm author is dependabot[bot] or similar
2. `gh pr diff $ARGUMENTS`
3. Assess:
   - Semver bump type (patch/minor/major)
   - Changelog / release notes if linked
   - Transitive impact on build (docs-site, CI workflows)
   - Security advisory references
4. Recommend: merge / wait / close with rationale
5. Optionally post summary comment via `gh pr comment`

## Output format

- **Risk level:** low / medium / high
- **Breaking changes:** yes/no
- **CI:** expected pass/fail
- **Recommendation:** merge / manual test first / reject
