let scriptDir = ../script;
in
{
  home.file = {
    ".local/bin/rofi/off.sh" = {
      source = "${scriptDir}/rofi/off.sh";
      executable = true;
    };
  };
}