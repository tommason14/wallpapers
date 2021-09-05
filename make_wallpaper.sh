#!/usr/bin/env bash

# pass in options to wal, such as -l for a light scheme, -s to skip
# changing terminal colours etc...

wal -i "$1" "${@:2}"

# spotify
cp $HOME/.cache/wal/spicetify_colours.ini $HOME/spicetify_data/Themes/pywal/color.ini
sed -i '' 's/\#//' $HOME/spicetify_data/Themes/pywal/color.ini
spicetify -q update
# yabai + limelight colour scheme
pgrep -q yabai && launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai" &

# ps aux | grep kitty | grep -qv grep && kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf

$walls/alacritty-colour-export.sh && gsed -i 's/^colors.*/colors: *pywal/' ~/.config/alacritty/alacritty.yml

command -v pywalfox >& /dev/null && pywalfox update
