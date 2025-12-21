# ======= Exports =======

export CARGO_HOME="$HOME/.local/share/cargo"
export PATH="$PATH:$HOME/go/bin"


# ======= KeyBinds =======

# Set Vi Mode
bindkey -v

# ZLE Widget
function vi-yank-wlclip {
    zle vi-yank
   echo -n "$CUTBUFFER" | wl-copy
}

function vim_clipboard_file() {
  local filename
  filename=$(wl-paste)

  [ -n "$filename" ] && echo "$filename" && nvim "$filename.json"
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
bindkey -s '^X' 'vim_clipboard_file\n'
bindkey -s "^o" 'cd ..\n'

# Docker function
function docker-reload(){
  docker compose down --rmi local && docker compose up
}


# ======= Load Files =======

[ -f "$HOME/.config/zsh/zinitrc" ] &&
  source "$HOME/.config/zsh/zinitrc"
[ -f "$HOME/.config/zsh/aliases" ] &&
  source "$HOME/.config/zsh/aliases"
