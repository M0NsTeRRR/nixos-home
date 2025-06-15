{
  config,
  inputs,
  batteryEnabled,
  ...
}:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    # Enable the module.
    # Default: false
    enable = true;

    overlay.enable = true;

    # Add '/nix/store/.../hyprpanel' to your
    # Hyprland config 'exec-once'.
    # Default: false
    hyprland.enable = true;

    # Fix the overwrite issue with HyprPanel.
    # See below for more information.
    # Default: false
    overwrite.enable = true;

    # Override the final config with an arbitrary set.
    # Useful for overriding colors in your selected theme.
    # Default: {}
    override = {
      "theme.bar.buttons.dashboard.icon" = "#7eb9e3";
    };

    # Configure and theme almost all options from the GUI.
    # Options that require '{}' or '[]' are not yet implemented,
    # except for the layout above.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      bar = {
        autoHide = "fullscreen";

        clock.format = "%a %d %b  %H:%M:%S";

        launcher = {
          autoDetectIcon = true;
          icon = "";
        };

        workspaces = {
          workspaces = 10;
          monitorSpecific = true;
          show_icons = false;
          showAllActive = false;
          showWsIcons = true;
          showApplicationIcons = true;

          numbered_active_indicator = "highlight";

          applicationIconEmptyWorkspace = "";

          icons = {
            occupied = "";
            active = "";
            available = "";
          };

          applicationIconMap = {
            "org.keepassxc.KeePassXC" = "";
            "Proton Mail" = "󰇮";
            "com.mitchellh.ghostty" = "";
          };
        };
      };

      layout = {
        "bar.layouts" = {
          "*" = {
            left = [
              "dashboard"
              "workspaces"
            ];
            middle = [
              "clock"
            ];
            right =
              [
                "systray"
                "media"
                "volume"
                "network"
                "bluetooth"
              ]
              ++ (if batteryEnabled then [ "battery" ] else [ ])
              ++ [
                "notifications"
              ];
          };
        };
      };

      menus = {
        clock = {
          weather.enabled = false;
          time.military = false;
        };

        dashboard = {
          powermenu.avatar.image = "${config.home.homeDirectory}/.config/wallpapers/avatar.png";

          directories = {
            right = {
              directory1 = {
                command = "bash -c \"nemo $HOME/Pictures/\"";
                label = "󰉏 Pictures";
              };
              directory2 = {
                command = "bash -c \"nemo $HOME/Videos/\"";
                label = "󰉏 Videos";
              };
              directory3 = {
                command = "bash -c \"nemo $HOME/Projects/\"";
                label = "󰚝 Projects";
              };
            };

            left = {
              directory1 = {
                command = "bash -c \"nemo $HOME/\"";
                label = "󱂵 Home";
              };
              directory2 = {
                command = "bash -c \"nemo $HOME/Documents/\"";
                label = "󱧶 Documents";
              };
              directory3 = {
                command = "bash -c \"nemo $HOME/Downloads/\"";
                label = "󰉍 Downloads";
              };
            };
          };

          shortcuts = {
            right = {
              shortcut1 = {
                command = "hyprpicker -a";
                tooltip = "Color Picker";
                icon = "";
              };
              shortcut3 = {
                command = "hyprshot -m region -o $HOME/Pictures/";
                tooltip = "Screenshot";
                icon = "󰄀";
              };
            };

            left = {
              shortcut1 = {
                command = "firefox";
                tooltip = "Firefox";
                icon = "󰈹";
              };
              shortcut2 = {
                command = "list-bindings";
                tooltip = "Keybindings helper";
                icon = "";
              };
              shortcut3 = {
                command = "ghostty";
                tooltip = "Terminal";
                icon = "";
              };
              shortcut4 = {
                command = "rofi -show drun";
                tooltip = "Search Apps";
                icon = "";
              };
            };
          };
        };
      };

      notifications.ignore = [
        "spotify"
      ];

      scalingPriority = "hyprland";

      terminal = "ghostty";

      theme = {
        name = "catppuccin_macchiato";
        font = {
          name = "Ubuntu Nerd Font";
          size = "1.0rem";
        };
        bar = {
          floating = false;
          layer = "bottom";
        };
      };

      wallpaper.enable = false;
    };
  };
}
