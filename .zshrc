# Path to scripts
path_to_scripts="$HOME/dotfiles/scripts"


# Exports
export CLANG_FORMAT_STYLE=~/.config/clang/.clang-format
export PASSWORD_STORE_DIR=~/files/privateFiles/.password-store/

# Source/Load Files 
[ -f "$HOME/.config/zsh/shortcutrc" ] && source "$HOME/.config/zsh/shortcutrc"
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"
[ -f "$HOME/files/privateFiles/.zsh/privaterc" ] && source "$HOME/files/privateFiles/.zsh/privaterc"
[ -f "$HOME/.config/zsh/zinitrc" ] && source "$HOME/.config/zsh/zinitrc"
