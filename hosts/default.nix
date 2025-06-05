{ inputs, hostName, ... }:
{
  imports = [
    inputs.lix-module.nixosModules.default
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.disko.nixosModules.disko
    ./${hostName}/configuration.nix
  ];

  system.stateVersion = "24.05";
}
