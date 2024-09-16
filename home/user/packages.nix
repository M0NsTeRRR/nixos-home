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
    waybar                                                 # Wayland bar
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })  # nerdfonts font
    rofi-wayland                                           # Keystroke Launcher
    wlogout                                                # logout menu
    polkit-kde-agent                                       # authentication agent
    papirus-icon-theme                                     # icon theme
    helvum                                                 # GTK patchbay for pipewire
    xdg-desktop-portal-gtk                                 # file picker
    swaynotificationcenter                                 # notification center
    qt6.qtwayland
    qt5.qtwayland

    # dev
    gcc
    gnumake
    python3
    go
    rustup
    kitty
    vscode
    yq
    bat

    # infra
    kubectl
    kubectx
    helm
    k9s
    postgresql
    ldns                                                   # drill
    restic
    rclone

    # misc
    brightnessctl                                          # controlling backlight
    playerctl                                              # media player command-line controller
    unzip

    # app
    keepassxc                                              # password manager
    protonmail-desktop                                     # email client for proton
    protonvpn-cli                                          # vpn cli for proton
    (discord.override { withVencord = true; })             # social media
    spotify                                                # music service
    vlc                                                    # video player
  ];

  fonts.fontconfig.enable = true;
}