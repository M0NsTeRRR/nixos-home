{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      k = "kubectl";
    };

    history = {
      size = 10000;
      path = "$HOME/zsh/history";
    };
  };
}