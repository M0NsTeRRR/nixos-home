{ hostName, ... }:
{
  imports = [
    ./${hostName}/configuration.nix
  ];

  system.stateVersion = "24.05";
}