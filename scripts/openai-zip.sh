#!/bin/sh
# Packs the ChatGPT plugin for OpenAI's plugin directory from plugins/otwarteprawo.
# The Claude plugin and the ChatGPT plugin share that directory and its skills/; the
# ZIP takes only OpenAI's files: the root plugin.json and mcp.json, skills/ and
# assets/. zip stores the file a symlink points at, so assets/icon.png is the
# Claude plugin's icon.
set -eu
root=$(cd "$(dirname "$0")/.." && pwd)
out="$root/otwarteprawo-openai.zip"
rm -f "$out"
cd "$root/plugins/otwarteprawo"
zip -qrX "$out" plugin.json mcp.json skills assets
unzip -l "$out"
