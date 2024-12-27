# source : https://gist.github.com/Qyriad/a81f644c0199076577726983bd7f533a
{
  lib,
  stdenvNoCC,
  fetchurl,
  unzip,
}:
# This cannot be built from source since Hammerspoon requires entitlements to work,
# and codesigning entitlements is unfortunately incompatible with immutability.
stdenvNoCC.mkDerivation (self: {
  pname = "hammerspoon";
  version = "1.0.0";

  # We don't use fetchzip because that seems to unpack the .app as well.
  src = fetchurl {
    name = "${self.pname}-${self.version}-source.zip";
    url = "https://github.com/Hammerspoon/hammerspoon/releases/download/${self.version}/Hammerspoon-${self.version}.zip";
    sha256 = "sha256-XbcCtV2kfcMG6PWUjZHvhb69MV3fopQoMioK9+1+an4=";
  };

  nativeBuildInputs = [
    # Adds unpack hook.
    unzip
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/Applications
    cp -r ../Hammerspoon.app $out/Applications/
    runHook postInstall
  '';

  meta = {
    homepage = "https://www.hammerspoon.org";
    description = "Staggeringly powerful macOS desktop automation with Lua";
    license = lib.licenses.mit;
    platforms = lib.platforms.darwin;
  };
})
