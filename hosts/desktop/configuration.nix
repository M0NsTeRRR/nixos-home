{ username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ../../system/modules
    {
      home-vpn-address = [
        "192.168.4.11/32"
        "2a0c:b641:02c0:104::11/128"
      ];
    }
    ../../system/modules/game.nix
    ../../system/modules/nvidia.nix
    ../../home
  ];

  boot.supportedFilesystems = [ "btrfs" ];

  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings.monitor = [
      "DP-1,2560x1440,0x0,1"
      "DP-2,2560x1440,-2560x0,1"
      ",preferred,auto,auto"
    ];
  };
}
