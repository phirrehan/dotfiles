# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

Install git using the distribution's package manager. For installing on Arch based system, use:

```
$ sudo pacman -S git
```

### Stow

Similarly to git, install stow using the distribution's package manager. For Arch based system use:

```
$ sudo pacman -S stow
```

## Installation

First, clone the dotfiles repo to $HOME directory and change directory:

```
$ git clone https://github.com/phirrehan/dotfiles.git
$ cd dotfiles
```
then use GNU stow to create symbolic links

```
$ stow .
```
