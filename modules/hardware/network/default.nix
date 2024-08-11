{ hostName, username, ... }:
{
  users.users.${username} = {
    extraGroups = [ "networkmanager" ];
  };
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
    firewall.enable = false;
    inherit hostName;
  };
}