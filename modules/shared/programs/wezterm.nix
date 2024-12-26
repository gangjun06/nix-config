{pkgs, ...}: {
  home.packages = [
    pkgs.wezterm
  ];

  home.file = {
    ".config/wezterm" = {
      source = ./../files/wezterm;
      recursive = true;
    };
  };
}
