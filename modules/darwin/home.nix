{pkgs, ...}: let
  user = "gangjun";
in {
  home.username = user;
  home.homeDirectory = "/Users/${user}";

  home.stateVersion = "24.11";

  home.packages = [
    # Cli Utils
    pkgs.htop
    pkgs.fortune

    # Development
    pkgs.wezterm

    # GUI Apps - Chat
    pkgs.discord
  ];

  programs.home-manager.enable = true;

  programs.htop.enable = true;
  programs.htop.settings.show_program_path = true;

  imports = [
    ./../shared/programs/shell.nix
  ];

  home.file = {
    ".config/nushell" = {
      source = ./../shared/files/nushell;
      recursive = true;
    };

    ".config/sketchybar" = {
      source = ./files/sketchybar;
      recursive = true;
    };

    ".config/wezterm" = {
      source = ./files/wezterm;
      recursive = true;
    };
  };
}
