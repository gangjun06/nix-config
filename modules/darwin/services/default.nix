{
  pkgs,
  userConfig,
  ...
}: {
  # <sketchybar>
  services.sketchybar = {
    enable = true;
    package = pkgs.sketchybar;
  };
  launchd.user.agents.sketchybar.serviceConfig.StandardErrorPath = builtins.toPath "${userConfig.home}/.nix-log/sketchybar.error.log";
  launchd.user.agents.sketchybar.serviceConfig.StandardOutPath = builtins.toPath "${userConfig.home}/.nix-log/sketchybar.log";

  # </sketchybar>

  imports = [
    ./yabai.nix
    ./skhd.nix
  ];
}
