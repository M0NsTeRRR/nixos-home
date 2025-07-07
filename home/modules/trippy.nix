{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.trippy;

  tomlFormat = pkgs.formats.toml { };
in
{
  options.programs.trippy = {
    enable = lib.mkEnableOption "a network diagnostic tool";

    package = lib.mkPackageOption pkgs "trippy" { };

    enableBashIntegration = lib.hm.shell.mkBashIntegrationOption { inherit config; };

    enableFishIntegration = lib.hm.shell.mkFishIntegrationOption { inherit config; };

    enableZshIntegration = lib.hm.shell.mkZshIntegrationOption { inherit config; };

    settings = lib.mkOption {
      type = tomlFormat.type;
      default = { };
      example = {
        trippy = {
          mode = "tui";
          unprivileged = false;
          log-format = "pretty";
          log-filter = "trippy=debug";
          log-span-events = "off";
        };
      };
      description = ''
        Configuration written to
        {file}`$XDG_CONFIG_HOME/trippy/trippy.toml`.

        See <https://trippy.rs/reference/overview/>
        for the full list of options.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."trippy/trippy.toml" = lib.mkIf (cfg.settings != { }) {
      source = tomlFormat.generate "trippy-config" cfg.settings;
    };

    programs.bash.initExtra = lib.mkIf cfg.enableBashIntegration ''
      source <(${lib.getExe cfg.package} --generate bash)
    '';

    programs.fish.interactiveShellInit = lib.mkIf cfg.enableFishIntegration ''
      source <(${lib.getExe cfg.package} --generate fish)
    '';

    programs.zsh.initContent = lib.mkIf cfg.enableZshIntegration ''
      source <(${lib.getExe cfg.package} --generate zsh)
    '';
  };
}
