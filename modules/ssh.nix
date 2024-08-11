{ username, ... }:
{
  users.users.${username} = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDvw79Nxlt23DXgQTglV7pw3HdHuTrDEWrlGTHhbWie1 ${username}"
    ];
  };

  services.openssh = {
    enable = true;
    compression = true;
    serverAliveInterval = 10;
    serverAliveCountMax = 2;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    settings.X11Forwarding = true;
  };

  programs.ssh.startAgent = true;
}