{ pkgs-unstable, ... }:
{
  programs.claude-code = {
    enable = true;
    package = pkgs-unstable.claude-code;
    settings = {
      attribution = {
        commit = "";
        pr = "";
      };
      env = {
        CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY = "1";
        DISABLE_TELEMETRY = "1";
        DISABLE_ERROR_REPORTING = "1";
        DISABLE_NON_ESSENTIAL_MODEL_CALLS = "1";
      };
      theme = "dark";
    };
  };

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
