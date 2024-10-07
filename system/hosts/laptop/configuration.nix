{ nixos-hardware, ... }:
{
  imports = [
    ./hardware-configuration.nix
    nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen2
    ./disko.nix
    ../../modules
  ];

  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
