{pkgs, ...}: {
  home.programs.cursor = {
    enable = true;
    package = pkgs.cursor;
  };
}
