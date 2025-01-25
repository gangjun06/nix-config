{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  inherit (pkgs.stdenvNoCC.hostPlatform) isDarwin;
  cfg = config.darwin.wallpaper;
in {
  options.darwin.wallpaper = {
    path = mkOption {
      type = types.str;
      default = "";
      description = "Wallpaper path";
    };
  };

  config = mkMerge [
    {
      assertions = [
        {
          assertion = (cfg.path != "") -> isDarwin;
          message = "Nix wallpaper only supports darwin.";
        }
      ];
    }

    (mkIf (cfg.path != "") {
      home.activation.wallpaper = lib.hm.dag.entryAfter ["writeBoundary"] ''
        #! /bin/bash
        echo "Setting wallpaper----------"
        WALLPAPER_PATH=${cfg.path}
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
    })
  ];
}
