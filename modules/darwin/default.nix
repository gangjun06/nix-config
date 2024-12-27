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
    shell = pkgs.nushell;
    packages = [];
  };

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
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;

  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.home-manager.darwinModules.home-manager
    ./homebrew.nix
    ./system.nix
    ./services
  ];
}
