{
  pkgs,
  userConfig,
  inputs,
  ...
}: let
  inherit (userConfig) username home;
  # username = "gangjun";
  # home = "/Users/gangjun";
in {
  home.username = username;
  home.homeDirectory = home;

  home.stateVersion = "24.11";

  home.packages = [
    # <sketchybar>
    pkgs.sketchybar-app-font
    # </sketchybar>

    # Cli Utils
    pkgs.wget
    pkgs.curl

    pkgs.fortune

    # GUI Apps - Chat
    pkgs.discord

    # GUI Apps - Study
    # pkgs.anki
    # pkgs.vlc

    # <sketchybar>
    pkgs.sbar-lua
    # </sketchybar>
  ];

  programs.home-manager.enable = true;

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ./services/sketchybar-home.nix

    ../shared/programs/btop.nix
    ../shared/programs/shell.nix
    ../shared/programs/spicetify.nix
    ../shared/programs/wezterm.nix
  ];

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  xdg.enable = true;
}
