{ pkgs, pkgs-unstable, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
    plugins = with pkgs.hyprlandPlugins; [ ];
    configType = "lua";
    systemd.variables = [ "--all" ];
    extraConfig = builtins.readFile ../../config/hypr/hyprland.lua;
  };
}
