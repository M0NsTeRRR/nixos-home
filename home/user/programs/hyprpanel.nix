{ inputs, ... }:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;

    theme = "catppuccin_macchiato";

    # Override the final config with an arbitrary set.
    # Useful for overriding colors in your selected theme.
    # Default: {}
    override = {
      theme.bar.menus.text = "#123ABC";
    };

    # Configure bar layouts for monitors.
    # See 'https://hyprpanel.com/configuration/panel.html'.
    # Default: null
    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" ];
          middle = [ "media" ];
          right = [ "volume" "systray" "notifications" ];
        };
      };
    };

    # Configure and theme almost all options from the GUI.
    # Options that require '{}' or '[]' are not yet implemented,
    # except for the layout above.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      scalingPriority = "hyprland";
      terminal = "ghostty";

      bar.clock.format = "%a %d %b  %H:%M:%S";

      bar.launcher = {
        autoDetectIcon = true;
        icon = "";
      };

      bar.workspaces = {
        workspaces = 9.0;
        show_icons = false;
        showAllActive = false;
        showWsIcons = true;
        showApplicationIcons = true;

        icons = {
          occupied = "";
          active = "";
          available = "";
        };
      }

      wallpaper.enable = false;

      notifications.ignore = [
        "spotify"
      ];

      menus.clock = {
        weather.enabled = false;
        time.military = false;
      };

      layout = ''
        {
          "bar.layouts" = {
            "0" = {
              left = [
                "dashboard"
                "workspaces"
              ];
              middle = [
                "clock"
              ];
              right = [
                "systray"
                "media"
                "volume"
                "network"
                "bluetooth"
                "battery"
                "notifications
              ];
            };
            "1" = {
              left = [
                "dashboard"
                "workspaces"
              ];
              middle = [
                "media"
              ];
              right = [
                "volume"
                "clock"
                "notifications"
              ];
            };
            "2" = {
              left = [
                "dashboard"
                "workspaces"
              ];
              middle = [
                "media"
              ];
              right = [
                "volume"
                "clock"
                "notifications"
              ];
            };
          };
        };
        '';

      menus.dashboard = {
        powermenu.avatar.image = "/home/lortega/.config/wallpapers/avatar.png";

        directories = {
          right = {
            directory1 = {
              command = bash -c \"nemo $HOME/Pictures/\"";
              label = 󰉏 Pictures";
            };
            directory2 = {
              command = bash -c \"nemo $HOME/Videos/\"";
              label = 󰉏 Videos";
            };
            directory3 = {
              command = bash -c \"nemo $HOME/Projects/\"";
              label = 󰚝 Projects";
            };
          };

          left = {
            directory1 = {
              command = bash -c \"nemo $HOME/\"";
              label = 󱂵 Home";
            };
            directory2 = {
              command = bash -c \"nemo $HOME/Documents/\"";
              label = 󱧶 Documents";
            };
            directory3 = {
              command = bash -c \"nemo $HOME/Downloads/\"";
              label = 󰉍 Downloads";
            };
          };
        };

        shortcuts = {
          right = {
            shortcut1 = {
              command = hyprpicker -a";
              tooltip = Color Picker";
              icon = ";
            };
            shortcut3 = {
              command = hyprshot -m region -o $HOME/Pictures/";
              tooltip = Screenshot";
              icon = 󰄀";
            };
          };

          left = {
            shortcut1 = {
              command = firefox";
              tooltip = Firefox";
              icon = 󰈹";
            };
            shortcut2 = {
              command = list-bindings";
              tooltip = Keybindings helper";
              icon = ";
            };
            shortcut3 = {
              shortcut3.command = ghostty";
              shortcut3.tooltip = Terminal";
              shortcut3.icon = ";
            };
            shortcut4 = {
              shortcut4.command = rofi -show drun";
              shortcut4.tooltip = Search Apps";
              shortcut4.icon = ";
            };
          };
        };
      };

      theme.font = {
        name = "Ubuntu Nerd Font";
        size = "1.0rem";
      };
    };
  };
}
