#!/usr/bin/env bash

# pic=$(basename "$1") # deal with lf passing in whole name
# FILE="$PWD/$pic"

# pass in options to wal, such as -l for a light scheme, -s to skip
# changing terminal colours etc...

wal -i "$1" "${@:2}"

# atom
cp ~/.cache/wal/colors-atom-syntax $HOME/.atom/packages/wal-syntax/styles/colors.less
# spotify
cp $HOME/.cache/wal/spicetify_colours.ini $HOME/spicetify_data/Themes/pywal/color.ini
sed -i '' 's/\#//' $HOME/spicetify_data/Themes/pywal/color.ini
spicetify -q update
command -v pywalfox && pywalfox update
# yabai + bar
pgrep -q yabai && launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai" &
pgrep -q spacebar && launchctl kickstart -k "gui/${UID}/homebrew.mxcl.spacebar" &

kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf

# spacebar looks odd with white bg, so if -l passed in, write to some file that
# it was, and switch the colours in spacebarrc

[[ "${@:2}" =~ (-l|-[a-z]l) ]] && echo "light" > ~/.cache/wal/scheme_colours ||
echo "dark" > ~/.cache/wal/scheme_colours
