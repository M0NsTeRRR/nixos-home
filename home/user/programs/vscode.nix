{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    userSettings = {
      "files.autoSave" = "afterDelay";
      "dev.containers.dockerPath" = "podman";
      "dev.containers.dockerComposePath" = "podman-compose";
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
      redhat.vscode-yaml
      ms-vscode.makefile-tools
    ];
  };
}
