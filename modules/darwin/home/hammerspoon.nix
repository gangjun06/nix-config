{pkgs, ...}: {
  home.packages = with pkgs; [
    hammerspoon
    stackline
  ];

  #  <yabai> <stackline>
  home.file.".hammerspoon/stackline" = {
    source = builtins.toPath (pkgs.stackline + "/source");
    recursive = true;
  };
  home.file.".hammerspoon/init.lua".text = ''
    stackline = require "stackline"
    stackline:init({
        paths = {
            yabai = "${pkgs.yabai}/bin/yabai"
        },
    })

    stackline.config:set('appearance.showIcons', true)
    -- stackline.config:set('appearance.color', { red=0.094, green=0.086, blue=0.137 })
    stackline.config:set('appearance.color', { red=0.72, green=0.58, blue=0.87 })
    stackline.config:set('features.clickToFocus', false)
  '';
  # <yabai> <stackline>
}
