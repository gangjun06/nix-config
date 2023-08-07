#!/bin/bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

sketchybar  --add   event spotify_change $SPOTIFY_EVENT \
            --add   item spotify center \
            --set   spotify \
                      icon= \
                    	icon.font="JetBrainsMono Nerd Font:Bold:20.0" \
                      label.font="JetBrainsMono Nerd Font:Regular:16.0" \
                      label.color=$WHITE \
                      icon.color=$GREEN \
                    	icon.y_offset=1 \
                      label.drawing=off \
                    	icon.padding_left=14 \
                      label.padding_right=14 \
                      padding_top=10 \
                      padding_bottom=10 \
                      blur_radius=12 \
                      script="$PLUGIN_DIR/spotify.sh" \
                      background.color=$BACKGROUND_2 \
                      associated_display=3 \
            --subscribe spotify spotify_change mouse.clicked          --set spotify.controls "${spotify_controls[@]}"       \
