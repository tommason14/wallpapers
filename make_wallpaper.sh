#!/bin/bash

pic=$(basename "$1") # deal with lf passing in whole name
FILE="$PWD/$pic"

# if a light colourscheme is desired, pass in a '-l', but need the space as 
# filenames cam be ...-l....
[[ "$@" == *" -l"* ]] && light=true || light=false

if [[ "$light" == "true" ]] 
then
  wal -i "$FILE" -l
else
  wal -i "$FILE" 
fi
# passing in $light have errors, so can't have wal -i "$FILE" "$light"

# atom
cp ~/.cache/wal/colors-atom-syntax $HOME/.atom/packages/wal-syntax/styles/colors.less
# spotify
cp $HOME/.cache/wal/spicetify_colours.ini $HOME/spicetify_data/Themes/pywal/color.ini
sed -i '' 's/\#//' $HOME/spicetify_data/Themes/pywal/color.ini
spicetify update
# yabai
pgrep -q yabai && launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"
