{ pkgs-unstable, ... }:
{
  programs.devenv = {
    enable = true;
    package = pkgs-unstable.devenv;
  };
}
