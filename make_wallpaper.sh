#!/usr/bin/env sh

FILE="$HOME/Documents/repos/wallpapers/$1"
wal -ni "$FILE"
osascript << END
tell application "Finder" to set desktop picture to POSIX file "$FILE"
END
