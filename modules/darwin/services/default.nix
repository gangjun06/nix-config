{pkgs, ...}: {
  # <sketchybar>
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
  };
  # </sketchybar>

  imports = [
    ./yabai.nix
    ./skhd.nix
  ];
}
