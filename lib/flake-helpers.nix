{
  self,
  flake-utils,
  ...
} @ inputs: let
  inherit (flake-utils.lib) mkApp;
  homeManagerShared = import ./home-manager;
in {
  mkDarwinConfig = {
    profile ? "default",
    system ? "aarch64-darwin",
    userConfig ? {},
  }: {
    darwinConfigurations.${profile} = inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        homeManagerShared
        {
          nixpkgs.overlays = self.overlays;
        }
        (../. + "/hosts/${system}@${profile}")
      ];
      specialArgs = {
        inherit system inputs;
        inherit (self) outputs;
        inherit userConfig;
      };
    };

    apps.${system}."darwinActivations/${profile}" = mkApp {
      drv = system;
      exePath = "/activate";
    };
  };
}
