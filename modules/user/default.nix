{ pkgs, username, ... }:
{
  users.users.${username} = {
    shell = pkgs.bash;
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
}