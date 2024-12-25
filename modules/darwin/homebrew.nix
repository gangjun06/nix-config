{flake, ...}: {
  imports = [
    flake.inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  homebrew = {
    enable = true;
  };
}
