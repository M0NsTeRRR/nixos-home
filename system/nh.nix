{ pkgs-unstable, config, ... }:
{
  programs.nh = {
    enable = true;
    package = pkgs-unstable.nh;
    flake = "/home/${config.mySystem.user.name}/development/nixos-home";
  };
}
