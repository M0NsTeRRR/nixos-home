{ pkgs, hyprpanel, ... }:
{
  nixpkgs.overlays = [ hyprpanel.overlay ];
}
