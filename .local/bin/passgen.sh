#!/bin/bash

# input
foot -a input -c ~/.config/foot/input.ini -e bash -c '
read -p "Enter name of password: " passName
[ -z "$passName" ] && exit 1
read -p "Enter length of password: " passLength
[ -z "$passLength" ] && exit 2
if [[ ! "$passLength" =~ ^[0-9]+$ ]]; then
  echo "Error: Expected a (positive) Number"
  read -p "Press enter to exit." && exit 3
fi
printf "%s" "$passName">"$XDG_RUNTIME_DIR/pass-name"
printf "%s" "$passLength">"$XDG_RUNTIME_DIR/pass-length"
'

# variables
tmpName="$XDG_RUNTIME_DIR/pass-name"
tmpLength="$XDG_RUNTIME_DIR/pass-length"
[ -f "$tmpName" ] && [ -f "$tmpLength" ] || exit 1
passName=$(cat "$tmpName")
passLength=$(cat "$tmpLength")

# generate password and type it after removing
# ansi esc sequences and newline characters from text
pass generate -f "$passName" "$passLength" |
  awk 'NR==2 { gsub(/\x1B\[[0-9;]*[[:alpha:]]/, ""); printf "%s", $0 }' |
  wtype -

# delete temporary variables
rm "$tmpName" "$tmpLength"
