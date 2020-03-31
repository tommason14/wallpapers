#!/usr/bin/env sh

pic=$(basename "$1") # deal with lf passing in whole name
FILE="$PWD/$pic"
wal -i "$FILE"
# atom
cp ~/.cache/wal/colors-atom-syntax $HOME/.atom/packages/wal-syntax/styles/colors.less
# spotify
cp $HOME/.cache/wal/spicetify_colours.ini $HOME/spicetify_data/Themes/pywal/color.ini
sed -i '' 's/\#//' $HOME/spicetify_data/Themes/pywal/color.ini
spicetify update
# yabai
pgrep -q yabai && launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"
