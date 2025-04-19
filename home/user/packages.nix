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
    hyprpolkitagent # polkit authentication
    # hyprland-qtutils
    wl-clipboard # copy/paste utilities for Wayland
    wl-clip-persist # Keep Wayland clipboard even after programs close
    polkit-kde-agent # authentication agent
    hyprpanel # wayland bar for hyprland
    rofi-wayland # Keystroke Launcher
    nemo # file manager
    yad # gui dialog (used as shortcut reminder)
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) # nerdfonts font
    qt6.qtwayland
    qt5.qtwayland

    # office tool
    libreoffice-qt
    hunspell
    hunspellDicts.fr-moderne
    hunspellDicts.en_US

    # dev
    vim
    strace
    curl
    gcc
    gnumake
    python3
    uv
    go
    delve # go debugger
    rustup
    protobuf
    bpftrace
    yq # command-line YAML, JSON, XML, CSV, TOML
    bat # enhanced cat command
    tldr # Collaborative cheatsheets for console commands
    hoppscotch # open-source alternative to Postman
    hyperfine # benchmarking tool
    btop # A monitor of resources
    ripgrep

    # infra
    tio # serial device I/O tool
    tcpdump
    nmap
    iperf
    kubectl
    helm
    kubeswitch
    stern
    packer
    # pulumi
    postgresql
    sqlite
    dogdns # command-line DNS client
    restic
    rsync
    rclone
    go-task
    rdap # Registry Data Access Protocol

    # misc
    brightnessctl # controlling backlight
    playerctl # media player command-line controller
    unzip
    gnutar
    pciutils # lspci

    # app
    keepassxc # password manager
    protonmail-desktop # email client for proton
    protonvpn-gui # proton vpn
    wireguard-tools # wireguard vpn
    (discord.override { withVencord = true; }) # social media
    vlc # video player
    google-chrome # browser
    qbittorrent # torrent
    spotify # music
    spotube # music
    marp-cli # presentation with plain Markdown
  ];

  fonts.fontconfig.enable = true;
}
