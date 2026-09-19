# ======= Load Files =======
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/shortcuts.zsh"
source "$HOME/.config/zsh/keybinds.zsh"
source "$HOME/.config/zsh/misc.zsh"
source "$HOME/.config/zsh/zinit.zsh"

# ======= Greeting =======
[ -z "$TMUX" ] && [ -z "$NVIM" ] && $HOME/.local/bin/greeting.sh
$HOME/.local/bin/zsh_color.sh default
