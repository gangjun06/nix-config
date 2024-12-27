# https://github.com/DavSanchez/nix-dotfiles/blob/a948422e0ee6a284f7413f7d5f7e8065cc131bb6/pkgs/sbarlua.nix
{
  pkgs,
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  # <stackline/>
  pname = "stackline";
  version = "2024-12-27";

  src = fetchFromGitHub {
    owner = "AdamWagner";
    repo = "stackline";
    rev = "2aa0bd9a27f93bad24b0fd4da38f3c0356414098";
    hash = "sha256-x7SIgKR6rwkoVVbaAvjFr1N7wTF3atni/d6xGLBBRN4=";
  };

  buildPhase = '''';

  installPhase = ''
    mkdir -p $out/source
    cp -r * $out/source
  '';

  meta = {
    description = "Stackline";
    homepage = "https://github.com/AdamWagner/stackline";
    license = lib.licenses.mit;
    maintainers = [];
    platforms = lib.platforms.darwin;
  };
}
