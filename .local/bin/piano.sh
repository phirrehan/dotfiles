#!/bin/bash

cd "$HOME/files/github/Piano"
cmake -B build && cmake --build build && ./build/bin/main
