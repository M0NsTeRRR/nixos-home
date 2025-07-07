{ pkgs-unstable, ... }:
{
  programs.hwatch = {
    enable = true;
    package = pkgs-unstable.hwatch;
    extraArgs = [
      "--color"
      "--border"
      "--precise"
    ];
  };
}
