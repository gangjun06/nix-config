{...} @ inputs: final: prev: {
  wallpaper = prev.callPackage ../pkgs/wallpaper.nix {};

  sbar-lua = prev.callPackage ../pkgs/darwin/sbarlua.nix {};
}
