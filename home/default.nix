{
  inputs,
  pkgs,
  config,
  lib,
  home-manager-unstable,
  username,
  ...
}:
let
  wslEnabled = if config ? wsl then config.wsl.enable else false;

  allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
      "vscode-extension-ms-vscode-remote-remote-ssh"
      "vscode-extension-ms-vscode-remote-remote-containers"
      "vscode-extension-MS-python-vscode-pylance"
      "discord"
      "spotify"
      "packer"
      "google-chrome"
    ];

  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfreePredicate = allowUnfreePredicate;
  };
in
{
  imports = [
    inputs.home-manager-stable.nixosModules.home-manager
  ];

  options.myUser = {
    battery.enable = lib.mkOption {
      type = with lib.types; bool;
      default = false;
      description = "Enable battery configurations.";
    };
  };

  config = {
    # trippy does not support native unprivileged mode https://github.com/fujiapple852/trippy/issues/741
    security.wrappers.trip = {
      owner = username;
      group = username;
      capabilities = "cap_net_raw+p";
      source = "${pkgs-unstable.trippy}/bin/trip";
    };

    home-manager = {
      backupFileExtension = "backup";
      useUserPackages = true;

      extraSpecialArgs = {
        inherit
          inputs
          pkgs-unstable
          username
          wslEnabled
          ;
        guiEnabled = !wslEnabled;
        batteryEnabled = config.myUser.battery.enable;
        nvidiaEnabled = lib.elem "nvidia" config.services.xserver.videoDrivers;
      };

      users.${username} = {
        imports = [
          (inputs.home-manager-unstable + "/modules/programs/hwatch.nix")
          (inputs.home-manager-unstable + "/modules/programs/kubeswitch.nix")
          ./user
        ];

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
