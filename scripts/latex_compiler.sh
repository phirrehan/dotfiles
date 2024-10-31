#!/bin/bash

# Functions
manual() {
  echo "Usage: $0 [OPTIONS] <filename>"
  echo "Options             Functions"
  echo "pdf                 Compile LaTeX to .pdf"
  echo "dvi                 Compile LaTeX to .dvi"
}

compile() {
  [ "$pdf" = "true" ] && pdflatex -output-directory=$pdf_dir $file_path
  [ "$dvi" = "true" ] && latex -output-directory=$dvi_dir $file_path
}

move() {
  [ "$pdf" = "true" ] && [ -f "$aux_dir/$filename.aux" ] && mv "$pdf_dir/$filename.aux" "$aux_dir"
  [ "$pdf" = "true" ] && [ -f "$log_dir/$filename.log" ] && mv "$pdf_dir/$filename.log" "$log_dir"
  [ "$dvi" = "true" ] && [ -f "$aux_dir/$filename.aux" ] && mv "$dvi_dir/$filename.aux" "$aux_dir"
  [ "$dvi" = "true" ] && [ -f "$log_dir/$filename.log" ] && mv "$dvi_dir/$filename.log" "$log_dir"
}

# Variables
[ "$1" = "pdf" ] && pdf="true"     # pdf flag
[ "$1" = "dvi" ] && dvi="true"     # dvi flag
file_dir="$HOME/files/latex/tex"   # Default file directroy
pdf_dir="$HOME/files/latex/pdf"    # Default path to directory of pdfs
dvi_dir="$HOME/files/latex/dvi"    # Default path to directory of dvis
aux_dir="$HOME/files/latex/aux"    # Default path to directory of aux
log_dir="$HOME/files/latex/log"    # Default path to directory of log
filename_with_ext=$2               # File name with extension
filename="${filename_with_ext%.*}" # File name without extension

## File extension if provided
[[ "$filename_with_ext" == "*.*" ]] && extension="${filename_with_ext##*.}" ||
  extension="tex"                        # Store default file extension if not provided
file_path=$file_dir/$filename.$extension # File Path

# Check options and set flags accordingly
set_flags

# Check errors
[ $# -eq 0 ] && echo "Error: no arguments provided" && manual && exit 1
[ $# -gt 2 ] && echo "Error: too many arguments provided" && manual && exit 2
[ "$pdf" = "false" ] && [ "$dvi" = "false" ] && echo "Error: no option provided" && manual && exit 3
[ ! -d "$file_dir" ] && echo "Error: directory does not exist: $file_dir" &&
  echo "Use mkdir $file_dir command to create it" && exit 4
[ ! -d "$pdf_dir" ] && echo "Error: directory does not exist: $pdf_dir" &&
  echo "Use mkdir $pdf_dir command to create it" && exit 5
[ ! -d "$dvi_dir" ] && echo "Error: directory does not exist: $dvi_dir" &&
  echo "Use mkdir $dvi_dir command to create it" && exit 6
[ -n "$extension" ] && [ "$extension" != "tex" ] &&
  echo "Error: invalid file extension: $extension" && exit 7
[ ! -f "$file_path" ] && echo "Error: file does not exist: $file_path" && exit 8

# Compile and move .aux and .log files to their respective directories
compile
move
