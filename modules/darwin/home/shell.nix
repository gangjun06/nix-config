{pkgs, ...}: let
  shellAliases = {
    # Modern replacements
    ls = "eza --icons";
    l = "eza -lbF --git --icons";
    ll = "eza -lbGF --git --icons";
    llm = "eza -lbGd --icons --git --sort=modified";
    la = "eza -lbhHgUmuSa --time-style=default --icons --git --color-scale";
    lx = "eza -lbhHgUmuSa@ --time-style=default ---icons -git --color-scale";
    lS = "eza -1 --icons";
    lt = "eza --tree --level=2 --icons";

    cat = "bat";
    top = "btop";

    # Editor aliases
    vi = "nvim";
    vim = "nvim";

    # Utility aliases
    c = "clear";
    lg = "lazygit";

    # Navigation aliases
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    # Git aliases (basic ones, more complex ones can go in git config)
    g = "git";
    ga = "git add";
    gc = "git commit";
    gst = "git status";
    gp = "git push";
    gl = "git pull";
    gco = "git checkout";
    gb = "git branch";
    gd = "git diff";
    glog = "git log --oneline --graph --decorate";

    q = "exit";

    # Yarn aliases
    y = "yarn";
    yr = "yarn run";
    yrd = "yarn run dev";
    yrb = "yarn run build";
    yrt = "yarn run test";
    ya = "yarn add";
    yd = "yarn remove";

    # PNPM aliases
    pn = "pnpm";
    pni = "pnpm install";
    pna = "pnpm add";
    pnr = "pnpm run";
    pnrd = "pnpm run dev";
  };
in {
  programs.zsh = {
    enable = true;
    shellAliases = shellAliases;

    initContent = ''
      export ANDROID_HOME=$HOME/Library/Android/sdk
      export PATH=$PATH:$ANDROID_HOME/emulator
      export PATH=$PATH:$ANDROID_HOME/tools
      export PATH=$PATH:$ANDROID_HOME/tools/bin
      export PATH=$PATH:$ANDROID_HOME/platform-tools
      export PATH=$HOME/.claude/local:$PATH
      export PATH=$HOME/.cargo/bin:$PATH

      # Fix Xcode path for Expo compatibility
      export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"

      eval "$(fnm env --use-on-cd --shell zsh)"

      $GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration
    '';
  };

  # Enable fish shell
  programs.fish = {
    enable = true;

    shellAliases = shellAliases;

    plugins = [
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
    ];

    # Fish shell configuration
    shellInit = ''
      # Android SDK configuration
      set -gx ANDROID_HOME $HOME/Library/Android/sdk
      set -gx PATH $PATH $ANDROID_HOME/emulator
      set -gx PATH $PATH $ANDROID_HOME/tools
      set -gx PATH $PATH $ANDROID_HOME/tools/bin
      set -gx PATH $PATH $ANDROID_HOME/platform-tools
      set -gx PATH $HOME/.claude/local $PATH
      set -gx PATH $HOME/.cargo/bin $PATH

      # Fix Xcode path for Expo compatibility
      set -gx DEVELOPER_DIR "/Applications/Xcode.app/Contents/Developer"

      fnm env --use-on-cd --shell fish | source
    '';

    # Functions
    functions = {
      # Modern 'ls' function using eza
      l = "eza -la --icons $argv";

      # Quick directory navigation
      mkcd = {
        description = "Create directory and change to it";
        body = "mkdir -p $argv[1]; and cd $argv[1]";
      };

      # Extract function
      extract = {
        description = "Extract various archive formats";
        body = ''
          switch (string lower $argv[1])
            case "*.tar.bz2"
              tar xjf $argv[1]
            case "*.tar.gz"
              tar xzf $argv[1]
            case "*.bz2"
              bunzip2 $argv[1]
            case "*.rar"
              unrar e $argv[1]
            case "*.gz"
              gunzip $argv[1]
            case "*.tar"
              tar xf $argv[1]
            case "*.tbz2"
              tar xjf $argv[1]
            case "*.tgz"
              tar xzf $argv[1]
            case "*.zip"
              unzip $argv[1]
            case "*.Z"
              uncompress $argv[1]
            case "*.7z"
              7z x $argv[1]
            case "*"
              echo "Unknown archive format: $argv[1]"
          end
        '';
      };
    };
  };

  programs.carapace.enable = true;
  programs.carapace.enableZshIntegration = true;
  programs.carapace.enableFishIntegration = true;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
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

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf.enableFishIntegration = true;
}
