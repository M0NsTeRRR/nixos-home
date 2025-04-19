{
  inputs,
  username,
  pkgs-unstable,
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
      inherit inputs username pkgs-unstable;
    };
    users = {
      ${username} = import ./home;
    };
  };
}
