{
  config,
  pkgs,
  userConfig,
  ...
}: {
  home.packages = [
    pkgs.yq-go
    pkgs.gitmux
  ];

  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "xterm-256color";
    extraConfig = ''
      source-file ${userConfig.home}/.config/tmux-custom-config/tmux.conf
    '';
  };

  home.file.".config/tmux-custom-config" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userConfig.nixConfig}/modules/shared/files/tmux";
    recursive = true;
  };

  home.file.".gitmux.conf" = {
     source = config.lib.file.mkOutOfStoreSymlink "${userConfig.nixConfig}/modules/shared/files/tmux/gitmux.conf";
  };
}
