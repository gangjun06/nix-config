{
  pkgs,
  lib,
  ...
}: {
  home.activation = {
    wallpaper = lib.hm.dag.entryAfter ["writeBoundary"] ''
      #! /bin/bash
      echo "Setting wallpaper----------"
      # WALLPAPER_PATH=${pkgs.wallpaper}/wallpapers/vibrant-gate.png
      WALLPAPER_PATH=${pkgs.wallpaper}/wallpapers/black-hole.png
      CURRENT_WALLPAPER=$(/usr/local/bin/desktoppr | head -n 1)

      if [ "$CURRENT_WALLPAPER" != "$WALLPAPER_PATH" ]; then
        echo "Setting wallpaper----------"
        spaces=$(${pkgs.yabai}/bin/yabai -m query --spaces)
        length=$(echo $spaces | jq '. | length')
        for (( i=0; i<$length; i++ )); do
          index=$(echo $spaces | jq ".[$i].index")
          ${pkgs.yabai}/bin/yabai -m space --focus $index
          sleep 0.3
          /usr/local/bin/desktoppr all $WALLPAPER_PATH
          sleep 0.3
        done
      fi
    '';
  };
}
