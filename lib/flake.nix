# Shamelessly copied from https://github.com/thiagokokada/nix-configs/blob/master/lib/flake.nix
{
  self,
  nix-darwin,
  flake-utils,
  ...
} @ inputs: let
  inherit (flake-utils.lib) eachDefaultSystem mkApp;
in {
  mkDarwinConfig = {
    username,
    profile ? "default",
    system ? "aarch64-darwin",
    darwinSystem ? nix-darwin.lib.darwinSystem,
    extraModules ? [],
  }: {
    darwinConfigurations.${profile} = darwinSystem {
      inherit system;
      modules =
        [
          inputs.nix-homebrew.darwinModules.nix-homebrew
          inputs.home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              verbose = true;
              users."gangjun" = import ../modules/darwin/home.nix;

              # extraSpecialArgs = {
              #   config = {
              #     my-meta = {
              #       username = "gangjun";
              #       home = "/Users/gangjun";
              #     };
              #   };
              # };
            };
          }
          (../. + "/hosts/${system}@${profile}")
        ]
        ++ extraModules;
      specialArgs = {
        inherit system;
        flake = self;
      };
    };

    apps.${system}."darwinActivations/${profile}" = mkApp {
      drv = self.outputs.darwinConfigurations.${profile}.system;
      exePath = "/activate";
    };
  };
}
