#!/usr/bin/env sh

pic=$(basename "$1") # deal with lf passing in whole name
FILE="$PWD/$pic"
wal -i "$FILE"

# osascript << END
# tell application "Finder" to set desktop picture to POSIX file "$FILE"
# END
