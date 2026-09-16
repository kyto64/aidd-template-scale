#!/usr/bin/env bash
# Assemble aidd-template-scale from lean SSOT + local overlay/.
# Usage: ./scripts/assemble-from-lean.sh [path-to-lean-repo]
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCALE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
LEAN_ROOT="${1:-${SCALE_ROOT}/../aidd-template-lean}"

if [[ ! -d "${LEAN_ROOT}/.rulesync" ]]; then
  echo "error: lean repo not found at ${LEAN_ROOT}" >&2
  exit 1
fi

echo "Assembling scale from lean: ${LEAN_ROOT}"

# Copy lean tree into scale root (exclude git, overlay tooling, assemble artifacts)
rsync -a --delete \
  --exclude '.git/' \
  --exclude 'overlay/' \
  --exclude 'scripts/assemble-from-lean.sh' \
  --exclude 'LEAN_REF' \
  --exclude 'scripts/check-no-proprietary-leaks.sh' \
  "${LEAN_ROOT}/" "${SCALE_ROOT}/"

# Apply overlay (additive / overwriting)
if [[ -d "${SCALE_ROOT}/overlay" ]]; then
  rsync -a "${SCALE_ROOT}/overlay/" "${SCALE_ROOT}/"
fi

# Record lean commit if lean is a git repo
if git -C "${LEAN_ROOT}" rev-parse HEAD >/dev/null 2>&1; then
  git -C "${LEAN_ROOT}" rev-parse HEAD > "${SCALE_ROOT}/LEAN_REF"
  echo "LEAN_REF=$(cat "${SCALE_ROOT}/LEAN_REF")"
fi

cd "${SCALE_ROOT}"
rulesync generate
echo "Done. Run rulesync generate --check and proprietary leak check before commit."
