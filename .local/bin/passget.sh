#!/bin/sh

[ -n "$1" ] && arg1="$(basename $1)" &&
  pass_name=${arg1%.*}
[ -z "$pass_name" ] && pass_name=$(find "$PASSWORD_STORE_DIR" -type f -regex '.+\.gpg$' -exec basename {} \; |
  sed 's/\.gpg$//' | fuzzel --dmenu)

printf '%s' "$pass_name" |
  grep -q '.+otp$' &&
  pass_name="otp/$pass_name" &&
  pass_args=("otp" "$pass_name") || pass_args=("$pass_name")

[ -z "$pass_name" ] && exit 1
[ -f "$PASSWORD_STORE_DIR/$pass_name.gpg" ] || exit 2

pass "${pass_args[@]}" | tr -d '\n' | wtype -
