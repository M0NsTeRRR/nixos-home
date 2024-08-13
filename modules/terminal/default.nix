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

    plugins = with pkgs; [
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.8.0";
          sha256 = "1yl8zdip1z9inp280sfa5byjbf2vqh2iazsycar987khjsi5d5w8";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
    ];
  };
}