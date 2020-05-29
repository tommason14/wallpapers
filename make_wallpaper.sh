#!/bin/bash

pic=$(basename "$1") # deal with lf passing in whole name
FILE="$PWD/$pic"

# pass in options to wal, such as -l for a light scheme, -s to skip
# changing terminal colours etc...

wal -i "$FILE" "${@:2}"

# atom
cp ~/.cache/wal/colors-atom-syntax $HOME/.atom/packages/wal-syntax/styles/colors.less
# spotify
cp $HOME/.cache/wal/spicetify_colours.ini $HOME/spicetify_data/Themes/pywal/color.ini
sed -i '' 's/\#//' $HOME/spicetify_data/Themes/pywal/color.ini
spicetify update
# yabai
pgrep -q yabai && launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"
# if using pecan Übersicht bar:
[[ $USER == "tommason" ]] && /Users/tommason/Library/Application\ Support/Übersicht/widgets/pecan/wal-set
