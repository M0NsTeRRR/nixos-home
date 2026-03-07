{ pkgs-unstable, ... }:
{
  programs.opencode = {
    enable = true;
    package = pkgs-unstable.opencode;
    settings = {
      theme = "opencode";
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
      plugin = [ "opencode-gemini-auth@latest" ];
      enabled_providers = [
        "anthropic"
        "google"
      ];
    };
  };
}
