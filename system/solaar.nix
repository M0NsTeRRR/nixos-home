{
  inputs,
  pkgs-unstable,
  config,
  lib,
  ...
}:
let
  cfg = config.mySystem.solaar;
in
{
  imports = [
    inputs.solaar.nixosModules.default
  ];

  options.mySystem.solaar = {
    enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable solaar.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.solaar = {
      enable = true;
      package = pkgs-unstable.solaar;
    };
  };
}
