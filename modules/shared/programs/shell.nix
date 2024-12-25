{pkgs, ...}: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = ./../files/nushell/config.nu;

      shellAliases = {
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

    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = {
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
  };
}
