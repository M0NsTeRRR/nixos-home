{
  pkgs,
  home-manager-unstable,
  username,
  ...
}:
{
  disabledModules = [ "programs/firefox.nix" ];

  imports = [
    (home-manager-unstable + "/modules/programs/firefox.nix")
    ./user
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.macchiatoLight;
    name = "Catppuccin-Macchiato-Light";
    size = 24;
  };

  home.stateVersion = "24.05";
}
