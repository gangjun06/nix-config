{pkgs, ...}: {
  xdg.configFile."sketchybar" = {
    source = ../files/sketchybar;
    recursive = true;
    onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
  };
  xdg.dataFile."sketchybar_lua/sketchybar.so" = {
    source = "${pkgs.sbar-lua}/lib/sketchybar.so";
    onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
  };
  xdg.configFile."sketchybar/sketchybarrc" = {
    text = ''
      #!/usr/bin/env ${pkgs.lua}/bin/lua

      -- Load the sketchybar-package and prepare the helper binaries
      require("helpers")
      require("init")
    '';
    executable = true;
    onChange = "${pkgs.sketchybar}/bin/sketchybar --reload";
  };
}
