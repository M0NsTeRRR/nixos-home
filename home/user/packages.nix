{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # DE
    hyprland # dynamic tiling Wayland compositor
    xdg-desktop-portal-hyprland # Hyprland XDG Desktop Portal
    hyprpicker # color picker
    hyprcursor # cursor
    hyprlock # screen locking utility
    hypridle # idle daemon
    hyprpaper # wallpaper utility
    wl-clipboard # copy/paste utilities for Wayland
    wl-clip-persist # Keep Wayland clipboard even after programs close
    swayosd # OSD window for common actions like volume and capslock
    waybar # Wayland bar
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) # nerdfonts font
    rofi-wayland # Keystroke Launcher
    wlogout # logout menu
    polkit-kde-agent # authentication agent
    helvum # GTK patchbay for pipewire
    xdg-desktop-portal-gtk # file picker
    swaynotificationcenter # notification center
    qt6.qtwayland
    qt5.qtwayland

    # office tool
    libreoffice-qt
    hunspell
    hunspellDicts.fr-moderne
    hunspellDicts.en_US

    # dev
    gcc
    gnumake
    python3
    poetry
    uv
    go
    rustup
    yq
    bat

    # infra
    tio # serial device I/O tool
    tcpdump # network sniffer
    kubectl
    kubectx
    helm
    k9s
    pulumi
    postgresql
    sqlite
    ldns # drill
    restic
    rclone

    # misc
    brightnessctl # controlling backlight
    playerctl # media player command-line controller
    unzip

    # app
    keepassxc # password manager
    protonmail-desktop # email client for proton
    protonvpn-gui # proton vpn
    wireguard-tools # wireguard vpn
    (discord.override { withVencord = true; }) # social media
    spotify # music service
    vlc # video player
    google-chrome # browser
  ];

  fonts.fontconfig.enable = true;
}
