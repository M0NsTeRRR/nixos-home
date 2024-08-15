{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # DE
    hyprpicker                     # color picker
    hyprcursor                     # cursor
    hyprlock                       # screen locking utility 
    hypridle                       # idle daemon
    hyprpaper                      # wallpaper utility
    wl-clipboard                   # copy/paste utilities for Wayland
    wl-clip-persist                # Keep Wayland clipboard even after programs close
    rofi-wayland                   # app launcher
    swayosd                        # OSD window for common actions like volume and capslock
    swaynotificationcenter         # notification daemon
    waybar                         # Wayland bar
    catppuccin-cursors.mochaMauve  # cursor theme

    # terminal/shell
    wezterm                        # terminal emulator
    starship                       # shell prompt

    # dev
    gcc
    go
    rustup
    vscode

    # misc
    firefox
  ];
}