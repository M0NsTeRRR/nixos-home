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
    nftables.enable = true;
    firewall.enable = true;
    inherit hostName;
  };
}