#!/usr/bin/env bash
# starts up waybar
killall .waybar-wrapped
waybar &

# sets rgb color of all devices to #463cbe at full brithness 
# openrgb -c 463cbe -m static -b 100 
openrgb -p ./nord.orp
