# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEEHIST=$HISTSIZE
HISTFILE=~/.cache/zsh/history

# Source/Load Files 
[ -f "$HOME/.config/zsh/shortcutrc" ] && source "$HOME/.config/zsh/shortcutrc"
[ -f "$HOME/.config/zsh/aliasrc" ] && source "$HOME/.config/zsh/aliasrc"
[ -f "$HOME/files/privateFiles/.zsh/privaterc" ] && source "$HOME/files/privateFiles/.zsh/privaterc"
[ -f "$HOME/.config/zsh/zinitrc" ] && source "$HOME/.config/zsh/zinitrc"

# Exports
export CLANG_FORMAT_STYLE=~/.config/clang/.clang-format
export PASSWORD_STORE_DIR=~/files/privateFiles/.password-store/

# KeyBindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Shell Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
