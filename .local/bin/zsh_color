#!/bin/sh

# variables
theme_file="$ZSH_THEME_DIR/color"
[ -s "$theme_file" ] && theme=$(<$theme_file) || theme=0

# functions
reset_colors() {
  # expects first argument to be a tty
  printf '\e]110;\a\e]111;\a\e]112;\a' >"/dev/$1"
  i=0
  while [ $i -le 255 ]; do
      printf '\e]104;%d\a' "$i" >"/dev/$1"
      i=$((i + 1))
  done
}
caelestia_colors() {
  # expects first argument to be a tty
  cat "$HOME/.local/state/caelestia/sequences.txt" >"/dev/$1"
}
apply() {
  case "$1" in
      0) reset_colors "$2" ;;
      1) caelestia_colors "$2" ;;
  esac
}
toggle-all-shell() {
  [ "$theme" = 0 ] && new_theme=1 || new_theme=0
  while read -r user tty _; do
    apply "$new_theme" "$tty"
  done < <(who)
  theme="$new_theme"
  printf '%s\n' "$theme" >"$ZSH_THEME_DIR/color"
}
help() {
  cat <<EOF
Usage: $0 <arg>

Arguments:
  reset               apply normal terminal colors
  caelestia           apply caelestia's color scheme
  default             apply color scheme in file $1
  toggle              toggle themes across all shells
  -h | --help | help
              print this message
EOF
}

# check if caelestia's colors exist
if [ ! -f "$HOME/.local/state/caelestia/sequences.txt" ]; then
  echo "Error: caelestia colors not available."
  exit 1
fi

# start
case "$1" in
  reset) reset_colors "tty";;
  caelestia) caelestia_colors "tty";;
  toggle) toggle-all-shell ;;
  default) apply "$theme" "tty" ;;
  -h|--help) help "$theme_file";;
*) 
  echo "Invalid argument. Use --help or -h for usage."
  exit 1
  ;;
esac
