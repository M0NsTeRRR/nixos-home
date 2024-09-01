{ pkgs, ... }:
let configDir = ../config;
in
{
  home.file = {
    ".config/hypr".source = "${configDir}/hypr";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/swaync".source = "${configDir}/swaync";
    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/wlogout".source = "${configDir}/wlogout";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.macchiatoLight;
    name = "Catppuccin-Macchiato-Light";
    size = 32;
  };
}