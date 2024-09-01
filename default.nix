{ home-manager-stable, home-manager-unstable, lanzaboote, disko, username, ... }:
{
  imports = [
    ./system/hosts
    lanzaboote.nixosModules.lanzaboote
    home-manager-stable.nixosModules.home-manager
    disko.nixosModules.disko
  ];

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit home-manager-unstable username; };
    users = {
      ${username} = import ./home;
    };
  };
}