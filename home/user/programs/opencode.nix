{ pkgs-unstable, ... }:
{
  home.packages = [ pkgs-unstable.claude-code ];

  programs.opencode = {
    enable = true;
    package = pkgs-unstable.opencode;
    settings = {
      share = "disabled";
      autoupdate = false;
      permission = {
        "*" = "ask";
        read = {
          "*" = "allow";
          "*.env" = "ask";
        };
        edit = "ask";
        glob = "allow";
        grep = "allow";
        list = "allow";
        bash = "ask";
        task = "ask";
        skill = "ask";
        lsp = "allow";
        todoread = "allow";
        todowrite = "ask";
        webfetch = "ask";
        websearch = "ask";
        codesearch = "ask";
        external_directory = "ask";
        doom_loop = "ask";
      };
      plugin = [
        "@dietrichgebert/ponytail:v4.10.0"
        "@obra/superpowers:v6.4.2"
        "@openchamber/opencode-claude@0.14"
      ];
      enabled_providers = [
        "claude-code"
      ];
    };

    tui = {
      theme = "opencode";
    };
  };
}
