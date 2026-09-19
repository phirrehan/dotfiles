#!/bin/bash

# variables
read -p "Enter name of password: " passName
[ -z "$passName" ] && exit 1
read -p "Enter length of password: " passLength
[ -z "$passLength" ] && exit 2
if [[ ! "$passLength" =~ ^[0-9]+$ ]]; then
  echo "Error: Expected a (positive) Number"
  read -p "Press enter to exit." && exit 3
fi

# generate password
pass generate "$passName" "$passLength" | sed -n 2p
