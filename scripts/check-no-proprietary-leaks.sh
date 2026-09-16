#!/usr/bin/env bash
# Fail-closed scan for proprietary/service-specific tokens in the working tree.
# Usage: ./scripts/check-no-proprietary-leaks.sh [directory]
set -euo pipefail

ROOT="${1:-.}"
cd "$ROOT"

PATTERNS=(
  'BMSDEV'
  'berth-management'
  'Berth'
  'バース'
  'INTLOOP'
  'intloop'
  'int-ts1'
  'AITRIOS'
  'aitrios'
  'bms-team'
  'Auth0'
  'backlog\.com'
  'warehouse_dashboard'
  'Quasar'
)

EXCLUDES=(
  --glob '!scripts/check-no-proprietary-leaks.sh'
  --glob '!.git/**'
)

fail=0
for pat in "${PATTERNS[@]}"; do
  if rg -i -n "${EXCLUDES[@]}" "$pat" . 2>/dev/null; then
    echo "FAIL: matched pattern: $pat" >&2
    fail=1
  fi
done

# Word-boundary bms (avoid false positives in unrelated words)
if rg -i -n "${EXCLUDES[@]}" '\bbms\b' . 2>/dev/null; then
  echo "FAIL: matched pattern: bms" >&2
  fail=1
fi

if [[ $fail -ne 0 ]]; then
  echo "Proprietary leak check failed." >&2
  exit 1
fi

echo "Proprietary leak check passed."
