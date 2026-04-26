{ pkgs-unstable, ... }:
{
  programs.onlyoffice = {
    enable = true;
    package = pkgs-unstable.onlyoffice-desktopeditors;
  };
}
