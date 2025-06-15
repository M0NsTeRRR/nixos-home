{
  inputs,
  username,
  pkgs,
  config,
  lib,
  ...
}:
let
  allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
      "vscode-extension-ms-vscode-remote-remote-ssh"
      "vscode-extension-ms-vscode-remote-remote-containers"
      "vscode-extension-MS-python-vscode-pylance"
      "discord"
      "spotify"
      "google-chrome"
      "packer"
    ];

  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfreePredicate = allowUnfreePredicate;
  };
in
{
  imports = [
    inputs.home-manager-stable.nixosModules.home-manager
    ./options.nix
  ];

  config = {
    home-manager = {
      backupFileExtension = "backup";
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs username pkgs-unstable;
        guiEnabled = config.mySystem.gui.enable;
        wslEnabled = config.mySystem.wsl.enable;
        batteryEnabled = config.mySystem.battery.enable;
        nvidiaEnabled = lib.elem "nvidia" config.services.xserver.videoDrivers;
      };

      users.${username} = {
        imports = [ ./user ];

        home = {
          username = "${username}";
          homeDirectory = "/home/${username}";
        };

        # This value determines the NixOS release from which the default
        # settings for stateful data, like file locations and database versions
        # on your system were taken. It‘s perfectly fine and recommended to leave
        # this value at the release version of the first install of this system.
        # Before changing this value read the documentation for this option
        # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        home.stateVersion = "24.05";
      };
    };
  };
}
