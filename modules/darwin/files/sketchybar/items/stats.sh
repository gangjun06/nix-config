#!/bin/bash

disk=(
	background.padding_left=0
	label.font="$FONT:Heavy:12"
	label.color="$WHITE"
	icon="$DISK"
	icon.color="$MAROON"
	update_freq=60
	script="$PLUGIN_DIR/disk.sh"
)

sketchybar --add item disk right \
	--set disk "${disk[@]}"

memory=(
	background.padding_left=0
	label.font="$FONT:Heavy:12"
	label.color="$WHITE"
	icon="$MEMORY"
	icon.font="$FONT:Bold:16.0"
	icon.color="$GREEN"
	update_freq=15
	script="$PLUGIN_DIR/ram.sh"
)

sketchybar --add item memory right \
	--set memory "${memory[@]}"

network_down=(
	y_offset=-7
	label.font="$FONT:Heavy:10"
	label.color="$WHITE"
	icon="$NETWORK_DOWN"
	icon.font="$NERD_FONT:Bold:16.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	update_freq=1
)

network_up=(
	background.padding_right=-70
	y_offset=7
	label.font="$FONT:Heavy:10"
	label.color="$WHITE"
	icon="$NETWORK_UP"
	icon.font="$NERD_FONT:Bold:16.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	update_freq=1
	script="$PLUGIN_DIR/network.sh"
)

sketchybar 	--add item network.down right 						\
						--set network.down "${network_down[@]}" 	\
						--add item network.up right 							\
						--set network.up "${network_up[@]}"

