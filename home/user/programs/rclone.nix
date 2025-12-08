{ pkgs-unstable, ... }:
{
  programs.rclone = {
    enable = true;
    package = pkgs-unstable.rclone;
    remotes = {
      nas_s3 = {
        config = {
          endpoint = "https://nas.unicornafk.fr:30292";
          env_auth = true;
          location_constraint = "";
          provider = "Minio";
          region = "eu-west-1";
          server_side_encryption = "";
          type = "s3";
        };
      };
    };
  };
}
