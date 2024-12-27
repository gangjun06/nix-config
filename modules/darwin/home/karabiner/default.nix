{
  outputs,
  pkgs,
  ...
}: let
  karabiner-lib = {
    wrapAsList = {...} @ args: [args];
    mkBasicRule = description: manipulators: {
      description = description;
      manipulators = manipulators;
    };

    mkManipulator = {to ? [], ...} @ args:
      {
        type = "basic";
      }
      // args;
  };

  imported-karabiner-config = outputs.lib.recursiveMergeAttrs [
    (import ./config-hyper.nix {inherit karabiner-lib;})
    (import ./config-qmk.nix {inherit karabiner-lib;})
    (import ./config-wm.nix {inherit karabiner-lib pkgs;})
  ];
  inherit (imported-karabiner-config) karabiner-config;
in {
  # <karabiner-elements />

  home.file = builtins.foldl' (acc: name:
    acc
    // {
      ".config/karabiner/assets/complex_modifications/${name}.json".text = builtins.toJSON (karabiner-config.${name});
    }) {} (builtins.attrNames karabiner-config);
}
