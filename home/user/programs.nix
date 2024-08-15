{
  programs.home-manager.enable = true;
  
  wayland.windowManager.hyprland.enable = true;

  programs.git = {
    enable = true;
    userName = "Ludovic Ortega";
    userEmail = "ludovic.ortega@adminafk.fr";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      k = "kubectl";
    };
  };
  programs.starship.enable = true;

  programs.firefox.enable = true;
}