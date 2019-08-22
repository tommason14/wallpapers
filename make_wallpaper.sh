#!/usr/bin/env sh

if [[ $USER == "tommason" ]]
then
  /usr/local/bin/wal -i "$1"
else
  FILE="~/Documents/repos/wallpapers/$1"
  /usr/bin/local/wal -ni "$FILE"
  /usr/bin/osascript << END
  tell application "Finder" to set desktop picture to POSIX file "${FILE}"
END
fi
