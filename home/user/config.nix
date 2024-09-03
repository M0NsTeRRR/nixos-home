let configDir = ../config;
in
{
  home.file = {
    ".config/dunstrc".source = "${configDir}/dunstrc";
    ".config/hypr".source = "${configDir}/hypr";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/swaync".source = "${configDir}/swaync";
    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wlogout".source = "${configDir}/wlogout";
  };
}