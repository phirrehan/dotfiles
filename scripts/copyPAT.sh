#!/bin/sh

[ -n "$WSL_DISTRO_NAME" ] && clipboard="clip.exe"
[ -n "$TERMUX_VERSION" ] && clipboard="termux-clipboard-set"

pass pat | eval "$clipboard"
