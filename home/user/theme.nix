{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  # for nemo file manager
  dconf = {
    enable = true;
    settings = {
      "org/cinnamon/desktop/applications/terminal".exec = "kitty";
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    style.name = "Breeze-Dark";
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
  };
}
