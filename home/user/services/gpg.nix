{ lib, pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    pinentryPackage = lib.mkForce pkgs.pinentry-qt;
  };
}
