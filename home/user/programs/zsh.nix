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

    initExtra = ''
      ### ctrl+arrows
      bindkey "\e[1;5C" forward-word
      bindkey "\e[1;5D" backward-word

      ### ctrl+delete
      bindkey "\e[3;5~" kill-word

      ### ctrl+backspace
      bindkey "^H" backward-kill-word

      ### ctrl+shift+delete
      bindkey "\e[3;6~" kill-line
    '';
  };
}
