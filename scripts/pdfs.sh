#!/bin/bash

# Set pdfviewer as mupdf
PDFVIEWER=mupdf

# Check for -d flag
if [ "$1" = "-d" ];then
  [ -d "$2" ] &&
  pdfsDir="$2" || {
  echo "Invalid path to directory"
  exit 1
}
fi

# Replace ~ with $HOME if present in pdfsDir
[ "$(echo $pdfsDir | cut -c 1)" = "~" ] &&
  pdfsDir=$(echo $pdfsDir |
    sed "s|~|$HOME|")

# Termux specific command
[ -n "$PREFIX" ] && termux-open $pdfsDir/$(find $pdfsDir -type f -name "*.pdf" |
  sed 's|.*/||' |
  fzf --pointer '=>' --header 'Select a PDF' --layout reverse --info hidden --preview "pdftotext -f 1 -l 5 $pdfsDir/{} - 2> /dev/null" --preview-window=wrap,border-sharp)

# Linux specific command
command -v $PDFVIEWER &>/dev/null || {
  sudo pacman -Sy 
sudo pacman -S $PDFVIEWER
}
[ -n $PREFIX ] && mupdf $pdfsDir/$(find $pdfsDir -type f -name "*.pdf" |
  sed 's|.*/||' |
  fzf --pointer '=>' --header 'Select a PDF' --layout reverse --info hidden --preview "pdftotext -f 1 -l 5 $pdfsDir/{} - 2> /dev/null" --preview-window=wrap,border-sharp)
