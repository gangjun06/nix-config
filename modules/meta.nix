{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.my-meta;
in {
  options.my-meta = {
    username = mkOption {
      description = "Main username";
      type = types.str;
      default = "gangjun";
    };
    name = mkOption {
      description = "Real name";
      type = types.str;
      default = "Kangjun Lee";
    };
    email = mkOption {
      type = types.str;
      default = "me@gangjun.dev";
    };

    # https://github.com/rayandrew/nix-config/blob/main/modules/meta.nix

    home = mkOption {
      type = types.str;
      default = "/Users/gangjun";
    };

    # Paths
    nixConfigPath = mkOption {
      type = types.str;
      description = "Path to `nixpkgs` directory";
    };

    configDirPath = mkOption {
      type = types.nullOr types.str;
      description = "Path to `.config` directory";
      default = null;
    };

    projectsDirPath = mkOption {
      type = types.nullOr types.str;
      description = "Path to `Projects` directory";
      default = null;
    };
  };
}
