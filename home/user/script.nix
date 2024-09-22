let
  scriptDir = ../script;
in
{
  home.file = {
    ".script/bluetooth/toogle.sh" = {
      source = "${scriptDir}/bluetooth/toogle.sh";
      executable = true;
    };
  };
}
