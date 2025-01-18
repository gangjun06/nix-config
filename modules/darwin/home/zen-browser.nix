{
  pkgs,
  inputs,
  config,
  userConfig,
  ...
}: let
  profilesPath = "${userConfig.home}/Library/Application Support/zen/Profiles";
  profiles = builtins.readDir profilesPath;
  profileDirs = builtins.filter (name: profiles.${name}.type == "directory") (builtins.attrNames profiles);

  profileDir = builtins.head profileDirs;
  profilePath = builtins.map (dir: "${profilesPath}/${dir}") profileDirs;
in {
  # <zen-browser />
}
