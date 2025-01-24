#!/bin/bash

[ -n "$1" ] && termux-clipboard-set "$1" ||
  exit 1
