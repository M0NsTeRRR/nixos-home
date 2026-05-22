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
  };
}
