{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wezterm   # terminal emulator
    starship  # shell prompt
  ];

  programs.starship.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      k = "kubectl";
    };
  };
}