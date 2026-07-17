{ config, pkgs, ... }:
{
  programs.fish.enable = true;

  users.users.root.hashedPassword = "!";

  users.groups.${config.mySystem.user.name} = { };
  users.users.${config.mySystem.user.name} = {
    isNormalUser = true;
    initialPassword = "temp123";
    group = config.mySystem.user.name;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = config.mySystem.user.authorizedKeys;
  };
}
