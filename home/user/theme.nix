{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  fonts.fontconfig.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/cinnamon/desktop/applications/terminal".exec = "ghostty";
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "qt6ct";
  };

  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark-Compact";
      package = pkgs.orchis-theme;
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    font = {
      name = "Sans";
      size = 12;
    };

    gtk3.bookmarks = [
      "file:///home/lortega/Desktop Desktop"
      "file:///home/lortega/Documents Documents"
      "file:///home/lortega/Downloads Downloads"
      "file:///home/lortega/Github Github"
      "file:///home/lortega/Music Music"
      "file:///home/lortega/Pictures Pictures"
      "file:///home/lortega/Videos Videos"
    ];
  };
}
