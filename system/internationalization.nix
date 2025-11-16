{
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "fr";

  services = {
    xserver = {
      enable = false;
      xkb.layout = "fr";
      xkb.variant = "oss_latin9";
    };
  };
}
