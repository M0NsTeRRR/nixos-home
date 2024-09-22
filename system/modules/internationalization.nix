{
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";

  console.keyMap = "fr";

  services = {
    xserver = {
      enable = false;
      xkb.layout = "fr";
      xkb.variant = "oss_latin9";
    };
  };
}
