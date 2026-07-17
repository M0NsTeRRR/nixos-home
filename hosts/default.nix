{ inputs, hostName, ... }:
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.disko.nixosModules.disko
    ./${hostName}/configuration.nix
  ];
}
