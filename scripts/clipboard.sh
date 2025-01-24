#!/bin/bash

[ -n "$1" ] && termux-clipboard-set "$1"
[ -p /dev/stdin ] && cat - | termux-clipboard-set || exit 1
