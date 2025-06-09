{
  pkgs,
  pkgs-unstable,
  lib,
  guiEnabled,
  ...
}:
let
  # Packages CLI/serveur uniquement (pas de GUI)
  cliPackages = with pkgs-unstable; [
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
    eza # a modern, maintained replacement for ls
    bat # enhanced cat command
    tldr # Collaborative cheatsheets for console commands
    hyperfine # benchmarking tool
    btop # A monitor of resources
    ripgrep
    kind

    # infra
    tio # serial device I/O tool
    tcpdump
    nmap
    iperf
    kubectl
    kubecolor
    helm
    kubeswitch
    stern
    packer
    pulumi
    postgresql
    sqlite
    dogdns # command-line DNS client
    viddy # Modern watch command
    restic
    rsync
    rclone
    go-task
    rdap # Registry Data Access Protocol
    zizmor # Tool for finding security issues in GitHub Actions setups

    # misc
    unzip
    gnutar
    pciutils # lspci

    # tools
    wireguard-tools # wireguard vpn
    marp-cli # presentation with plain Markdown
  ];

  guiPackages =
    (with pkgs; [
      # DE (Desktop Environment) - stable
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
      kdePackages.polkit-kde-agent-1 # authentication agent
      hyprpanel # wayland bar for hyprland
      rofi-wayland # Keystroke Launcher
      nemo # file manager
      yad # gui dialog (used as shortcut reminder)
      nerd-fonts.jetbrains-mono # nerdfonts font
      qt6.qtwayland
      qt5.qtwayland
    ])
    ++ (with pkgs-unstable; [
      # office tool
      libreoffice-qt
      hunspell
      hunspellDicts.fr-moderne
      hunspellDicts.en_US

      # dev tools
      hoppscotch # open-source alternative to Postman
      wireshark

      # misc
      brightnessctl # controlling backlight
      playerctl # media player command-line controller

      # app
      keepassxc # password manager
      protonmail-desktop # email client for proton
      (discord.override { withVencord = true; }) # social media
      vlc # video player
      imv # image viewer
      google-chrome # browser
      qbittorrent # torrent
      spotify # music
    ]);
in
{
  home.packages = cliPackages ++ lib.optionals guiEnabled guiPackages;
}
