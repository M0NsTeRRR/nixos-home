{ pkgs, ... }:
let
  # Unicornafk
  unicornafkCert = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/M0NsTeRRR/homelabv3-infra/main/ssl/unicornafk.crt";
    sha256 = "i51H09zQ+Ff/zKhKSWbXJKa+2TzzX2nRu6K+zGY7glA=";
  };
in
{
  security.pki.certificateFiles = [ "${unicornafkCert}" ];
}
