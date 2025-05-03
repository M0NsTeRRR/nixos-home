{
  inputs,
  username,
  pkgs,
  lib,
  ...
}:

let
  allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
      "vscode-extension-ms-vscode-remote-remote-ssh"
      "vscode-extension-ms-vscode-remote-remote-containers"
      "vscode-extension-MS-python-vscode-pylance"
      "discord"
      "spotify"
      "google-chrome"
      "packer"
    ];

  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfreePredicate = allowUnfreePredicate;
  };
in
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
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs username pkgs-unstable;
    };

    users.${username} = import ./home;
  };
}
