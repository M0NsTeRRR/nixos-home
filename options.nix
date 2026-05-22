{ lib, ... }:
{
  options.mySystem = {
    battery.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable battery configurations.";
    };
    game.enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable Game.";
    };
    nvidia.enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable NVIDIA.";
    };
    solaar.enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable solaar.";
    };
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
    vpn = {
      enable = lib.mkOption {
        type = with lib.types; bool;
        default = false;
        description = "Enable VPN.";
      };
      addresses = lib.mkOption {
        type = with lib.types; listOf str;
        default = [ ];
        example = [ "192.168.2.1/24" ];
        description = "The IP addresses of the interface.";
      };
    };
  };
}
