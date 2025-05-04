{ pkgs-unstable, ... }:
{
  services.kdeconnect = {
    enable = true;
    package = pkgs-unstable.plasma5Packages.kdeconnect-kde;
  };
}
