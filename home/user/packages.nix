{
  pkgs,
  pkgs-unstable,
  lib,
  guiEnabled,
  ...
}:
let
  cliPackages = with pkgs-unstable; [
    # dev
    vim
    strace
    ltrace
    lsof
    curl
    gcc
    gnumake
    python3
    go
    delve # go debugger
    gopls
    golangci-lint
    rustup
    lldb # rust debugger
    protobuf
    bpftrace
    yq-go # command-line YAML, JSON, XML, CSV, TOML
    eza # a modern, maintained replacement for ls
    bat # enhanced cat command
    lstr # tree alternative
    tealdeer # Very fast implementation of tldr in Rust
    hyperfine # benchmarking tool
    btop # A monitor of resources
    ripgrep
    kind
    cloud-provider-kind

    # infra
    tio # serial device I/O tool
    tcpdump
    nmap
    iperf
    kubectl
    kubernetes-helm
    fluxcd
    stern
    postgresql
    sqlite
    knot-dns # command-line DNS client
    rsync
    go-task
    rdap # Registry Data Access Protocol
    zizmor # Tool for finding security issues in GitHub Actions setups
    wireguard-tools # wireguard vpn
    kopia-ui

    # misc
    engrampa # file archiver for MATE
    unzip
    gnutar
    pciutils # lspci
    usbutils # lsusb
    presenterm # presentation with plain Markdown
  ];

  guiPackages =
    (with pkgs; [
      # DE (Desktop Environment) - stable
      hyprpicker # color picker
      hyprshot # screenshot utility
      nemo # file manager
      nerd-fonts.jetbrains-mono # nerdfonts font
      qt6.qtwayland
      qt5.qtwayland
    ])
    ++ (with pkgs-unstable; [
      hyprland # dynamic tiling Wayland compositor

      # dev tools
      hoppscotch # open-source alternative to Postman
      wireshark

      # misc
      brightnessctl # controlling backlight
      playerctl # media player command-line controller
      gpu-screen-recorder-gtk
      deskflow # keyboard and mouse sharing app
      pkgs.android-tools # for adb

      # app
      protonmail-desktop # email client for proton
      proton-vpn # vpn client for proton
      (discord.override { withVencord = true; }) # social media
      mpv # video player
      imv # image viewer
      qbittorrent # torrent
      spotify # music
      telegram-desktop # messaging app
      google-chrome

      # office tool
      hunspell
      hunspellDicts.fr-moderne
      hunspellDicts.en_US
      gimp # Image Manipulation Program
    ]);
in
{
  home.packages = cliPackages ++ lib.optionals guiEnabled guiPackages;
}
