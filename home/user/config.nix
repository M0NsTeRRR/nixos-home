{
  lib,
  guiEnabled,
  ...
}:
let
  configDir = ../config;

  guiFile = {
    ".cache/noctalia/wallpapers.json".source = "${configDir}/noctalia/wallpapers.json";
    ".config/hypr/hypridle.conf".source = "${configDir}/hypr/hypridle.conf";
    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".local/share/nemo".source = "${configDir}/nemo";
  };

  defaultFile = {
    ".config/containers/containers.conf".source = "${configDir}/containers/containers.conf";
  };
in
{
  home.file = defaultFile // lib.optionalAttrs guiEnabled guiFile;
}
