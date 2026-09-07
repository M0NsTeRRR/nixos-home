{
  mySystem,
  pkgs-unstable,
  ...
}:
{
  programs.noctalia = {
    enable = true;

    settings = {
      bar.default = {
        center = [ "taskbar" ];
        end = [
          "input_volume"
          "volume"
          "bluetooth"
          "network"
          "brightness"
          "clock"
          "battery"
          "notifications"
          "session"
        ];
        margin_edge = 10;
        margin_ends = 20;
        radius = 0;
        radius_bottom_left = 15;
        radius_bottom_right = 15;
        radius_top_left = 15;
        radius_top_right = 15;
        start = [
          "control-center"
          "launcher"
          "privacy"
        ];
      };

      calendar = {
        enabled = true;
      };

      control_center.calendar = {
        show_events_card = true;
        show_week_numbers = true;
      };

      desktop_widgets = {
        schema_version = 2;
        widget_order = [ ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget = { };
      };

      location = {
        address = "Lyon,France";
      };

      lockscreen_widgets = {
        enabled = false;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@DP-2"
          "lockscreen-login-box@DP-1"
        ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget."lockscreen-login-box@DP-1" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 1280.0;
          cy = 1258.0;
          output = "DP-1";
          placement_height = 1440.0;
          placement_width = 2560.0;
          rotation = 0.0;
          type = "login_box";

          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };

        widget."lockscreen-login-box@DP-2" = {
          box_height = 196.0;
          box_width = 810.0;
          cx = 1280.0;
          cy = 1258.0;
          output = "DP-2";
          placement_height = 1440.0;
          placement_width = 2560.0;
          rotation = 0.0;
          type = "login_box";

          settings = {
            background_color = "surface_variant";
            background_opacity = 0.88;
            background_radius = 12.0;
            center_password_text = false;
            input_opacity = 1.0;
            input_radius = 6.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_unlock_hint = true;
            show_weather = true;
          };
        };
      };

      osd = {
        kinds = {
          media = false;
        };
      };

      plugins = {
        auto_update = "official";

        source = [
          {
            enabled = false;
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            name = "official";
          }
          {
            enabled = false;
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            name = "community";
          }
        ];
      };

      shell = {
        avatar_path = "/home/${mySystem.user.name}/.config/wallpapers/avatar.png";
        launcher = {
          compact = true;
          fetch_exchange_rates = false;
        };
      };

      theme = {
        builtin = "Tokyo-Night";

        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };

      wallpaper = {
        directory = "/home/${mySystem.user.name}/.config/wallpapers";

        default.path = "/home/${mySystem.user.name}/.config/wallpapers/background.jpg";
      };

      widget = {
        control-center = {
          custom_image = "${pkgs-unstable.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        };
        network = {
          show_vpn_label = true;
          vpn_status = "both";
        };
        privacy = {
          active_color = "on_surface";
        };
        taskbar = {
          capsule_radius = 3;
          focused_output_only = true;
          group_by_workspace = true;
          group_single_icon_per_app = true;
        };
      };
    };
  };
}
