{ lib, pkgs-unstable, ... }:
{
  services.gpg-agent = {
    enable = true;
    pinentry.package = lib.mkForce pkgs-unstable.pinentry-qt;
    enableExtraSocket = true;
  };
}
