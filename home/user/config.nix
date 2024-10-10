let
  configDir = ../config;
in
{
  home.file = {
    ".config/user-dirs/ags".source = "${configDir}/ags";
    ".config/hypr".source = "${configDir}/hypr";
    ".config/user-dirs/user-dirs.dirs".source = "${configDir}/user-dirs.dirs";
    ".config/user-dirs/user-dirs.locale".source = "${configDir}/user-dirs.locale";
    ".config/wallpapers".source = "${configDir}/wallpapers";
  };
}
