{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
    "vscode-extension-ms-vscode-remote-remote-ssh"
    "vscode-extension-ms-vscode-remote-remote-containers"
  ];
  
  userSettings = {
    "files.autoSave" = "on";
  };

  programs.vscode = {
    enable = true;
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
      charliermarsh.ruff
      # kubernetes
      ms-kubernetes-tools.vscode-kubernetes-tools
      # misc
      redhat.vscode-yaml
      ms-vscode.makefile-tools
    ];
  };
}