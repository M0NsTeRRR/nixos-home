{ pkgs-unstable, ... }:
{
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
      ];
      enabled_providers = [
        "anthropic"
      ];
    };

    tui = {
      theme = "opencode";
    };
  };
}
