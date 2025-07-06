{ lib, pkgs, ... }:
{
  services.gpg-agent = {
    enable = true;
    pinentry.package = lib.mkForce pkgs.pinentry-qt;
    enableExtraSocket = true;
  };
}
