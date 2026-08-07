# My dotfiles

This repository contains the dotfiles for hyprland desktop. It uses quickshell(caelestia configuration) instead of waybar. It is designed for Arch Linux. For termux or ARM architecuture, check out [dotfiles-termux](https://github.com/phirrehan/dotfiles-termux) instead.

> Although the `dotfiles-termux` are minimalistic because of android's limitations.

These dotfiles contain configurations for `zsh`, `neovim`, `tmux`, `foot`, `fuzzel`, `mpv`, and `caelestia-shell`. Furthermore, it contains some scripts that I frequently use.

# Quick Setup

Clone the repo into your home directory and run the bootstrap script:

```
cd ~
git clone https://github.com/phirrehan/dotfiles.git
cd ./dotfiles
./.local/bin/setup_system.sh
```

> Use `--no-caelestia` option in `setup_system.sh` to avoid installing `caelestia-shell`

`setup_system` installs all dependencies, stows the configs into `$HOME`, sets up
zsh (zinit), tmux (tpm + plugins) and neovim (lazy + mason + treesitter, headless).
Each step is independent — a failure logs a warning and the rest still run, so it
is safe to re-run.

After it finishes, start a fresh shell with `exec zsh`.

# Manual Setup

Ensure you have git and stow installed:

```zsh
sudo pacman -Sy
sudo pacman -S git stow --needed
```

Install these applications for using my dotfiles:

```zsh
sudo pacman -S zsh neovim tmux foot fuzzel hyprsunset hyprpicker --needed
```

Use AUR helper yay/paru for installing the `caelestia-cli` package.

```zsh
paru -S caelestia-cli
```

## Cloning Repository

Clone this repository to your `$HOME` directory

```zsh
cd ~
git clone https://github.com/phirrehan/dotfiles.git
```

## Setting up Symlinks

Use stow to create symbolic links from `$HOME/dotfiles/` to `$HOME/` in exactly the same way as they appear in the dotfiles. e.g. `~/dotfiles/.config/` will be symlinked to `~/.config`. Directories/files related like .git and README.md are ignored by `stow` by default.

> Note: Any existing config files that conflict with the config files in `dotfiles`, should be backed up and removed to avoid errors.

```zsh
cd dotfiles
stow .
```

## Zsh Setup

### Change Shell to Zsh

Change your default shell to zsh by using:

```zsh
chsh -s $(which zsh)
```

### Setup Zinit

Use the following command to source .zshrc file

```zsh
exec ~/.zshrc
```

This will install zinit(plugin manager for zsh) which will further install various plugins. This may take time on the first source or new zsh session. Finally, after all installations the zsh configurations will be setup.

## Setting a Nerd Font

This font is useful for nvim and tmux configurations. If you do not need those, you can skip this step. Install a nerd font of your choice. I personally like to use `JetBrainsMono` Nerd font.

```zsh
sudo pacman -S ttf-jetbrains-mono-nerd
```

## Tmux Setup

While inside a tmux environment, run the following command

```zsh
tmux source ~/.config/tmux/tmux.conf
```

Press `prefix` + <kbd>I</kbd> (capital i, as in **I**nstall) to fetch the plugin

> Prefix has been changed to `Ctrl` + <kbd>space</kbd> in `tmux.conf`

## Neovim Setup

Ensure you have the following packages installed before running runing Neovim for the first time:

- 7zip
- unrar
- unzip
- python
- go
- rust
- deno

```zsh
sudo pacman -S 7zip unrar unzip python go rust deno
```

Neovim will lazy load everything when it is opened for the first time. It may take some time on the first launch.

## Yazi

Install the `catppuccin-mocha` flavor by:

```zsh
ya pkg add yazi-rs/flavors:catppuccin-mocha
```

Create `~/.config/yazi/theme.toml` and add the following content:

```toml
[flavor]
dark = "catppuccin-mocha"
```

For additional information, see `catppuccin-mocha` flavor [documentation](https://github.com/yazi-rs/flavors/tree/main/catppuccin-mocha.yazi)

## Mpv Setup

The only extra thing that `mpv` needs is a font. It can be installed via AUR helper as follows:

```zsh
paru -S ttf-material-design-iconic-font
```

## Fuzzel Setup

Fetch the `fuzzel.ini` file from [caelestia-dots/fuzzel](https://github.com/caelestia-dots/fuzzel) and store it in `~/.config/fuzzel/fuzzel.ini`.

This can be done by the following commands:

```zsh
mkdir -p ~/.config/fuzzel
curl -o "$HOME/.config/fuzzel/fuzzel.ini" "https://raw.githubusercontent.com/caelestia-dots/fuzzel/main/fuzzel.ini"
```

# Scripts

All the scripts are located in `~/.local/bin` which is added to PATH variable in `.zprofile`. Thus, writing the full path of a script in this directory is not needed. e.g. for executing `~/.local/bin/run` the path can be omitted and be directly written as `run`.

# Thank You

These were most of the general configurations I use. Hope you liked them and have a good day!
