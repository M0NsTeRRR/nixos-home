{
  inputs,
  pkgs-unstable,
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.solaar.nixosModules.default
  ];

  config = lib.mkIf config.mySystem.solaar.enable {
    services.solaar = {
      enable = true;
      package = pkgs-unstable.solaar;
    };

    # Le PATH du service est minimal : hyprshot (lancé par une règle Solaar) a besoin
    # de getopt (util-linux) et pgrep/pkill (procps).
    systemd.user.services.solaar.path = [
      pkgs-unstable.util-linux
      pkgs-unstable.procps
    ];
  };
}
