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
  config = lib.mkIf cfg.enable {
    networking.wg-quick.interfaces = {
      homelab = {
        autostart = false;
        address = cfg.addresses;
        dns = [
          "192.168.6.1"
          "2a0c:b641:02c0:106::1"
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
