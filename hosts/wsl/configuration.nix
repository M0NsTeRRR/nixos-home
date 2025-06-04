{ username, inputs, pkgs, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../../system/modules
    ../../system/modules/nvidia.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # fix for vscode remote : https://nix-community.github.io/NixOS-WSL/how-to/vscode.html
  environment.systemPackages = [
    pkgs.wget
  ];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs; # only for NixOS 24.05
  };
}
