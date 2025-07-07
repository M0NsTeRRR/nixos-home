let
  browser = "firefox.desktop";
  editor = "vscode.desktop";
  telegram = "org.telegram.desktop.desktop";
  image = "imv.desktop";
in
{
  xdg.configFile."mimeapps.list".force = true;

  xdg = {
    userDirs.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = browser;
        "text/html" = browser;
        "text/xml" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/unknown" = browser;

        "text/*" = editor;
        "text/plain" = editor;
        "application/x-zerosize" = editor; # Empty files
        "application/x-trash" = editor; # Backup files
        "application/json" = editor;
        "text/markdown" = editor;

        "inode/directory" = "nemo.desktop";

        "image/png" = image;

        "x-scheme-handler/tg" = telegram;
        "x-scheme-handler/tonsite" = telegram;
      };
    };
  };
}
