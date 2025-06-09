{ pkgs, ... }:
{
  console = {
    earlySetup = true;
    packages = [ pkgs.terminus_font ];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v32n.psf.gz";
  };
}
