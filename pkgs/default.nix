# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{pkgs, ...}: {
  sbar-lua = pkgs.callPackage ../pkgs/sbarlua.nix {};
}
