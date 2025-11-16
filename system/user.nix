{ username, pkgs, ... }:
{
  programs.fish.enable = true;

  users.users.root.hashedPassword = "!";

  users.groups.${username} = { };
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = "temp123";
    group = username;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDvw79Nxlt23DXgQTglV7pw3HdHuTrDEWrlGTHhbWie1 ${username}"
    ];
  };
}
