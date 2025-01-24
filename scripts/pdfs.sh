#!/bin/bash

[ "$1" = "-d" ] && [ -n "$2" ] &&
  pdfsDir="$2" || {
  echo "Invalid path to directory"
  exit 1
}

[ "$(echo $pdfsDir | cut -c 1)" = "~" ] &&
  pdfsDir=$(echo $pdfsDir |
    sed "s|~|$HOME|")

termux-open $pdfsDir/$(find $pdfsDir -type f -name "*.pdf" |
  sed 's|.*/||' |
  fzf --pointer '=>' --header 'Select a PDF' --layout reverse --info hidden --preview "pdftotext -f 1 -l 5 $pdfsDir/{} - 2> /dev/null" --preview-window=wrap,border-sharp)
