{ pkgs, ...}:
let
  # Unicornafk
  unicornafkCert = pkgs.fetchurl {
    url = "https://github.com/M0NsTeRRR/homelabv3-infra/blob/main/ssl/unicornafk.crt";
    sha256 = "13fdl3kqq39s9ixfbhv3hk7ggyygjg6lh1ls2js0q7hm87j9mp9f";
  };
in
{
  security.pki.certificateFiles = [
    "${unicornafkCert}/etc/ssl/certs/unicornafk.crt"
  ];
}