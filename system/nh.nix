{ config, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/${config.mySystem.user.name}/development/nixos-home";
  };
}
