{
  userConfig,
  config,
  ...
}: let
  inherit (userConfig) username;
in {
  nix-homebrew = {
    enable = true;
    user = username;
    autoMigrate = true;
    #enableRosetta = true;
  };

  homebrew = {
    enable = true;

    casks = [
      "lookaway"
      "kicad" # cad app
    ];
  };
}
