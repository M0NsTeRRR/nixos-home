{ hostName, ... }:
{
  imports = [ ./${hostName}/configuration.nix ];

  boot.supportedFilesystems = [ "btrfs" ];

  system.stateVersion = "24.05";
}
