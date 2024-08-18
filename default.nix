{ home-manager, lanzaboote, username, ... }:
{
  imports = [
    ./system/hosts
    lanzaboote.nixosModules.lanzaboote
    home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko
  ];

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit username; };
    users = {
      ${username} = import ./home;
    };
  };
}