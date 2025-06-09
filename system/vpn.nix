{
  lib,
  config,
  username,
  ...
}:
with lib;
{
  options = {
    home-vpn-address = mkOption {
      type = with types; listOf str;
      default = [ ];
      example = [ "192.168.2.1/24" ];
      description = "The IP addresses of the interface.";
    };
  };

  config = {
    networking.wg-quick.interfaces = {
      homelab = {
        autostart = false;
        address = config.home-vpn-address;
        dns = [
          "192.168.10.21"
          "192.168.10.22"
          "2a0c:b641:02c0:110::21"
          "2a0c:b641:02c0:110::22"
          "unicornafk.fr"
        ];
        privateKeyFile = "/home/${username}/wireguard-keys/homelab.priv";

        peers = [
          {
            publicKey = "S8x303fQKjZ2DI+dhbf4y4fGMYgv90mvipgG8XF8rl4=";
            presharedKeyFile = "/home/${username}/wireguard-keys/homelab.peer";
            allowedIPs = [
              "0.0.0.0/0"
              "::/0"
            ];
            endpoint = "vpn.adminafk.fr:51820";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
}
