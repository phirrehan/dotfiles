#!/bin/bash

# Functions
manual() {
  echo "Usage: $0 [OPTION] <filename>"
  echo "Options             Functions"
  echo "cpp                 Compile code in C++"
  echo "c                   Compile code in C"
}

compile() {
  [ "$cpp" = "true" ] && clang++ --debug $file_path -o $bin_dir/$filename
  [ "$c" = "true" ] && clang --debug $file_path -o $bin_dir/$filename
}

run() {
  [ "$cpp" = "true" ] && $bin_dir/$filename
  [ "$c" = "true" ] && $bin_dir/$filename
}

# Variables
[ "$1" = "cpp" ] && cpp="true"             # cpp flag
[ "$1" = "c" ] && c="true"                 # c flag
file_dir_path="$HOME/files/cprograms/prog" # Default file directroy
bin_dir="$HOME/files/cprograms/bin"        # Directory path of compiled binaries of programs
filename_with_ext=$2                       # File name with extension
filename="${filename_with_ext%.*}"         # File name without extension

## Store file extension if provided
[[ "$filename_with_ext" == "*.*" ]] && extension="${filename_with_ext##*.}"

## Store default file extension if not provided
[ "$cpp" = "true" ] && [ -z "$extension" ] && extension=cpp
[ "$c" = "true" ] && [ -z "$extension" ] && extension=c

## File path
file_path=$file_dir_path/$filename.$extension

# Check errors
[ $# -eq 0 ] && echo "Error: no arguments provided" && manual && exit 1
[ $# -gt 2 ] && echo "Error: too many arguments provided" && manual && exit 2
[ "$cpp" = "false" ] && [ "$c" = "false" ] && echo "Error: no option provided" && manual && exit 3
[ ! -d "$file_dir_path" ] && echo "Error: directory does not exist: $file_dir_path" &&
  echo "Use mkdir $file_dir_path command to create it" && exit 4
[ ! -d "$bin_dir" ] && echo "Error: directory does not exist: $bin_dir" &&
  echo "Use mkdir $bin_dir command to create it" && exit 5
[ ! -f "$file_path" ] && echo "Error: file does not exist: $file_path" && exit 6

## Return error if incorrect extension is provided
[ "$cpp" = "true" ] && [ -n "$extension" ] && [ "$extension" != "cpp" ] &&
  echo "Error: invalid file extension: $extension" && exit 7
[ "$c" = "true" ] && [ -n "$extension" ] && [ "$extension" != "c" ] &&
  echo "Error: invalid file extension: $extension" && exit 8

# Compile and Execute
compile && run
