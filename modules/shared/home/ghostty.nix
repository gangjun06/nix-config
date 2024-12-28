{
  config,
  pkgs,
  userConfig,
  ...
}: {
  home.file = {
    ".config/ghostty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig.nixConfig}/modules/shared/files/ghostty";
      recursive = true;
    };
  };
}
