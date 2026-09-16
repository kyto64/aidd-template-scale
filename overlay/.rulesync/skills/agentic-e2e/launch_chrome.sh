#!/usr/bin/env bash
# Launch headless Chrome with remote debugging for agentic-e2e (Linux/WSL).
set -euo pipefail

PORT="${CDP_PORT:-9222}"
USER_DATA="${TMPDIR:-/tmp}/aidd-e2e-chrome-$$"

find_chrome() {
  local candidates=(
    google-chrome
    google-chrome-stable
    chromium
    chromium-browser
  )
  for c in "${candidates[@]}"; do
    if command -v "$c" >/dev/null 2>&1; then
      command -v "$c"
      return 0
    fi
  done
  return 1
}

CHROME="$(find_chrome)" || {
  echo "error: Chrome/Chromium not found. Install google-chrome or chromium." >&2
  exit 1
}

mkdir -p "$USER_DATA"
echo "Starting Chrome on port ${PORT} (user-data: ${USER_DATA})"
exec "$CHROME" \
  --headless=new \
  --disable-gpu \
  --no-sandbox \
  --remote-debugging-port="${PORT}" \
  --user-data-dir="${USER_DATA}" \
  "$@"
