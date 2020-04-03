#!/bin/bash

cd ~/Documents/repos/wallpapers
wallpapers=($(ls *.{png,jpg}))
range=${#wallpapers[@]}

get_choice(){
  option=$(( $RANDOM % $range ))
  # if random is already chosen, pick again
  if grep -q "${wallpapers[$option]}" $HOME/.cache/wal/wal
  then
    option=$(get_choice)
  fi
  echo $option
}

choice=$(get_choice)
# if -l given for a light wallpaper, then needs passing on
./make_wallpaper.sh ${wallpapers[$choice]} "$@"
