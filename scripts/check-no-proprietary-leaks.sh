#!/usr/bin/env bash
# Fail-closed scan for proprietary/service-specific tokens in the working tree.
# Usage: ./scripts/check-no-proprietary-leaks.sh [directory]
#
# Customize PATTERNS for your organization before adoption.
set -euo pipefail

ROOT="${1:-.}"
cd "$ROOT"

PATTERNS=(
  'YOUR_ORG_CODE'
  'your-internal-service'
  'internal-hostname\.example\.com'
  'legacy-project-name'
)

EXCLUDES=(
  --glob '!.git/**'
)

fail=0
for pat in "${PATTERNS[@]}"; do
  set +e
  matches=$(rg --hidden -i -n "${EXCLUDES[@]}" "$pat" . 2>&1)
  rc=$?
  set -e
  if [[ $rc -eq 0 ]]; then
    echo "$matches"
    echo "FAIL: matched pattern: $pat" >&2
    fail=1
  elif [[ $rc -gt 1 ]]; then
    echo "ERROR: rg failed for pattern: $pat" >&2
    echo "$matches" >&2
    fail=1
  fi
done

if [[ $fail -ne 0 ]]; then
  echo "Proprietary leak check failed." >&2
  exit 1
fi

echo "Proprietary leak check passed."
