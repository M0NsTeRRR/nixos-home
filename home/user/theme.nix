{ pkgs, username, ... }:
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
      "file:///home/${username}/Desktop Desktop"
      "file:///home/${username}/Documents Documents"
      "file:///home/${username}/Downloads Downloads"
      "file:///home/${username}/Github Github"
      "file:///home/${username}/Music Music"
      "file:///home/${username}/Pictures Pictures"
      "file:///home/${username}/Videos Videos"
    ];
  };
}
