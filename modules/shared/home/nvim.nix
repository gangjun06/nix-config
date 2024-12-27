{...}: {
  programs.neovim = {
    enable = true;
  };

  home.file.".config/nvim" = {
    source = ../files/nvim;
    recursive = true;
  };
}
