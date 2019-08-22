#!/usr/bin/env sh

if [[ $USER == "tommason" ]]
then
  wal -i "$1"
else
  FILE="$HOME/Documents/repos/wallpapers/$1"
  wal -ni "$FILE"
  osascript << END
  tell application "Finder" to set desktop picture to POSIX file "$FILE"
END
fi
