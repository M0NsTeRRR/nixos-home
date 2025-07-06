{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.viddy;

  tomlFormat = pkgs.formats.toml { };
in
{
  options.programs.viddy = {
    enable = lib.mkEnableOption "a modern watch command";

    package = lib.mkPackageOption pkgs "viddy" { };

    settings = lib.mkOption {
      type = tomlFormat.type;
      default = { };
      example = {
        general = {
          no_shell = false;
          shell = "zsh";
          shell_options = "";
          skip_empty_diffs = false;
          disable_mouse = true;
        };
      };
      description = ''
        Configuration written to
        {file}`$XDG_CONFIG_HOME/viddy/viddy.toml`.

        See <https://github.com/sachaos/viddy?tab=readme-ov-file#configuration>
        for the full list of options.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."viddy/viddy.toml" = lib.mkIf (cfg.settings != { }) {
      source = tomlFormat.generate "viddy-config" cfg.settings;
    };
  };
}
