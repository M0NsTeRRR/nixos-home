let
  configDir = ../config;
in
{
  home.file = {
    ".config/hyprpanel/config.json".source = "${configDir}/hyprpanel/config.json";
    ".config/hypr".source = "${configDir}/hypr";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".config/keepassxc/keepassxc.ini" = {
      source = "${configDir}/keepassxc/keepassxc.ini";
      mutable = true;
      force = true;
    };
    ".kube/switch-config.yaml".source = "${configDir}/kube/switch-config.yaml";
  };
}
