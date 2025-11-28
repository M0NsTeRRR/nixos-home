{ pkgs-unstable, ... }:
{
  services.cliphist = {
    enable = true;
    package = pkgs-unstable.cliphist;
    systemdTargets = [ "hyprland-session.target" ];
  };
}
