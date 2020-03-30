#!/usr/bin/env sh

pic=$(basename "$1") # deal with lf passing in whole name
FILE="$PWD/$pic"
wal -i "$FILE"
cp ~/.cache/wal/colors-atom-syntax $HOME/.atom/packages/wal-syntax/styles/colors.less

# osascript << END
# tell application "Finder" to set desktop picture to POSIX file "$FILE"
# END
