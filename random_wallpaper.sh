#!/usr/bin/env bash

cd ~/Documents/repos/wallpapers
wallpapers=($(ls *.{png,jpg}))
range=${#wallpapers[@]}
option=$(( $RANDOM % $range ))
./make_wallpaper.sh ${wallpapers[$option]}
