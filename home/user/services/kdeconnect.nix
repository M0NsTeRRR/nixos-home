{ pkgs-unstable, ... }:
{
  services.kdeconnect = {
    enable = true;
    package = pkgs-unstable.kdePackages.kdeconnect-kde;
  };
}
