#!/bin/sh

# functions
touchpad_on() {
  hyprctl eval "hl.device({ name = '$device', enabled = true })"
  printf '%s\n' on >"$1"
  command -v caelestia &>/dev/null && 
    caelestia shell toaster info Touchpad "Touchpad Enabled" touchpad_mouse
}
touchpad_off() {
  hyprctl eval "hl.device({ name = '$device', enabled = false })"
  printf '%s\n' off >"$1"
  command -v caelestia &>/dev/null &&
    caelestia shell toaster info Touchpad "Touchpad Disabled" touchpad_mouse_off
}

#variables
device='synaptics-tm3276-022'
state="${XDG_STATE_HOME:-$HOME/.local/state}/touchpad"
mkdir -p "${state%/*}"

case "${1:-}" in
on)
  touchpad_on $state
  ;;

off)
  touchpad_off $state
  ;;

toggle)
  case "$(cat "$state" 2>/dev/null || printf '%s\n' on)" in
  on)
    touchpad_off $state
    ;;
  off)
    touchpad_on $state
    ;;
  esac
  ;;
*)
  printf 'usage: %s {on|off|toggle}\n' "$0" >&2
  exit 1
  ;;
esac
