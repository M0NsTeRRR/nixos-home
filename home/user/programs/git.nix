{
  programs.git = {
    enable = true;
    userName = "Ludovic Ortega";
    userEmail = "ludovic.ortega@adminafk.fr";
    signing = {
      key = "81E390A404C7D583A6D6958E22F86C9B1BEC401D";
      signByDefault = true;
    };
    extraConfig = {
      core.editor = "vim";
      ui.color = true;
      push.autoSetupRemote = true;
    };
  };
}
