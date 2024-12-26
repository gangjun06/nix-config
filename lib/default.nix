{nixpkgs, ...} @ inputs:
import ./attrsets.nix {inherit (nixpkgs) lib;}
// import ./flake-helpers.nix inputs
// import ./meta.nix {}
