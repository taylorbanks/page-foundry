#!/usr/bin/env bash
# Reliable interceptor screenshot. captureVisibleTab only grabs the FOCUSED window's ACTIVE
# tab; it hangs 45s if the target isn't front. So: focus Chrome, open the url in a fresh tab,
# switch to it, capture, move the result, close the tab. Usage: pf-render.sh <url> <outfile.png>
set -u
url="$1"; out="$2"; cd "$(git rev-parse --show-toplevel)" || exit 2
command -v interceptor >/dev/null 2>&1 || ln -sfn ~/projects/interceptor/dist/interceptor ~/.local/bin/interceptor
osascript -e 'tell application "Google Chrome" to activate' >/dev/null 2>&1; sleep 1
tab=$(interceptor tab new "$url" 2>&1 | grep -oE '[0-9]{9,}' | head -1)
[ -z "$tab" ] && { echo "render: could not open tab for $url"; exit 1; }
interceptor tab switch "$tab" >/dev/null 2>&1
interceptor wait-stable --timeout 12000 >/dev/null 2>&1 || sleep 4
interceptor screenshot --save >/dev/null 2>&1
latest=$(ls -t interceptor-screenshot-*.png 2>/dev/null | head -1)
interceptor tab close "$tab" >/dev/null 2>&1
if [ -n "$latest" ] && [ -f "$latest" ]; then mkdir -p "$(dirname "$out")"; mv "$latest" "$out"; echo "render: saved $out"; exit 0; fi
echo "render: screenshot produced no file for $url"; exit 1
