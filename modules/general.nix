      config = {
        allowUnfreePredicate = pkg: true;
        allowUnfree = true;
      };
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      system.stateVersion