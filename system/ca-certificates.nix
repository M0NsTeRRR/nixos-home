{ pkgs, ... }:
let
  # Unicornafk
  unicornafkCert = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/M0NsTeRRR/homelabv3-infra/main/ssl/unicornafk.crt";
    sha256 = "3a3lSEpgBXOreo/50esJYUP2UGHibr+RbtV1bBLG1eA=";
  };
in
{
  security.pki.certificateFiles = [ "${unicornafkCert}" ];
}
