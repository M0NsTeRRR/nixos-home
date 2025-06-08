{ username, inputs, pkgs, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../../system/modules/ca-certificates.nix
    ../../system/modules/internationalization.nix
    ../../system/modules/nixsettings.nix
    ../../system/modules/security.nix
    ../../system/modules/ssh.nix
    ../../system/modules/user.nix
    ../../system/modules/virtualization.nix
    ../../home
    {
      mySystem = {
        gui.enable = false;
        wsl.enable = true;
      };
    }
  ];

  wsl.enable = true;
  wsl.defaultUser = username;

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
