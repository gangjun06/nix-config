# https://github.com/DavSanchez/nix-dotfiles/blob/a948422e0ee6a284f7413f7d5f7e8065cc131bb6/pkgs/sbarlua.nix
{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "wallpaper";
  version = "none";

  src = fetchFromGitHub {
    owner = "orangci";
    repo = "walls-catppuccin-mocha";
    rev = "c5e8c84af804ac0d291ca21b3ebf9129f7292470";
    hash = "sha256-/Zj+bmqmWWGvH0Gr3QgV5+ApuW/7GBDM4IIdkYU+M+Y=";
  };

  buildPhase = '''';

  installPhase = ''
    mkdir -p $out/wallpapers
    cp -r * $out/wallpapers
  '';

  meta = {
    description = "Catppuccin Mocha Wallpapers";
    homepage = "https://github.com/orangci/walls-catppuccin-mocha";
    license = lib.licenses.mit;
    maintainers = [];
    platforms = lib.platforms.all;
  };
}
