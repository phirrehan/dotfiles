#!/bin/sh

THEME="${1:-$HOME/.local/state/caelestia/scheme.json}"
fuzzel_dir="$HOME/.config/fuzzel"

# Helper to read a colour from the JSON
color() {
  jq -r --arg key "$1" '.colours[$key]' "$THEME"
}

background="$(color background)"
text="$(color text)"
primary="$(color primary)"
outline="$(color outline)"
subtext0="$(color subtext0)"
surface="$(color surface)"
surface1="$(color surface1)"
surface2="$(color surface2)"
secondary="$(color secondary)"

mkdir -p "$fuzzel_dir"
cat >"$fuzzel_dir/fuzzel.ini" <<EOF
font=JetBrains Mono NF:size=17
terminal=foot -e
prompt="> "
layer=overlay
lines=15
width=60
dpi-aware=no
inner-pad=10
horizontal-pad=40
vertical-pad=15
match-counter=yes

[border]
radius=10
width=2

[colors]
background=${background}dd
text=${text}dd
prompt=${primary}ff
placeholder=${subtext0}ff
input=${text}ff
match=${secondary}ff
selection=${primary}87
selection-text=${text}ff
selection-match=${secondary}ff
counter=${subtext0}ff
border=${outline}77
EOF
