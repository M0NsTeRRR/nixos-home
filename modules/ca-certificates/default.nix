{ pkgs, ...}:
let
  # Unicornafk
  unicornafkCert = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/M0NsTeRRR/homelabv3-infra/main/ssl/unicornafk.crt";
    sha256 = "jdwZkCSiJwr8Ce2ut55g6x9F0SJY0ddNvturQhkzYiE=";
  };
in
{
  security.pki.certificateFiles = [
    "${unicornafkCert}"
  ];
}