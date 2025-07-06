{
  config,
  lib,
  username,
  ...
}:
let
  cfg = config.mySystem.vpn;
in
{
  options.mySystem.vpn = {
    enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable VPN.";
    };
    addresses = lib.mkOption {
      type = with lib.types; listOf str;
      default = [ ];
      example = [ "192.168.2.1/24" ];
      description = "The IP addresses of the interface.";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.wg-quick.interfaces = {
      homelab = {
        autostart = false;
        address = cfg.addresses;
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
