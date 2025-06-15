{
  lib,
  guiEnabled,
  nvidiaEnabled,
  ...
}:
let
  guiSessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    GTK_USE_PORTAL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    SDL_VIDEODRIVER = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  nvidiaSessionVariables = {
    WEBKIT_DISABLE_DMABUF_RENDERER = "1";
  };

  defaultSessionVariables = {
    REQUESTS_CA_BUNDLE = "/etc/ssl/certs/ca-certificates.crt";
  };
in
{
  home.sessionVariables =
    defaultSessionVariables
    // lib.optionalAttrs guiEnabled guiSessionVariables
    // lib.optionalAttrs nvidiaEnabled nvidiaSessionVariables;
}
