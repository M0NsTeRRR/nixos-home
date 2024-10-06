{ pkgs }:
{
  pkgs.stdenv.mkDerivation {
      name = "sddm-theme";
      src = pkgs.fetchFromGitHub {
          owner = "keyitdev";
          repo = "sddm-astronaut-theme";
          rev = "44fb2ff2281933fee49405b77e1a27214e61f45c";
          sha256 = "1iiq9l03n1zvnidnjl1vc0vzz4i6xd82rp3b4nq98w45sgkc29dw";
      };
      installPhase = ''
          mkdir -p $out
          cp -R ./* $out/
      '';
  }
}