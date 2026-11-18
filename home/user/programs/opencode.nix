{ pkgs, pkgs-unstable, ... }:
let
  anthropic-skills = pkgs.fetchFromGitHub {
    owner = "anthropics";
    repo = "skills";
    rev = "e4bb5d960d87126ff3b3a8af1a104b7db67560ba";
    hash = "sha256-Gr9LatjawHHK9uKpoclWoiDHZ0NTpP3/4Pmeatl8p/Q=";
  };
in
{
  home.packages = [ pkgs-unstable.claude-code ];

  programs.opencode = {
    enable = true;
    package = pkgs-unstable.opencode;
    settings = {
      share = "disabled";
      autoupdate = false;

      permissions = [
        {
          action = "*";
          resource = "*";
          effect = "ask";
        }

        {
          action = "read";
          resource = "*";
          effect = "allow";
        }
        {
          action = "edit";
          resource = "*";
          effect = "ask";
        }
        {
          action = "glob";
          resource = "*";
          effect = "allow";
        }
        {
          action = "grep";
          resource = "*";
          effect = "allow";
        }
        {
          action = "shell";
          resource = "*";
          effect = "ask";
        }
        {
          action = "subagent";
          resource = "*";
          effect = "ask";
        }
        {
          action = "skill";
          resource = "*";
          effect = "ask";
        }
        {
          action = "webfetch";
          resource = "*";
          effect = "ask";
        }
        {
          action = "websearch";
          resource = "*";
          effect = "ask";
        }
        {
          action = "external_directory";
          resource = "*";
          effect = "ask";
        }
        # env file
        {
          action = "read";
          resource = "*.env";
          effect = "ask";
        }
        {
          action = "read";
          resource = "*.env.*";
          effect = "ask";
        }
        {
          action = "read";
          resource = "*.env.example";
          effect = "allow";
        }
      ];

      plugins = [
        "@dietrichgebert/ponytail@v5.3.3"
        "superpowers@git+https://github.com/obra/superpowers.git#v7.0.2"
      ];
    };
  };

  xdg.configFile."opencode/skills/skill-creator".source = "${anthropic-skills}/skills/skill-creator";

  xdg.configFile."opencode/cli.json".text = builtins.toJSON {
    "$schema" = "https://opencode.ai/v2/cli.json";
    theme.name = "opencode";
  };
}
