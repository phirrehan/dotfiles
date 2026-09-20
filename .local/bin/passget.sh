#!/bin/sh

[ -n "$1" ] && arg1="$(basename $1)" &&
  passName=${arg1%.*}
[ -z "$passName" ] && passName=$(ls $PASSWORD_STORE_DIR | sed 's/\.gpg$//' | fuzzel --dmenu)

[ -z "$passName" ] && exit 1
[ -f "$PASSWORD_STORE_DIR/$passName.gpg" ] || exit 2

pass show "$passName" | tr -d '\n' | wtype -
