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
    # Cli Utils
    pkgs.wget
    pkgs.curl

    pkgs.fortune

    # GUI Apps - Chat
    pkgs.discord

    # GUI Apps - Study
    # pkgs.anki
    # pkgs.vlc
  ];

  programs.home-manager.enable = true;

  home.file = {
    # ".config/sketchybar" = {
    #   source = ./files/sketchybar;
    #   recursive = true;
    # };
  };

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ../shared/programs/btop.nix
    ../shared/programs/shell.nix
    ../shared/programs/spicetify.nix
    ../shared/programs/wezterm.nix
  ];
}
