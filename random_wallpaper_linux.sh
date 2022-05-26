#!/usr/bin/env bash

DIR="$(dirname $0)"
cd $DIR
wallpapers=($(ls *.{png,jpg,jpeg}))
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
wal -i $DIR/${wallpapers[$choice]} "$@"
