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
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nix-homebrew,
    nixpkgs,
    home-manager,
  }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake ~/nix#kj-default
    darwinConfigurations."kj-default" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            user = "gangjun";
            autoMigrate = true;
            #enableRosetta = true;
          };
        }
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            verbose = true;
            users.gangjun = import ./modules/darwin/home.nix;
          };
        }
        ./modules/shared/config
        ./modules/darwin/config.nix
      ];
      specialArgs = {inherit inputs;};
    };
  };
}
