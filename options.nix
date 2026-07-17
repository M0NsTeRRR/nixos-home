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
    gui.enable = lib.mkOption {
      type = with lib.types; bool;
      default = true;
      description = "Enable GUI.";
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
    thunderbolt.enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable thunderbolt.";
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
    user = {
      name = lib.mkOption {
        type = with lib.types; str;
        default = "lortega";
        description = "Configure your user.";
      };
      authorizedKeys = lib.mkOption {
        type = with lib.types; listOf singleLineStr;
        default = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDvw79Nxlt23DXgQTglV7pw3HdHuTrDEWrlGTHhbWie1 lortega"
        ];
        description = "SSH public keys to authorize for this user.";
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
