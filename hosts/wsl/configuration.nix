{
  username,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    ../../system/ca-certificates.nix
    ../../system/internationalization.nix
    ../../system/nixsettings.nix
    ../../system/security.nix
    ../../system/ssh.nix
    ../../system/user.nix
    ../../system/virtualization.nix
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
