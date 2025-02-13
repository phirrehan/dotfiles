#!/bin/bash

if [ -n "$PREFIX" ]; then
  [ -n "$1" ] && termux-clipboard-set "$1"
  [ -p /dev/stdin ] && cat - | termux-clipboard-set || exit 1
else
  [ -n "$1" ] && wl-copy "$1"
  [ -p /dev/stdin ] && cat - | wl-copy || exit 1
fi
