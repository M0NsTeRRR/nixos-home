{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # DE
    hyprland                                               # dynamic tiling Wayland compositor
    xdg-desktop-portal-wlr                                 # Hyprland XDG Desktop Portal
    hyprpicker                                             # color picker
    hyprcursor                                             # cursor
    hyprlock                                               # screen locking utility 
    hypridle                                               # idle daemon
    hyprpaper                                              # wallpaper utility
    wl-clipboard                                           # copy/paste utilities for Wayland
    wl-clip-persist                                        # Keep Wayland clipboard even after programs close
    swayosd                                                # OSD window for common actions like volume and capslock
    swaynotificationcenter                                 # notification daemon
    waybar                                                 # Wayland bar
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })  # nerdfonts font
    rofi-wayland                                           # Keystroke Launcher
    polkit-kde-agent                                       # authentication agent
    papirus-icon-theme                                     # icon theme
    helvum                                                 # GTK patchbay for pipewire
    xdg-desktop-portal-gtk                                 # file picker
    qt6.qtwayland
    qt5.qtwayland

    # dev
    gcc
    gnumake
    python3
    go
    rustup
    vscode

    # misc
    brightnessctl                                          # controlling backlight
    playerctl                                              # media player command-line controller
    keepassxc                                              # password manager
  ];

  fonts.fontconfig.enable = true;
}