#!/bin/sh
# Packs the ChatGPT plugin for OpenAI's plugin directory from plugins/otwarteprawo.
# The Claude plugin and the ChatGPT plugin share that directory and its skills/; the
# ZIP takes only OpenAI's files: the root plugin.json and mcp.json, skills/ and
# assets/. assets/icon.png is a copy of the Claude plugin's .claude-plugin/icon.png,
# not a link: Anthropic's directory refuses a plugin that holds a symbolic link.
set -eu
root=$(cd "$(dirname "$0")/.." && pwd)
out="$root/otwarteprawo-openai.zip"
rm -f "$out"
cd "$root/plugins/otwarteprawo"
zip -qrX "$out" plugin.json mcp.json skills assets
unzip -l "$out"
