{ config, lib, ... }:
let
  cfg = config.mySystem.usbguard;
in
{
  options.mySystem = {
    usbguard = {
      enable = lib.mkOption {
        type = with lib.types; bool;
        default = false;
        description = "Enable USBGuard.";
      };
      rules = lib.mkOption {
        type = with lib.types; str;
        default = "";
        example = [ ];
        description = "USBGuard rules.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.usbguard = {
      enable = cfg.enable;
      rules = cfg.rules;
    };
  };
}
