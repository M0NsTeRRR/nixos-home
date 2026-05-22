{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.mySystem.battery.enable {
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}
