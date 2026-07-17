{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.mySystem.thunderbolt.enable {
    services.hardware.bolt.enable = true;
  };
}
