{pkgs, ...}: {
  # Other settings - search <sketchybar>

  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    extraPackages = [pkgs.lua];
  };
}
