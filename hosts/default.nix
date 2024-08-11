{ hostName, ... }:
{
  imports = [
    ./${hostName}
  ];

  system.stateVersion = "24.05";
}