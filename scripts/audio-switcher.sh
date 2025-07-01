#!/usr/bin/env bash

# Show audio sink options
# pactl list short sinks | sed 's/[0-9]*[[:space:]]*alsa_output.//' | sed 's/pci-0000_0.*\.//' | sed 's/PipeWire//' | sed 's/s32le 2ch 48000Hz//' | sed 's/\s.*$//' | fuzzel -d

# Create a list of sinks with pretty names
options=$(pactl -f json list sinks | jq -r '.[] | .description')

# Let the user select a description
selection=$(echo "$options" | fuzzel -d)

# Extract the corresponding sink name
sink_name=$(pactl -f json list sinks | jq -r --arg sink_pretty_name "$selection" '.[] | select(.description == $sink_pretty_name) | .name')

# Set the selected sink as default
pactl set-default-sink "$sink_name" 
