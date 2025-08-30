{ pkgs-unstable, ... }:
{
  programs.gpg = {
    enable = true;
    package = pkgs-unstable.gnupg;
  };
}
