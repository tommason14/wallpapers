#!/usr/bin/env bash

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
./make_wallpaper.sh ${wallpapers[$choice]}
