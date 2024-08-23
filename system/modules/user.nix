{ username, pkgs, ... }:
{
  programs.zsh.enable = true;

  users.users.root.hashedPassword = "!";

  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "temp123";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDvw79Nxlt23DXgQTglV7pw3HdHuTrDEWrlGTHhbWie1 ${username}"
    ];
  };
}