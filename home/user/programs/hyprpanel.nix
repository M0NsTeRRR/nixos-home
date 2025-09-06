{
  config,
  batteryEnabled,
  ...
}:
{
  programs.hyprpanel = {
    enable = true;

    settings = {
      bar = {
        autoHide = "fullscreen";

        clock.format = "%a %d %b  %H:%M:%S";

        launcher = {
          autoDetectIcon = true;
          icon = "";
        };

        layouts = {
          "*" = {
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
            ]
            ++ (if batteryEnabled then [ "battery" ] else [ ])
            ++ [
              "notifications"
            ];
          };
        };

        workspaces = {
          ignored = "-\\d";
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
                command = "gpu-screen-recorder-gtk";
                tooltip = "Record";
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
        font = {
          name = "Ubuntu Nerd Font";
          size = "1.0rem";
        };
        bar = {
          floating = false;
          layer = "bottom";
          buttons.dashboard.icon = "#7eb9e3";
        };
      };

      wallpaper.enable = false;
    };
  };
}
