{ pkgs-unstable, ... }:
{
  programs.zsh = {
    enable = true;
    package = pkgs-unstable.zsh;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cat = "bat --paging=never";
      watch = "hwatch";
      ls = "eza";
      k = "kubectl";
      top = "btop";
      jq = "yq";
    };

    history = {
      size = 10000;
      path = "$HOME/zsh/history";
    };

    initContent = ''
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
