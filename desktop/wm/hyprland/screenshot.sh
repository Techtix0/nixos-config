#!/usr/bin/env bash
location=/home/"$(whoami)"/Pictures/screenshots/"$(date +%Y%m%d-%H%M%S)".png
grim -g "$(slurp)" $location

wl-copy < $location

