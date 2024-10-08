{
  home-manager-stable,
  home-manager-unstable,
  lix-module,
  lanzaboote,
  disko,
  username,
  ...
}:
{
  imports = [
    ./system/hosts
    lix-module.nixosModules.default
    lanzaboote.nixosModules.lanzaboote
    home-manager-stable.nixosModules.home-manager
    disko.nixosModules.disko
  ];

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit home-manager-unstable username;
    };
    users = {
      ${username} = import ./home;
    };
  };
}
