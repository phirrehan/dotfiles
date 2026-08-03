#!/bin/sh

shell="$HOME/.config/caelestia/shell.json"

if [ "$1" = "visualiser" ]; then
  jq '.background.visualiser.enabled |= not' "$shell" >shell.tmp && mv shell.tmp "$shell"
fi
