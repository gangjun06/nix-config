{...}: {
  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
    };
  };
  catppuccin.btop.enable = true;
}
