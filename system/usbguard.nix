{ config, lib, ... }:
let
  cfg = config.mySystem.usbguard;
in
{
  config = lib.mkIf cfg.enable {
    services.usbguard = {
      enable = cfg.enable;
      rules = cfg.rules;
    };
  };
}
