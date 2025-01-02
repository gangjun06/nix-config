{userConfig, config,...}: {
  programs.neovim = {
    enable = true;
  };

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userConfig.nixConfig}/modules/shared/files/nvim";
    recursive = true;
  };
}
