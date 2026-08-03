#!/bin/sh

# functions
help() {
  cat <<EOF
Usage: $0 <arg>

Arguments:
  install     install a package from pacman repository
  remove      remove an installed package
  update      update system packages
  aur         install a package from AUR repository
  aur-update  update AUR packages
  -h | --help | help
              print this message
EOF
}

run() {
  local conf=()

  [ -f "$HOME/.config/foot/fzf.ini" ] &&
    conf=(-c "$HOME/.config/foot/fzf.ini")

  foot -a "foot-fzf" "${conf[@]}" -e sh -c "$1"
}

# variables
menu="fzf --multi --preview-window=wrap,border-sharp --prompt '󰮯 ' --preview"
pause='printf "\nPress Enter to exit..."; read -r'

# check required packages
command -v fzf &>/dev/null || {
  run '
  echo "error: fzf not found"
  eval $pause
  exit 1
  '
}

case "$1" in
install)
  run "pacman -Slq | $menu 'pacman -Si {1}' | xargs -ro sudo pacman -S; $pause"
  ;;

remove)
  run "pacman -Qq | $menu 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns; $pause"
  ;;

update)
  run "sudo pacman -Syu; $pause"
  ;;

aur)
  run "yay -Slq | $menu 'yay -Si {1}' | xargs -ro paru -S; $pause"
  ;;

aur-update)
  run '
      paru -Qua
      printf "Do you want to update? [Y/n] "
      read -r input

      case "$input" in
        [Yy]|"")
          paru -Syu
          ;;
      esac

      printf "\nPress Enter to continue..."
      read -r
    '
  ;;

-h | --help | help)
  help
  ;;

*)
  echo "Invalid argument. Use --help or -h for help."
  exit 1
  ;;
esac
