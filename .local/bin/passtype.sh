#!/bin/sh

selection="$XDG_RUNTIME_DIR/pass-selected"
[ -f "$selection" ] || exit 1

passName=$(cat "$selection")
[ -z "$passName" ] && exit 1

pass show "$passName" | tr -d '\n' | wtype -
rm -f "$selection"
