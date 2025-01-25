{pkgs, ...}: {
  services.karabiner = {
    enable = true;
    config = karabiner-lib: {
      hyper = (import ./config-hyper.nix {inherit karabiner-lib;});
      qmk = (import ./config-qmk.nix {inherit karabiner-lib;});
      wm = (import ./config-wm.nix {inherit karabiner-lib pkgs;});
    };
  };
}
