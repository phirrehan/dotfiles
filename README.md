# My dotfiles

This repository contains the dotfiles for hyprland desktop. It uses quickshell(caelestia configuration) instead of waybar. It is designed for Arch Linux. For termux or ARM architecuture, check out [dotfiles-termux](https://github.com/phirrehan/dotfiles-termux) instead.

> Although the `dotfiles-termux` are minimalistic because of android's limitations.

# Requirements

Ensure you have git and stow installed:

```
sudo pacman -Sy
sudo pacman -S git stow --needed
```

These dotfiles contain configurations for `zsh`, `neovim`, `tmux`, `foot`, `fuzzel`, `mpv`, `mpd`, `rmpc`, `hyprland`, and `quickshell-git`. Install these applications for using my dotfiles:

```
sudo pacman -S zsh neovim tmux foot fuzzel mpd mpc mpd-mpris rmpc hyprland --needed
```

Use AUR helper yay/paru for installing the `quickshell-git` package.

```
paru -S quickshell-git
```

# Cloning Repository

Clone this repository to your `$HOME` directory

```
cd ~
git clone --recurse-submodules https://github.com/phirrehan/dotfiles.git
```

# Setting up Symlinks

Use stow to create symbolic links from `$HOME/dotfiles/` to `$HOME/` in exactly the same way as they appear in the dotfiles. e.g. `~/dotfiles/.config/` will be symlinked to `~/.config`. Directories/files related like .git and README.md are ignored by `stow` by default.

> Note: Any existing config files that conflict with the config files in `dotfiles`, should be backed up and removed to avoid errors.

```
cd dotfiles
stow .
```

# Zsh Setup

## Change Shell to Zsh

Change your default shell to zsh by using:

```
chsh -s $(which zsh)
```

## Setup Zinit

Use the following command to source .zshrc file

```
exec ~/.zshrc
```

This will install zinit(plugin manager for zsh) which will further install various plugins. This may take time on the first source or new zsh session. Finally, after all installations the zsh configurations will be setup.

# Setting a Nerd Font

This font is useful for nvim and tmux configurations. If you do not need those, you can skip this step. Install a nerd font of your choice. I personally like to use `JetBrainsMono` Nerd font.

```
sudo pacman -S ttf-jetbrains-mono-nerd
```

# Tmux Setup

While inside a tmux environment, run the following command

```
tmux source ~/.config/tmux/tmux.conf
```

Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin

> Prefix has been changed to `Ctrl` + <kbd>space</kbd> in `tmux.conf`

# Neovim Setup

Neovim will lazy load everything when it is opened for the first time. It may take some time in the first launch.

# Fuzzel Setup

Fetch the `fuzzel.ini` file from [caelestia-dots/fuzzel](https://github.com/caelestia-dots/fuzzel) and store it in `~/.config/fuzzel/fuzzel.ini`.

This can be done by the following commands:

```
mkdir -p ~/.config/fuzzel
curl -o "$HOME/.config/fuzzel/fuzzel.ini" "https://raw.githubusercontent.com/caelestia-dots/fuzzel/main/fuzzel.ini"
```

# Setting up Quickshell & Hyprland

Follow the [caelestia](https://github.com/caelestia-dots/caelestia) documentation for setting up quickshell and hyprland dots. This will setup caelestia's dotfiles. The user specific settings are located at `.config/caelestia/`. These should be symlinked to `~/.config/caelestia` with `stow`. The quickshell configurations are located in `shell.json`. `caelestia-cli` config are located in `cli.json`.

The caelestia's hyprland configurations should be symlinked to `~/.config/hypr`. These config files should not be changed. Any changes must be made in `hypr-user.conf`, `hypr-vars.conf`, or `hypr/*.conf` located in `.config/caelestia/`

# Scripts

All the scripts are located in `~/.local/bin` which is added to PATH variable in `.zprofile`. Thus, writing the full path of a script in this directory is not needed. e.g. for executing `~/.local/bin/run` the path can be omitted and be directly written as `run`.

# Thank You

These were most of the general configurations I use. Hope you liked them and have a good day!
