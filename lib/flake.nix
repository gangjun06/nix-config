{
  self,
  nix-darwin,
  flake-utils,
  ...
} @ inputs: let
  inherit (flake-utils.lib) mkApp;
in {
  mkDarwinConfig = {
    profile ? "default",
    system ? "aarch64-darwin",
    userConfig ? {},
  }: {
    darwinConfigurations.${profile} = nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        (../. + "/hosts/${system}@${profile}")
      ];
      specialArgs = {
        inherit system inputs;
        inherit (self) outputs;
        inherit userConfig;
      };
    };

    apps.${system}."darwinActivations/${profile}" = mkApp {
      drv = self.outputs.darwinConfigurations.${profile}.system;
      exePath = "/activate";
    };
  };
}
