{ lib, ... }:
{
  imports = [
    ./config.nix
    ./environment.nix
    ./packages.nix
    ./programs
    ./script.nix
    ./services
    ./theme.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
      "vscode-extension-ms-vscode-remote-remote-ssh"
      "vscode-extension-ms-vscode-remote-remote-containers"
      "discord"
      "spotify"
      "steam"
      "google-chrome"
      "packer"
    ];
}
