# ======= Exports =======

export CARGO_HOME="$HOME/.local/share/cargo"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/bin"


# ======= KeyBinds =======

# Set Vi Mode
bindkey -v

# ZLE Widget
function vi-yank-wlclip {
    zle vi-yank
   echo -n "$CUTBUFFER" | wl-copy
}

# Command Mode
bindkey -M vicmd "_" beginning-of-line
zle -N vi-yank-wlclip
bindkey -M vicmd 'y' vi-yank-wlclip

# Inset Mode
bindkey "^F" vi-forward-char
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^?" backward-delete-char
bindkey -s "^o" 'cd ..\n'

# ======= Load Files =======

[ -f "$HOME/.config/zsh/zinitrc" ] &&
  source "$HOME/.config/zsh/zinitrc"
[ -f "$HOME/.config/zsh/aliases" ] &&
  source "$HOME/.config/zsh/aliases"
