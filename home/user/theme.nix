{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark-Compact";
      package = pkgs.orchis-theme;
    };

    iconTheme = {
      name = "Adwaita Dark";
      package = pkgs.gnome.adwaita-icon-theme;
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
}
