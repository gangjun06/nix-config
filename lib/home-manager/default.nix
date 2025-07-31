{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  home-manager.sharedModules = [
    # home-manager-secrets (nix flake input)
    # inputs.home-manager-secrets.homeManagerModules.home-manager-secrets
    ./config.nix

    # local programs (local)
    ./programs/defaults.nix
    ./programs/homerow.nix
    ./programs/wallpaper.nix
    ./programs/karabiner.nix
  ];
}
