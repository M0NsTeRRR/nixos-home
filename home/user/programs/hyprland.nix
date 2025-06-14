{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with pkgs.hyprlandPlugins; [
      hyprbars
      hyprexpo
    ];
    systemd.variables = [ "--all" ];
    settings = {
      source = "~/.config/hypr/macchiato.conf";

      exec-once = [
        "/usr/lib/polkit-kde-authentication-agent-1"
        "${pkgs.hyprpaper}/bin/hyprpaper" # wallpaper utility
        "${pkgs.hypridle}/bin/hypridle" # idle daemon
        "${pkgs.hyprlandPlugins.hyprbars}/bin/hyprbars"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      input = {
        kb_layout = "fr";
        kb_variant = "oss_latin9";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
          "tap-and-drag" = true;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      device = {
        name = "mouse";
        sensitivity = -0.5;
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Q, exec, ${pkgs.ghostty}/bin/ghostty"
        "$mainMod, C, killactive,"
        "$mainMod, L, exec, pidof ${pkgs.hyprlock}/bin/hyprlock || ${pkgs.hyprlock}/bin/hyprlock"
        "$mainMod, E, exec, ${pkgs.nemo}/bin/nemo"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, ${pkgs.rofi}/bin/rofi -show drun"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, I, hyprexpo:expo, toggle"
        ", PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -o $HOME/Pictures"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, ampersand, workspace, 1"
        "$mainMod, eacute, workspace, 2"
        "$mainMod, quotedbl, workspace, 3"
        "$mainMod, apostrophe, workspace, 4"
        "$mainMod, parenleft, workspace, 5"
        "$mainMod, minus, workspace, 6"
        "$mainMod, egrave, workspace, 7"
        "$mainMod, underscore, workspace, 8"
        "$mainMod, ccedilla, workspace, 9"
        "$mainMod, agrave, workspace, 0"
        "$mainMod SHIFT, ampersand, movetoworkspace, 1"
        "$mainMod SHIFT, eacute, movetoworkspace, 2"
        "$mainMod SHIFT, quotedbl, movetoworkspace, 3"
        "$mainMod SHIFT, apostrophe, movetoworkspace, 4"
        "$mainMod SHIFT, parenleft, movetoworkspace, 5"
        "$mainMod SHIFT, minus, movetoworkspace, 6"
        "$mainMod SHIFT, egrave, movetoworkspace, 7"
        "$mainMod SHIFT, underscore, movetoworkspace, 8"
        "$mainMod SHIFT, ccedilla, movetoworkspace, 9"
        "$mainMod SHIFT, agrave, movetoworkspace, 10"
        "$mainMod, tab, workspace, e+1"
      ];

      bindl = [
        ", switch:on:Lid Switch, exec, hyprctl dispatch dpms off"
        ", switch:off:Lid Switch, exec, hyprctl dispatch dpms on"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      plugin = {
        hyprbars = {
          bar_height = 34;
          bar_color = "rgba(36365601)";
          col.text = "rgba(b4befe)";
          bar_text_font = "SF Pro Display SemiBold";
          bar_text_size = 10;
          bar_text_align = "center";
          bar_title_enabled = true;
          bar_buttons_alignment = "left";
          bar_button_padding = 10;
          bar_padding = 13;
          bar_precedence_over_border = true;

          hyprbars-button = [
            "rgb(f38ba8),15,,${pkgs.hyprland}/bin/hyprctl dispatch killactive"
            "rgb(74c7ec),15,,${pkgs.hyprland}/bin/hyprctl dispatch togglefloating; hyp${pkgs.hyprland}/bin/hyprctl dispatch resizeactive exact 80% 80%; ${pkgs.hyprland}/bin/hyprctl dispatch centerwindow"
          ];
        };

        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(111111)";
          workspace_method = "center current";
          enable_gesture = true;
          gesture_fingers = 3;
          gesture_distance = 300;
          gesture_positive = true;
        };
      };
    };
  };
}
