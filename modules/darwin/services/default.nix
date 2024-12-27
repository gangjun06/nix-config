{pkgs, ...}: {
  # <sketchybar>
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
    extraPackages = [pkgs.lua];
  };
  # </sketchybar>

  imports = [
    ./yabai.nix
    ./skhd.nix
  ];
}
