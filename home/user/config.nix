let configDir = ../config;
in
{
  home.file = {
    ".config/wallpapers".source = "${configDir}/wallpapers";
    ".config/hypr".source = "${configDir}/hypr";
  };
}