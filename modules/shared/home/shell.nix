{
  pkgs,
  config,
  userConfig,
  ...
}: {
  # Symlink to zsh config files
  home.file.".zshrc" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userConfig.nixConfig}/modules/darwin/files/zsh/zshrc";
  };

  home.file.".zshenv" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userConfig.nixConfig}/modules/darwin/files/zsh/zshenv";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false; # Let existing .zshrc handle completions
  };

  # Enable carapace for zsh completions
  programs.carapace.enable = true;
  programs.carapace.enableZshIntegration = true;

  # Keep starship configuration
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = "$all";
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      gcloud.disabled = true;
      aws.disabled = true;
    };
  };
  catppuccin.starship.enable = true;

  # Enable additional tools that were used with nushell
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
