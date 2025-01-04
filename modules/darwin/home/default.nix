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

  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    ./sketchybar.nix
    ./wallpaper.nix
    ./hammerspoon.nix
    ./karabiner

    ../../shared/home/btop.nix
    ../../shared/home/shell.nix
    ../../shared/home/spicetify.nix
    ../../shared/home/wezterm.nix
    ../../shared/home/nvim.nix
    ../../shared/home/tmux.nix
    ../../shared/home/ghostty.nix
  ];

  # ----------

  home.packages = with pkgs; [
    # Development
    fnm # node version manager

    # Cli Utils
    wget
    curl

    fortune

    # GUI Apps - Chat
    discord

    # GUI Apps - Study
    # pkgs.anki
    # pkgs.vlc
  ];

  programs.home-manager.enable = true;
  catppuccin.flavor = "mocha";
}
