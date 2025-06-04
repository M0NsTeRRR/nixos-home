{ username, inputs, pkgs, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../../modules/ca-certificates.nix
    ../../modules/internationalization.nix
    ../../modules/nixsettings.nix
    ../../modules/security.nix
    ../../modules/ssh.nix
    ../../modules/user.nix
    ../../modules/video.nix
    ../../modules/virtualisation.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  environment.etc."resolv.conf".source = "/etc/resolv.conf";

  # fix for vscode remote : https://nix-community.github.io/NixOS-WSL/how-to/vscode.html
  environment.systemPackages = [
    pkgs.wget
  ];

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs; # only for NixOS 24.05
  };
}
