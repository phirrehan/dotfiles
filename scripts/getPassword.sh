#!/bin/bash

password_dir="$HOME/files/privateFiles/.password-store"

pass ls
echo -en "\nEnter a name of password to fetch: "
read password_name

# Check if password exists
[ ! -f $password_dir/$password_name.gpg ] && echo "$password_name does not exist." && exit 1

# Termux specific command
[ -n "$TERMUX_VERSION" ] && pass "$password_name" | termux-clipboard-set && exit 0

# WSL specific command
[ -n "$WSL_DISTRO_NAME" ] && pass "$password_name" | clip.exe && exit 0
echo ""
