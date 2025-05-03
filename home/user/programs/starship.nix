{ pkgs-unstable, ... }:
{
  programs.starship = {
    enable = true;
    package = pkgs-unstable.starship;
  };
}
