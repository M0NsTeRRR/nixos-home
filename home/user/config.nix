let
  configDir = ../config;
in
{
  home.file = {
    ".cache/ags/hyprpanel".source = "${configDir}/hyprpanel";
    ".config/hypr".source = "${configDir}/hypr";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/wallpapers".source = "${configDir}/wallpapers";
  };
}
