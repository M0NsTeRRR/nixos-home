{ pkgs, pkgs-unstable, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with pkgs.hyprlandPlugins; [ ];
    systemd.variables = [ "--all" ];
    settings = {
      exec-once = [
        "/usr/lib/polkit-kde-authentication-agent-1"
        "${pkgs-unstable.noctalia-shell}/bin/noctalia-shell" # idle daemon
        "${pkgs.hypridle}/bin/hypridle" # idle daemon
        "[workspace 9 silent] keepassxc"
        "[workspace 9 silent] discord"
        "[workspace 0 silent] firefox"
      ];

      ecosystem = {
        no_update_news = false;
        no_donation_nag = false;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
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

      dwindle = {
        force_split = 2;
        preserve_split = true;
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

      device = {
        name = "mouse";
        sensitivity = -0.5;
      };

      "$mainMod" = "SUPER";

      bind = [
        ", PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -o $HOME/Pictures"
        "$mainMod, A, exec, ${pkgs-unstable.noctalia-shell}/bin/noctalia-shell ipc call launcher toggle"
        "$mainMod, C, killactive,"
        "$mainMod, E, exec, ${pkgs.nemo}/bin/nemo"
        "$mainMod, J, togglesplit,"
        "$mainMod, K, forcekillactive,"
        "$mainMod, L, exec, ${pkgs-unstable.noctalia-shell}/bin/noctalia-shell ipc call lockScreen lock"
        "$mainMod, P, pseudo,"
        "$mainMod, Q, exec, ${pkgs.ghostty}/bin/ghostty"
        "$mainMod, V, exec, ${pkgs-unstable.noctalia-shell}/bin/noctalia-shell ipc call launcher clipboard"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod, S, togglespecialworkspace, 1"
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
        "$mainMod SHIFT, S, movetoworkspace, special"
        "$mainMod, tab, workspace, e+1"
      ];

      bindl = [
        ", switch:on:Lid Switch, exec, hyprctl dispatch dpms off"
        ", switch:off:Lid Switch, exec, hyprctl dispatch dpms on"
      ];

      plugin = { };

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      workspace = [
        "1, persistent:true"
        "2, persistent:true"
        "3, persistent:true"
        "4, persistent:true"
        "5, persistent:true"
        "6, persistent:true"
        "7, persistent:true"
        "8, persistent:true"
        "9, persistent:true"
        "10, persistent:true"
      ];
    };
  };
}
