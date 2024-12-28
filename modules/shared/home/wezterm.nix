{
  config,
  pkgs,
  userConfig,
  ...
}: {
  home.packages = [
    pkgs.wezterm
  ];

  home.file = {
    ".config/wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConfig.nixConfig}/modules/shared/files/wezterm";
      recursive = true;
    };
  };
}
