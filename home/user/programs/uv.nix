{ pkgs-unstable, ... }:
{
  programs.uv = {
    enable = true;
    package = pkgs-unstable.uv;
  };
}
