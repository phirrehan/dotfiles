# Path to scripts' directory
scriptsDir="$HOME/.local/bin"


# Exports
export CARGO_HOME="$HOME/.local/share/cargo"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"

# Source/Load Files 
[ -f "$HOME/.config/zsh/zinitrc" ] &&
  source "$HOME/.config/zsh/zinitrc"
[ -f "$HOME/.config/zsh/aliases" ] &&
  source "$HOME/.config/zsh/aliases"
