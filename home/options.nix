{ lib, ... }:
{
  options.mySystem = {
    gui.enable = lib.mkOption {
      type = with lib.types; bool;
      default = true;
      description = "Enable GUI-specific configurations.";
    };
    wsl.enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable WSL-specific configurations.";
    };
  };
}
