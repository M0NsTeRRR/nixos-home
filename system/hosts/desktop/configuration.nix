{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ../../modules
    {
      home-vpn-address = [
        "192.168.4.11/32"
        "2a0c:b641:02c0:104::11/128"
      ];
    }
    ../../modules/game.nix
    ../../modules/nvidia.nix
  ];
}
