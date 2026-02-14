{ pkgs-unstable, ... }:
{
  programs.gemini-cli = {
    enable = true;
    package = pkgs-unstable.gemini-cli;
    settings = {
      privacy = {
        usageStatisticsEnabled = false;
      };
      security = {
        auth = {
          selectedType = "oauth-personal";
        };
      };
    };
  };
}
