let
  configDir = ../config;
in
{
  home.file = {
    ".config/hyprpanel/config.json".source = "${configDir}/hyprpanel/config.json";
    ".config/hypr".source = "${configDir}/hypr";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".kube/switch-config.yaml".source = "${configDir}/kube/switch-config.yaml";
  };
}
