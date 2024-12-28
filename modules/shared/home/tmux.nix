{
  config,
  pkgs,
  userConfig,
  ...
}: {
  home.packages = [
    pkgs.yq-go
  ];

  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell}/bin/nu";
    terminal = "xterm-256color";
    extraConfig = ''
      source-file ${userConfig.home}/.config/tmux-custom-config/tmux.conf
    '';
  };

  home.file.".config/tmux-custom-config" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userConfig.nixConfig}/modules/shared/files/tmux";
    recursive = true;
  };
}
