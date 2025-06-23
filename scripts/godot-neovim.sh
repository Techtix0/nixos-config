#!/usr/bin/env bash

# This script lets godot use neovim as an external editor

# Change the following options in godot to use this script:
#	editor settings -> general -> text editor -> external
#	Exec path = /home/<username>/.dotfiles/scripts/godot-neovim.sh
#	Exec flags = {file}
#	Use external editor = true
# editor settings -> text editor -> behaviour
# auto reload scripts on external change = true

if [ ! -e "/tmp/godot.pipe" ]; then
	# Start server if not running already
	kitty nvim --listen /tmp/godot.pipe
fi
# Pass the required file to load in nvim	
nvim --server /tmp/godot.pipe --remote-send "<C-\><C-N>:e $1<CR>" 
