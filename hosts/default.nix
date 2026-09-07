{
  inputs,
  lib,
  hostName,
  ...
}:
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.disko.nixosModules.disko
    ./${hostName}/configuration.nix
  ]
  ++ lib.optionals (inputs ? noctalia-greeter) [
    inputs.noctalia-greeter.nixosModules.default
  ];
}
