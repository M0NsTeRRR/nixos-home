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
    hyprshot # screenshot utility
    wl-clipboard # copy/paste utilities for Wayland
    wl-clip-persist # Keep Wayland clipboard even after programs close
    polkit-kde-agent # authentication agent
    xdg-desktop-portal-gtk # file picker
    hyprpanel # wayland bar for hyprland
    rofi-wayland # Keystroke Launcher
    dolphin # file manager
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) # nerdfonts font
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
    packer
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
    pciutils # lspci
    xdg-user-dirs # autocreate user directory

    # app
    keepassxc # password manager
    protonmail-desktop # email client for proton
    protonvpn-gui # proton vpn
    wireguard-tools # wireguard vpn
    (discord.override { withVencord = true; }) # social media
    spotify-launcher # music service
    vlc # video player
    google-chrome # browser
  ];

  fonts.fontconfig.enable = true;
}
