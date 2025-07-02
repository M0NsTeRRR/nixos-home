{ pkgs-unstable, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs-unstable.firefox;
    languagePacks = [
      "fr"
      "en-US"
    ];

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.tabs.inTitlebar" = 0;

          # Firefox 75+ remembers the last workspace it was opened on as part of its session management.
          # This is annoying, because I can have a blank workspace, click Firefox from the launcher, and
          # then have Firefox open on some other workspace.
          "widget.disable-workspace-management" = true;

          # fix the file picker not opening
          "widget.use-xdg-desktop-portal.file-picker" = 0;

          # disable translation popup panel
          "browser.translations.automaticallyPopup" = false;

          # tell websites not to sell or share my data
          "privacy.globalprivacycontrol.enabled" = true;

          # disable clipboard events for annoying websites that block them
          "dom.event.clipboardevents.enabled" = false;
        };
      };
    };

    # https://mozilla.github.io/policy-templates/
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };
      DisablePocket = true;
      DisableFirefoxScreenshots = true;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "always";
      DisableFormHistory = true;
      DisplayMenuBar = "default-off";
      SearchBar = "unified";
      ShowHomeButton = true;
      SearchEngines = {
        Default = "DuckDuckGo";
        PreventInstalls = true;
      };
      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        Locked = true;
      };
      ExtensionUpdate = true;
      HardwareAcceleration = true;
      Permissions = {
        Camera = {
          BlockNewRequests = true;
          Locked = false;
        };
        Microphone = {
          BlockNewRequests = true;
          Locked = false;
        };
        Location = {
          BlockNewRequests = true;
          Locked = false;
        };
        Notifications = {
          BlockNewRequests = true;
          Locked = false;
        };
        Autoplay = {
          Default = "block-audio-video";
          Locked = false;
        };
      };
      PictureInPicture = {
        Enabled = true;
        Locked = false;
      };
      PopupBlocking = {
        Default = true;
        Locked = false;
      };
      RequestedLocales = "fr,fr-FR";

      ExtensionSettings = {
        "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        # extension id can be found in about:support
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # keepassxc
        "keepassxc-browser@keepassxc.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
          installation_mode = "force_installed";
        };
        # consent-o-matic
        "gdpr@cavi.au.dk" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
