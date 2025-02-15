# Path to scripts
path_to_scripts="$HOME/.local/bin"


# Exports
export CLANG_FORMAT_STYLE="$HOMME/.config/clang/.clang-format"
export PASSWORD_STORE_DIR="$HOME/files/privateFiles/.password-store/"
export CARGO_HOME="$HOME/.local/share/cargo"
export MONO_CONFIG="$HOME/.config/.mono"
export PULSE_COOKIE="$HOME/.config/pulse"
export GIT_CONFIG_GLOBAL="$HOME/.config/git/config"

# Source/Load Files 
[ -f "$HOME/.config/zsh/zinitrc" ] &&
  source "$HOME/.config/zsh/zinitrc"
[ -f "$HOME/.config/zsh/aliases" ] &&
  source "$HOME/.config/zsh/aliases"
[ -f "$HOME/.config/zsh/shortcut" ] &&
  source "$HOME/.config/zsh/shortcut"
[ -f "$HOME/files/privateFiles/zsh/private" ] &&
  source "$HOME/files/privateFiles/zsh/private"
