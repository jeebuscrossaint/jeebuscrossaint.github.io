#!/usr/bin/env sh
# Regenerate og.jpg from scripts/og.html.
# Needs a Chrome/Chromium binary; run from the repo root:  sh scripts/build-og.sh
set -e

CHROME="${CHROME:-$(command -v google-chrome-stable || command -v chromium || command -v chromium-browser)}"
[ -n "$CHROME" ] || { echo "no chrome/chromium found — set CHROME=/path/to/chrome" >&2; exit 1; }

# served over http, not file://, so the @font-face request isn't blocked
python3 -m http.server 8931 >/dev/null 2>&1 &
SRV=$!
trap 'kill "$SRV" 2>/dev/null' EXIT
sleep 1

"$CHROME" --headless=new --disable-gpu --hide-scrollbars \
  --force-prefers-reduced-motion --run-all-compositor-stages-before-draw \
  --virtual-time-budget=5000 --window-size=1200,630 \
  --screenshot=/tmp/og-raw.png http://localhost:8931/scripts/og.html >/dev/null 2>&1

# the card is a photograph now, so it ships as JPEG — a PNG of this is ~6x the bytes for no
# visible gain. The name change also forces the social caches to refetch.
magick /tmp/og-raw.png -strip -quality 86 og.jpg
rm -f /tmp/og-raw.png

echo "wrote og.jpg ($(( $(wc -c < og.jpg) / 1024 )) KB)"
