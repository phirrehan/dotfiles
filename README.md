# My dotfiles

This repository contains the dotfiles for both my desktop and termux. It uses Arch Linux package manager pacman. If you have a different linux distribution, replace pacman with your distribution's package manager.

## Requirements

Ensure you have git and stow installed:

```
sudo pacman -Sy
sudo pacman -S git stow --needed
```

These dotfiles contains configurations for zsh, neovim, tmux, foot and clang. Install these applications for using my dotfiles:

```
sudo pacman -S zsh neovim tmux foot clang --needed
```
## Cloning Repository

Clone this repository to your $HOME directory
```
cd ~
git clone --recurse-submodules https://github.com/phirrehan/dotfiles.git
```
## Setting up Symlinks

Use stow to create sym links from $HOME/dotfiles to $HOME, $HOME/.local/bin and $HOME/.config/ to setup configurations.

```
cd dotfiles
stow .
```

## Change Shell to Zsh

Change your default shell to zsh by using:
```
chsh -s $(which zsh)
```

## Setting a Nerd Font

This font is useful for nvim and tmux configurations. If you do not need those, you can skip this step. Install a nerd font of your choice. I personally like to use JetBrainsMono nerd font.

```
sudo pacman -S ttf-jetbrains-mono-nerd
```

## Setting Up Zsh

Use the following command to source .zshrc

```
source ~/.zshrc
```

This will install zinit(plugin manager for zsh) which will further install various plugins. This may take time on the first source or new zsh session. Finally, after all installations the zsh configurations will be setup.

## Setting up Tmux

Install the Tmux Plugin Manager(TPM) for installing tmux plugins.

```
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
```

While inside a tmux environment, run the following command

```
tmux source ~/.config/tmux/tmux.conf
```

Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin

> By default the prefix in tmux is `ctrl` + <kbd>b</kbd>

> I have set up the prefix tmux.conf as `ctrl` + <kbd>space</kbd>

## Setting up Neovim

Neovim will lazy load everything when it is opened for the first time. It may take some time in the first launch. Note: nvim is set as alias for vim. If you want to use the base vim, remove the alias from ~/.config/zsh/aliasrc file.
