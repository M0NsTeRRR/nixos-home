{ gui, config, ... }:
let
  guiFile = {
    ".config/hypr/hypridle.conf".source = "${configDir}/hypr/hypridle.conf";
    ".config/hypr/hyprlock.conf".source = "${configDir}/hypr/hyprlock.conf";
    ".config/hypr/hyprpaper.conf".source = "${configDir}/hypr/hyprpaper.conf";
    ".config/hypr/macchiato.conf".source = "${configDir}/hypr/macchiato.conf";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".config/keepassxc/keepassxc.ini".source = "${configDir}/keepassxc/keepassxc.ini";
  };

  defaultFile = {
    ".config/containers/containers.conf".source = "${configDir}/containers/containers.conf";
    ".kube/switch-config.yaml".source = "${configDir}/kube/switch-config.yaml";
  };

  configDir = ../config;
in
{
  home.file = defaultFile // (if gui then guiFile else { });
}
