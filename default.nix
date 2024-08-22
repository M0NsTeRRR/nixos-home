{ home-manager, lanzaboote, disko, username, ... }:
{
  imports = [
    ./system/hosts
    lanzaboote.nixosModules.lanzaboote
    home-manager.nixosModules.home-manager
    disko.nixosModules.disko
  ];

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit username; };
    users = {
      ${username} = import ./home;
    };
  };
}