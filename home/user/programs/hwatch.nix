{ pkgs-unstable, ... }:
{
  programs.hwatch = {
    enable = true;
    package = pkgs-unstable.hwatch;
    extraArgs = [
      "--color"
      "--border"
      "--precise"
      "--keymap ctrl-c=force_cancel"
    ];
  };
}
