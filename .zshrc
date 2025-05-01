# Path to scripts' directory
scriptsDir="$HOME/.local/bin"


# Exports
export CARGO_HOME="$HOME/.local/share/cargo"

# Source/Load Files 
[ -f "$HOME/.config/zsh/zinitrc" ] &&
  source "$HOME/.config/zsh/zinitrc"
[ -f "$HOME/.config/zsh/aliases" ] &&
  source "$HOME/.config/zsh/aliases"
[ -f "$HOME/.config/zsh/shortcut" ] &&
  source "$HOME/.config/zsh/shortcut"
[ -f "$HOME/files/privateFiles/zsh/private" ] &&
  source "$HOME/files/privateFiles/zsh/private"
