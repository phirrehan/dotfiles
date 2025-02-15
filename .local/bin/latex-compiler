#!/bin/bash

# Functions
manual() {
  echo "Usage: $0 [OPTIONS] <filename> <page>"
  echo "Options             Functions"
  echo "pdf                 Compile LaTeX to .pdf"
  echo "dvi                 Compile LaTeX to .dvi"
  echo "The <filename> is the name of file placed in the directory $file_dir. <page>
  is the page number to open after compiling the latex document in pdf."
}

compile() {
  [ "$pdf" = "true" ] && pdflatex -output-directory=$pdf_dir $file_path
  [ "$dvi" = "true" ] && latex -output-directory=$dvi_dir $file_path
}

move_residual_files() {
  if [ "$pdf" = "true" ]; then
    [ -f "$pdf_dir/$filename.aux" ] && mv "$pdf_dir/$filename.aux" "$aux_dir"
    [ -f "$pdf_dir/$filename.log" ] && mv "$pdf_dir/$filename.log" "$log_dir"
  elif [ "$dvi" = "true" ]; then
    [ -f "$dvi_dir/$filename.aux" ] && mv "$dvi_dir/$filename.aux" "$aux_dir"
    [ -f "$dvi_dir/$filename.log" ] && mv "$dvi_dir/$filename.log" "$log_dir"
  fi
}

open_pdf() {
  mupdf_pid=$(pgrep mupdf)
  if [ -n $WSL_DISTRO_NAME ] && [ "$pdf" = "true" ]; then
    [ -z "$mupdf_pid" ] && $mupdf_dir/mupdf.exe $pdf_dir/$filename.pdf $page
  elif [ -n $TERMUX_VERSION ]; then
    echo "This script is not supported on Termux." && exit 11
  else
    [ -z "$mupdf_pid" ] && mupdf $pdf_dir/$filename.pdf $page
  fi
}

# Variables
[ "$1" = "pdf" ] && pdf="true" # pdf flag
[ "$1" = "dvi" ] && dvi="true" # dvi flag
[ -z "$3" ] && page="1"        # Set page to 1 by default
[ -n "$3" ] &&                 # Set page if it's provided and it's a number
  [[ "$3" =~ [0-9]+ ]] && page="$3"
file_dir="$HOME/files/latex/tex"   # Default file directroy
pdf_dir="$HOME/files/latex/pdf"    # Default path to directory of pdfs
dvi_dir="$HOME/files/latex/dvi"    # Default path to directory of dvis
aux_dir="$HOME/files/latex/aux"    # Default path to directory of aux
log_dir="$HOME/files/latex/log"    # Default path to directory of log
filename_with_ext=$2               # File name with extension
filename="${filename_with_ext%.*}" # File name without extension
## mupdf on WSL
mupdf_dir="/mnt/c/Users/HP/Downloads/mupdf-1.24.0-windows"
## File extension if provided
[[ "$filename_with_ext" == "*.*" ]] && extension="${filename_with_ext##*.}" ||
  extension="tex"                        # Store default file extension if not provided
file_path=$file_dir/$filename.$extension # File Path

# Check errors
[ $# -eq 0 ] && echo "Error: no arguments provided" && manual && exit 1
[ $# -gt 3 ] && echo "Error: too many arguments provided" && manual && exit 2
[ -z "$page" ] && echo "ERror: Invalid page number provided" && manual && exit 3
[ "$pdf" = "false" ] && [ "$dvi" = "false" ] && echo "Error: no option provided" && manual && exit 4
[ -n "WSL_DISTRO_NAME" ] && [ ! -f "$mupdf_dir/mupdf.exe" ] &&
  echo "mupdf.exe not found in $mupdf_dir. File or directory does not exist." && exit 5
[ ! -d "$file_dir" ] && echo "Error: directory does not exist: $file_dir" &&
  echo "Use mkdir $file_dir command to create it" && exit 6
[ ! -d "$pdf_dir" ] && echo "Error: directory does not exist: $pdf_dir" &&
  echo "Use mkdir $pdf_dir command to create it" && exit 7
[ ! -d "$dvi_dir" ] && echo "Error: directory does not exist: $dvi_dir" &&
  echo "Use mkdir $dvi_dir command to create it" && exit 8
[ -n "$extension" ] && [ "$extension" != "tex" ] &&
  echo "Error: invalid file extension: $extension" && exit 9
[ ! -f "$file_path" ] && echo "Error: file does not exist: $file_path" && exit 10

# Compile and move .aux and .log files to their respective directories
compile
move_residual_files && open_pdf
