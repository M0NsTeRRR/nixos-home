{ lib, pkgs, ... }:
{
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryPackage = lib.mkForce pkgs.pinentry-qt;
  };
}
