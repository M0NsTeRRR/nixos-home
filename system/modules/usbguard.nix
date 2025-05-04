{
  lib,
  config,
  username,
  ...
}:
with lib;
{
  options = {
    usbguard-rules = mkOption {
      type = with types; str;
      default = "";
      example = [ ];
      description = "USBGuard rules";
    };
  };

  config = {
    services.usbguard = {
      enable = true;
      rules = config.usbguard-rules;
    };
  };
}
