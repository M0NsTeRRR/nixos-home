{
  lib,
  guiEnabled,
  ...
}:
let
  configDir = ../config;

  guiFile = {
    ".config/hypr/hypridle.conf".source = "${configDir}/hypr/hypridle.conf";
    ".config/hypr/hyprlock.conf".source = "${configDir}/hypr/hyprlock.conf";
    ".config/hypr/hyprpaper.conf".source = "${configDir}/hypr/hyprpaper.conf";
    ".config/hypr/macchiato.conf".source = "${configDir}/hypr/macchiato.conf";
    ".local/share/nemo".source = "${configDir}/nemo";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/wallpapers".source = "${configDir}/wallpapers";
  };

  defaultFile = {
    ".config/containers/containers.conf".source = "${configDir}/containers/containers.conf";
  };
in
{
  home.file = defaultFile // lib.optionalAttrs guiEnabled guiFile;
}
