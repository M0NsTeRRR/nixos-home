{
  inputs,
  username,
  ...
}:
{
  imports = [
    ./system/hosts
    inputs.lix-module.nixosModules.default
    inputs.lanzaboote.nixosModules.lanzaboote
    inputs.home-manager-stable.nixosModules.home-manager
    inputs.disko.nixosModules.disko
  ];

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs username;
    };
    users = {
      ${username} = import ./home;
    };
  };
}
