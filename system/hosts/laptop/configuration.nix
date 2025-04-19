{ username, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2
    ./disko.nix
    ../../modules
    {
      home-vpn-address = [
        "192.168.4.12/32"
        "2a0c:b641:02c0:104::12/128"
      ];
    }
    ../../modules/battery.nix
  ];

  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1,highres,auto,2,bitdepth,10" 
      ",preferred,auto,auto"
    ];
  };
}
