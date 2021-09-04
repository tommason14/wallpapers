#!/usr/bin/env zsh
CFG="$HOME"/.config/alacritty/alacritty.yml

# Wal generates a shell script that defines color0..color15
SRC="$HOME"/.cache/wal/colors.sh

# Get hex colors from wal cache
source "$SRC"

# indentation is crucial so that 'pywal' is added 
# to the schemes secton
cat << EOF > newsection.tmp
  pywal: &pywal
    primary:
      background: '$color0'
      foreground: '$color7'
    cursor:
      text:       '$color0'
      cursor:     '$color7'
    normal:
      black:      '$color0'
      red:        '$color1'
      green:      '$color2'
      yellow:     '$color3'
      blue:       '$color4'
      magenta:    '$color5'
      cyan:       '$color6'
      white:      '$color7'
    bright:
      black:      '$color8'
      red:        '$color9'
      green:      '$color10'
      yellow:     '$color11'
      blue:       '$color12'
      magenta:    '$color13'
      cyan:       '$color14'
      white:      '$color15'

EOF

if ! grep -q 'pywal: &pywal' $CFG; then
  echo "pywal scheme not found in $CFG"
  exit 1
fi
gsed '/pywal: &pywal/Q' $CFG > before_colours.tmp
gsed -n '/^colors/,$ p' $CFG > after_colours.tmp                                 
cat before_colours.tmp newsection.tmp after_colours.tmp > ~/.config/alacritty/alacritty.yml
rm *.tmp
