#!/bin/bash

timetable_dir="$HOME/files/comsats/timetable"
old_pdf_name="$(ls $timetable_dir)"
base_url="https://lahore.comsats.edu.pk"
search_url="$base_url/downloads.aspx"
download_url="$base_url/student" # incomplete as of yet

# Check internet access
ping -c 1 google.com &>/dev/null || {
  echo "Internet is not available."
  exit 1
}

# Get pdf name
pdfname=$(
  curl -sk "$search_url" |
    grep -oP '(?<=/)[^/]+-classes\.pdf' || {
    echo "pdfname search failed :("
    exit 2
  }
)
[ "$pdfname" = "$old_pdf_name" ] && echo "Timetable has not changed." && exit 0 || {
  echo "Timetable has updated. Deleting old pdf..."
  rm "$timetable_dir/$old_pdf_name" 2>/dev/null
}
download_url="$download_url/$pdfname"

# Get pdf through curl
curl_firefox147 -k -o full_timetable.pdf "$download_url" || {
  echo ":( Download failed! Try again."
  exit 3
}

# Get page number
page=$(pdfgrep -n -i 'sp25-bse-a' 'full_timetable.pdf' | cut -d: -f1 | sort -u)

# extract the page from pdf
pdftk 'full_timetable.pdf' cat "$page" output "$pdfname" && rm 'full_timetable.pdf'

# move the timetable.pdf file to a convenient location
mv "$pdfname" "$timetable_dir"
echo "Timetable Successfully updated."
echo "Old Timetable Name: $old_pdf_name"
echo "New Timetable Name: $pdfname"
