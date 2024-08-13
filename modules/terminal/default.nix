{ pkgs, ... }:
{
  programs.starship.enable = true;
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
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };


  environment.systemPackages = with pkgs; [
    wezterm   # terminal emulator
    starship  # shell prompt
  ];
}