{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  services.rpcbind.enable = true;

  systemd.mounts = let commonMountOptions = {
    type = "cifs";
    mountConfig = {
      Options = "noatime,rw,credentials=/home/${username}/cifs/credentials";
    };
  };
  in
  [
    (commonMountOptions // {
      what = "//nas.unicornafk.fr/backup";
      where = "/mnt/backup";
    })
    (commonMountOptions // {
      what = "//nas.unicornafk.fr/multimedia";
      where = "/mnt/multimedia";
    })
  ];

  systemd.automounts = let commonAutoMountOptions = {
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "300";
    };
  };
  in
  [
    (commonAutoMountOptions // { where = "/mnt/backup"; })
    (commonAutoMountOptions // { where = "/mnt/multimedia"; })
  ];
}
