{ nixos-hardware, ... }:
{
  imports = [
    ./hardware-configuration.nix
    nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2
    ./disko.nix
    ../../modules
    ../../modules/battery.nix
  ];
}
