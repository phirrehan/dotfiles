#!/bin/bash

path="~/files/cprograms/"

tmux new-session -s C++ -n IDE "cd $path && nvim"
