{ lib, hyprpanel, ... }:
{
  imports = [
    ./config.nix
    ./environment.nix
    ./overlays
    ./packages.nix
    ./programs
    ./scripts
    ./services
    ./theme.nix
    ./xdg.nix
  ];

  nixpkgs = {
    config.allowUnfreePredicate =
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
    overlays = [ hyprpanel.overlay ];
  };
}
