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
    ./hammerspoon.nix
    ./karabiner
    ./zen-browser.nix

    ../../shared/home/btop.nix
    ../../shared/home/shell.nix
    ../../shared/home/spicetify.nix
    ../../shared/home/wezterm.nix
    ../../shared/home/nvim.nix
    ../../shared/home/tmux.nix
    ../../shared/home/ghostty.nix
  ];

  # ----------

  darwin.wallpaper.path = "${pkgs.wallpaper}/wallpapers/black-hole.png";

  home.packages = with pkgs; [
    # Development
    fnm # node version manager

    # Cli Utils
    wget
    curl

    fortune

    direnv

    act # Run github actions locally

    # GUI Apps - Chat
    discord

    # GUI Apps - Study
    # pkgs.anki
    # pkgs.vlc
    fastlane

    figlet
    lolcat

    gitify
  ];

  programs.home-manager.enable = true;
  catppuccin.flavor = "mocha";
}
