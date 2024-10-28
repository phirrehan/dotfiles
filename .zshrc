# Path to scripts
path_to_scripts="$HOME/dotfiles/scripts"

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
export NVM_DIR="$HOME/.config/nvm"
# WSL specific export command
[ -n "$WSL_DISTRO_NAME" ] && export PATH=$(echo "$PATH" | sed -e 's/:\/mnt\/c\/Program Files\/nodejs\///')

# KeyBindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Shell Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
