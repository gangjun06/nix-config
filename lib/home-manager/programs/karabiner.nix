{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  inherit (pkgs.stdenvNoCC.hostPlatform) isDarwin;
  cfg = config.services.karabiner;

  # A helper to ensure a value is a function
  mustBeFunction = val:
    if builtins.isFunction val
    then true
    else throw "Option ‘functionOption’ must be a function, got: ${val}";

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

  loadedConfig = cfg.config karabiner-lib;
in {
  # Make sure install karabiner-elements from homebrew

  options.services.karabiner = {
    enable = mkEnableOption "karabiner";

    config = mkOption {
      type =
        types.anything
        // {
          check = mustBeFunction;
        };
      default = {...}: {};
      description = "Karabiner config";
    };
  };

  config = mkMerge [
    {
      assertions = [
        {
          assertion = cfg.enable -> isDarwin;
          message = "Nix homerow only supports darwin.";
        }
      ];
    }

    (mkIf cfg.enable {
      home.file = builtins.foldl' (acc: name:
        acc
        // {
          ".config/karabiner/assets/complex_modifications/${name}.json".text = builtins.toJSON (loadedConfig.${name});
        }) {} (builtins.attrNames loadedConfig);
      # debug = (cfg.config karabiner-lib).hyper;
      # debug = "hellop";
    })
  ];
}
