{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # DE
    hyprland                                               # dynamic tiling Wayland compositor
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
    catppuccin-cursors.macchiatoLight                      # cursor theme
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })  # nerdfonts font
    rofi-wayland                                           # Keystroke Launcher
    polkit-kde-agent                                       # authentication agent
    papirus-icon-theme                                     # icon theme
    helvum                                                 # GTK patchbay for pipewire
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
  ];

  fonts.fontconfig.enable = true;
}