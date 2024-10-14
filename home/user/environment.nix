{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";

    # https://wiki.hyprland.org/Configuring/Environment-variables/
    CLUTTER_BACKEND = "waland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    GTK_USE_PORTAL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    SDL_VIDEODRIVER = "wayland";

    # firefox
    MOZ_ENABLE_WAYLAND = "1";

    # Python SSL self signed certs
    REQUESTS_CA_BUNDLE = "/etc/ssl/certs/ca-certificates.crt";
  };
}
