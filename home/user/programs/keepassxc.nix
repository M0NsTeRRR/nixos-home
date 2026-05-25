{ pkgs-unstable, ... }:
{
  programs.keepassxc = {
    enable = true;
    autostart = true;
    package = pkgs-unstable.keepassxc;
    settings = {
      Browser.Enabled = true;
      FdoSecrets.Enabled = true;
      GUI.ApplicationTheme = "dark";
      SSHAgent.Enabled = true;
      Security.LockDatabaseIdle = false;
    };
  };
}
