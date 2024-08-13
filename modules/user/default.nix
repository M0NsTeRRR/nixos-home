{ pkgs, username, ... }:
{
  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    initialPassword = "temp123";
    extraGroups = [
      "wheel"
      "input"
      "video"
      "render"
      "scanner"
      "lp"
    ];
  };

  home-manager = {
    backupFileExtension = "backup";
    users.${username} = {
      home.stateVersion = "24.05";
    };
  };
}