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
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  users.users.${username} = {
    name = username;
    home = home;
    isHidden = false;
    shell = pkgs.nushell;
    packages = [];
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    # pkgs.vim
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    verbose = true;
    users.${config.my-meta.username} = import ./home.nix config;
  };

  fonts.packages = with pkgs; [
    cascadia-code
    nerd-fonts.jetbrains-mono
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;

  imports = [
    flake.inputs.nix-homebrew.darwinModules.nix-homebrew
    flake.inputs.home-manager.darwinModules.home-manager
    ../meta.nix

    ./homebrew.nix
    ./system.nix

    ./services/yabai.nix
    # ./services/skhd.nix
    # ./services/sketchybar.nix
  ];
}
