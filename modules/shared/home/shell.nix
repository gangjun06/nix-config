{pkgs, ...}: {
  home.file = {
    ".config/nushell" = {
      source = ../files/nushell;
      recursive = true;
    };
  };

  programs.nushell = {
    enable = true;
    configFile.source = ../files/nushell/config.nu;

    shellAliases = {
      mac-open = "/usr/bin/open";

      b = "bat";
      lg = "lazygit";

      q = "exit";
      vim = "nvim";
      v = "nvim";

      y = "yarn";

      yr = "yarn run";
      yrd = "yarn run dev";
      yrb = "yarn run build";
      yrt = "yarn run test";

      ya = "yarn add";
      yd = "yarn remove";

      pn = "pnpm";
      pni = "pnpm install";
      pna = "pnpm add";
      pnr = "pnpm run";
      pnrd = "pnpm run dev";
    };
  };

  programs.carapace.enable = true;
  programs.carapace.enableNushellIntegration = true;

  programs.starship = {
    enable = true;
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
}
