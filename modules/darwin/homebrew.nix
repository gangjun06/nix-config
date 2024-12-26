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

      # <sketchybar>
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "switchaudio-osx"
      "nowplaying-cli"
      # </sketchybar>
    ];
  };
}
