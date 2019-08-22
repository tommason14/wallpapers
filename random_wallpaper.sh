#!/usr/bin/env bash

cd ~/Documents/repos/wallpapers
wallpapers=($(ls | grep -v '\.sh'))
range=${#wallpapers[@]}
option=$(( $RANDOM % $range ))
./make_wallpaper.sh ${wallpapers[$option]}
