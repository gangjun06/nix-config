{
  self,
  pkgs,
  ...
}: rec {
  users.users.gangjun = {
    name = "gangjun";
    home = "/Users/gangjun";
    isHidden = false;
    shell = pkgs.nushell;
  };

  imports = [
    ./services/yabai.nix
    ./services/skhd.nix
    ./services/sketchybar.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.vim
  ];

  fonts.packages = with pkgs; [
    cascadia-code
    nerd-fonts.jetbrains-mono
  ];

  homebrew = {
    enable = true;
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  system.defaults.CustomUserPreferences = {
    "com.apple.WindowManager" = {
      EnableTiledWindowMargins = false;
      EnableTilingByEdgeDrag = false;
      EnableTilingOptionAccelerator = false;
      EnableTopTilingByEdgeDrag = false;
    };
  };

  system.defaults = {
    NSGlobalDomain = {
      # Whether to enable “Natural” scrolling direction
      "com.apple.swipescrolldirection" = false;
    };

    finder = {
      AppleShowAllFiles = true; # show hidden files
      CreateDesktop = false; # show icons on desktop
      FXPreferredViewStyle = "Nlsv"; # Change the default finder view. “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View The default is icnv.
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    # Dock
    dock = {
      autohide = true;
      autohide-time-modifier = 0.0;
      expose-animation-duration = 0.0;
      expose-group-apps = false;
      tilesize = 24;
      largesize = 79;
      launchanim = true;
      magnification = false;
      mineffect = "genie";
      orientation = "bottom";
      minimize-to-application = false;
      mouse-over-hilite-stack = false;
      mru-spaces = false;
      show-process-indicators = true;
      scroll-to-open = true;

      persistent-apps = [
        "/Applications/Arc.app"
        "/Applications/KakaoTalk.app"
        "/Applications/OBS.app"
        "/Applications/Setapp/Paw.app"
        "/Applications/Setapp/TablePlus.app"
        "/Applications/Termius.app"
        "/Applications/Spotify.app"
        "/Applications/iTerm.app"
        "/Applications/Visual Studio Code.app"
        "/Applications/Obsidian.app"
        "/System/Applications/Calendar.app"
        "/Applications/Linear.app"
        "/Applications/Discord.app"
        "/Applications/Slack.app"
        "/Applications/Akiflow.app"
        "/Applications/DeepL.app"
        "/System/Applications/Utilities/Activity Monitor.app"
        "/System/Applications/iPhone Mirroring.app"
        "/System/Applications/System Settings.app"
      ];

      persistent-others = [
        "/Users/gangjun/Documents/"
        "/Users/gangjun/Pictures/screenshots/"
        "/Users/gangjun/Downloads/"
      ];

      # Hot corner bottom right -> show desktop(2) / others -> disabled(1)
      "wvous-br-corner" = 2;
      "wvous-bl-corner" = 1;
      "wvous-tl-corner" = 1;
      "wvous-tr-corner" = 1;
    };
  };
}
