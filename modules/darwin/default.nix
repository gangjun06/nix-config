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
  users.users.${username} = {
    name = username;
    home = home;
    isHidden = false;
    shell = pkgs.nushell;
  };

  imports = [
    ../meta.nix

    flake.inputs.nix-homebrew.darwinModules.nix-homebrew
    flake.inputs.home-manager.darwinModules.home-manager
    ./system.nix

    # ./services/yabai.nix
    # ./services/skhd.nix
    # ./services/sketchybar.nix

    # ../shared/programs/shell.nix
  ];

  nix-homebrew = {
    enable = true;
    user = username;
    autoMigrate = true;
    #enableRosetta = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    verbose = true;
    users.${username} = import ./home.nix;

    extraSpecialArgs = {
      inherit flake system config;
    };
  };

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.vim
  ];

  fonts.packages = with pkgs; [
    cascadia-code
    nerd-fonts.jetbrains-mono
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults.CustomUserPreferences = {
    "com.apple.WindowManager" = {
      EnableTiledWindowMargins = false;
      EnableTilingByEdgeDrag = false;
      EnableTilingOptionAccelerator = false;
      EnableTopTilingByEdgeDrag = false;
    };
  };
}
