let
  configDir = ../config;
in
{
  home.file = {
    ".config/hypr".source = "${configDir}/hypr";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/swaync".source = "${configDir}/swaync";
    ".config/user-dirs/user-dirs.dirs".source = "${configDir}/user-dirs.dirs";
    ".config/user-dirs/user-dirs.locale".source = "${configDir}/user-dirs.locale";
    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wlogout".source = "${configDir}/wlogout";
  };
}
