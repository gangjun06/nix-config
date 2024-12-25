{config, ...}: let
  inherit (config.my-meta) username;
in {
  homebrew = {
    enable = true;
  };

  nix-homebrew = {
    enable = true;
    user = username;
    autoMigrate = true;
    #enableRosetta = true;
  };
}
