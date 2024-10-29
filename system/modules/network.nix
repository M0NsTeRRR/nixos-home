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
    firewall = rec {
      enable = true;
      allowPing = true;
      filterForward = true;
      # kdeconnect: 1714-1764
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
    inherit hostName;
  };

  programs.nm-applet.enable = true;
}
