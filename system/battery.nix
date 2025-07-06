{
  config,
  lib,
  ...
}:
let
  cfg = config.mySystem.battery;
in
{
  options.mySystem.battery = {
    enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable battery configurations.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}
