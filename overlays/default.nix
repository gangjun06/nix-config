{
  inputs,
  outputs,
}: final: prev:
outputs.recursiveMergeAttrs [
  {
    sbar-lua = prev.callPackage ../pkgs/sbarlua.nix {};
  }
]
