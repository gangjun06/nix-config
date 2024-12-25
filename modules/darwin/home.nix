{
  config,
  lib,
  pkgs,
  flake,
  system,
  ...
}: let
  inherit (config.my-meta) username home;
in {
  home.username = username;
  home.homeDirectory = home;

  home.stateVersion = "24.11";

  home.packages = [
    # Cli Utils
    pkgs.htop
    pkgs.fortune

    # Development
    pkgs.wezterm

    # GUI Apps - Chat
    pkgs.discord
  ];

  programs.home-manager.enable = true;

  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  home.file = {
    ".config/nushell" = {
      source = ./../shared/files/nushell;
      recursive = true;
    };

    ".config/sketchybar" = {
      source = ./files/sketchybar;
      recursive = true;
    };

    ".config/wezterm" = {
      source = ./files/wezterm;
      recursive = true;
    };
  };
}
