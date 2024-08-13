{ pkgs, ... }:
{
  # Enable Hyprland
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    hyprpicker  # color picker
    hyprcursor  # cursor
    hyprlock    # screen locking utility 
    hypridle    # idle daemon
    hyprpaper   # wallpaper utility

    wl-clipboard            # copy/paste utilities for Wayland
    wl-clip-persist         # Keep Wayland clipboard even after programs close
    rofi-wayland            # app launcher
    SwayOSD                 # OSD window for common actions like volume and capslock
    swaynotificationcenter  # notification daemon
  ];

  imports = [
    ./hypridle
    ./hyprland
    ./hyprlock
    ./hyprpaper
  ];
}