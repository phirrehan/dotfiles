#!/bin/sh

# Variables
password_dir="$HOME/files/privateFiles/.password-store"
[ $# -eq 1 ] && password_name="$1"
[ $# -eq 0 ] && pass ls && echo "\nEnter a name of password to fetch: " && read password_name

# Check for errors
## Check if arguments are greater than 1
[ $# -gt 1 ] && echo "Too many arguments provided. Usage $0 <password_name>" && exit 1

## Check if password exists
[ ! -f "$password_dir/$password_name.gpg" ] && echo "$password_name does not exist." && exit 2

# Copy password to clipboard on various environments
## Termux specific command
[ -n "$TERMUX_VERSION" ] && pass "$password_name" | termux-clipboard-set

## WSL specific command
[ -n "$WSL_DISTRO_NAME" ] && pass "$password_name" | clip.exe

# Add a new line at the end of script
echo ""
