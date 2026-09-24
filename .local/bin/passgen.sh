#!/bin/bash

rmTmp() {
  tmpName="$XDG_RUNTIME_DIR/pass-name"
  tmpLength="$XDG_RUNTIME_DIR/pass-length"
  rm "$tmpName" "$tmpLength"
}

footConfigDir="$HOME/.config/foot"

# input
foot -a input -c "$footConfigDir/input.ini" -e bash -c '
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
exitCode=$?
[ $exitCode = 0 ] || exit $exitCode

# variables
tmpName="$XDG_RUNTIME_DIR/pass-name"
tmpLength="$XDG_RUNTIME_DIR/pass-length"
passName=$(cat "$tmpName")
passLength=$(cat "$tmpLength")
passDir="$(
  find "$PASSWORD_STORE_DIR" \
    -mindepth 1 -maxdepth 1 \
    -type d \
    ! -name '.*' \
    -printf '%f\n' |
    fuzzel --dmenu
)"
[ -z "$passDir" ] && rmTmp && exit 4

# generate password and type it after removing
# ansi esc sequences and newline characters from text
pass generate -f "$passDir/$passName" "$passLength" |
  awk 'END { gsub(/\x1B\[[0-9;]*[[:alpha:]]/, ""); printf "%s", $0 }' |
  wtype -

# delete temporary files
rmTmp
