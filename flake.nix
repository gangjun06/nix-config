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

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,
    nixpkgs,
    catppuccin,
    ...
  } @ inputs: let
    inherit (import ./lib/attrsets.nix {inherit (nixpkgs) lib;}) recursiveMergeAttrs;
    inherit (import ./lib/flake.nix inputs) mkDarwinConfig;
    inherit (import ./lib/meta.nix {}) mkUserConfig;

    forAllSystems = nixpkgs.lib.genAttrs ["aarch64-darwin"];
  in
    recursiveMergeAttrs [
      {
        packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
        overlays.default = import ./overlays {
          inherit inputs;
          outputs = self;
        };
        darwinModules.default = {
          nixpkgs.overlays = [
            (import ./overlays {
              inherit inputs;
              outputs = self;
            })
          ];
        };
        pkgs.sbar-lua = inputs.nixpkgs.legacyPackages.aarch64-darwin.sbar-lua;
      }
      (mkDarwinConfig {
        profile = "kj-default";
        system = "aarch64-darwin";
        userConfig = mkUserConfig {
          username = "gangjun";
          name = "Kangjun Lee";
          email = "me@gangjun.dev";
          home = "/Users/gangjun";
        };
      })
    ];
}
