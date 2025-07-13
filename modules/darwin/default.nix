{
  userConfig,
  config,
  inputs,
  lib,
  pkgs,
  packages,
  system,
  nixpkgs,
  outputs,
  ...
}: let
  inherit (userConfig) username home;
in {
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  users.users.${username} = {
    name = username;
    home = home;
    isHidden = false;
    shell = pkgs.fish;
    packages = [];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableFastSyntaxHighlighting = true;
    enableFzfHistory = true;
    enableFzfCompletion = true;
  };
  programs.fish.enable = true;

  environment.shells = with pkgs; [zsh fish];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    verbose = true;
    users.${username} = import ./home;
    extraSpecialArgs = {
      inherit inputs userConfig outputs;
    };
  };

  fonts.packages = with pkgs; [
    cascadia-code
    nerd-fonts.jetbrains-mono
    pretendard
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.home-manager.darwinModules.home-manager
    ./homebrew.nix
    ./system.nix
    ./services
  ];
}
