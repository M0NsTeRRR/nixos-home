{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    userSettings = {
      "window.titleBarStyle" = "native";
      "files.autoSave" = "onFocusChange";
      "editor.formatOnSave" = true;
      "git.confirmSync" = false;
      "dev.containers.dockerPath" = "podman";
      "dev.containers.dockerComposePath" = "podman-compose";
      "dev.containers.dockerSocketPath" = "/var/run/podman/podman.sock";
    };
    extensions = with pkgs.vscode-extensions; [
      # remote
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      # go
      golang.go
      # rust
      rust-lang.rust-analyzer
      # python
      ms-python.python
      ms-python.debugpy
      charliermarsh.ruff
      # kubernetes
      ms-kubernetes-tools.vscode-kubernetes-tools
      # misc
      eamodio.gitlens
      jnoortheen.nix-ide
      editorconfig.editorconfig
      redhat.vscode-yaml
      ms-vscode.makefile-tools
    ];
  };
}
