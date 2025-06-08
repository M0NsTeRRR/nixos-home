{ lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    coreutils
    wslu
    socat
  ];

  systemd.user.services.ssh-agent-proxy = {
    Unit = {
      Description = "Windows SSH agent proxy";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Environment = [
        "PATH=${
          lib.makeBinPath [
            pkgs.wslu
            pkgs.coreutils
            pkgs.gnused
            pkgs.gnugrep
            pkgs.bash
          ]
        }"
      ];
      ExecStartPre = [
        "${pkgs.coreutils}/bin/mkdir -p /mnt/wsl"
        "${pkgs.coreutils}/bin/rm -f /mnt/wsl/ssh-agent.sock"
      ];
      ExecStart = "${pkgs.writeShellScript "ssh-agent-proxy" ''
        set -x  # Enable debug output

        # Get Windows username using wslvar
        WIN_USER="$("${pkgs.wslu}/bin/wslvar" USERNAME 2>/dev/null || echo $USER)"

        # Check common npiperelay locations
        NPIPE_PATHS=(
          "/mnt/c/Users/$WIN_USER/AppData/Local/Microsoft/WinGet/Links/npiperelay.exe"
          "/mnt/c/ProgramData/chocolatey/bin/npiperelay.exe"
          "/mnt/c/Users/$WIN_USER/.wsl/npiperelay.exe"
        )

        NPIPE_PATH=""
        for path in "''${NPIPE_PATHS[@]}"; do
          echo "Checking npiperelay at: $path"
          if [ -f "$path" ]; then
            NPIPE_PATH="$path"
            break
          fi
        done

        if [ -z "$NPIPE_PATH" ]; then
          echo "npiperelay.exe not found in expected locations!"
          exit 1
        fi

        echo "Using npiperelay from: $NPIPE_PATH"

        exec ${pkgs.socat}/bin/socat -d UNIX-LISTEN:/mnt/wsl/ssh-agent.sock,fork,mode=600 \
          EXEC:"$NPIPE_PATH -ei -s //./pipe/openssh-ssh-agent",nofork
      ''}";
      Type = "simple";
      Restart = "always";
      RestartSec = "5";
    };
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "/mnt/wsl/ssh-agent.sock";
  };
}
