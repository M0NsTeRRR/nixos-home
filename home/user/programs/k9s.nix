{ pkgs-unstable, ... }:
{
  programs.k9s = {
    enable = true;
    package = pkgs-unstable.k9s;
  };
}
