let scriptDir = ../script;
in
{
  home.file = {
    ".script/dunst/pause.sh" = {
      source = "${scriptDir}/dunst/pause.sh";
      executable = true;
    };
    ".script/bluetooth/toogle.sh" = {
      source = "${scriptDir}/bluetooth/toogle.sh";
      executable = true;
    };
  };
}