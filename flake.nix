{
  # https://github.com/dustinlyons/nixos-config/blob/main/templates/starter/flake.nix
  description = "Kangjun Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # setups
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (import ./lib/attrsets.nix {inherit (nixpkgs) lib;}) recursiveMergeAttrs;
    inherit (import ./lib/flake.nix inputs) mkDarwinConfig;
  in
    recursiveMergeAttrs [
      (mkDarwinConfig {
        username = "gangjun";
        profile = "kj-default";
        system = "aarch64-darwin";
      })
    ];
}
