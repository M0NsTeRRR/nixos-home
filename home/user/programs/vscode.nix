{ pkgs-unstable, username, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;
    profiles.default = {
      userSettings = {
        "telemetry.telemetryLevel" = "off";
        "terminal.integrated.initialHint" = false;
        "chat.agent.enabled" = false;
        "chat.commandCenter.enabled" = false;
        "update.showReleaseNotes" = false;
        "window.titleBarStyle" = "native";
        "files.dialog.defaultPath" = "/home/${username}/Github";
        "files.autoSave" = "onFocusChange";
        "editor.formatOnSave" = true;
        "git.defaultCloneDirectory" = "/home/${username}/Github";
        "git.confirmSync" = false;
        "git.autofetch" = true;
        "git.replaceTagsWhenPull" = true;
        "dev.containers.dockerPath" = "podman";
        "dev.containers.dockerComposePath" = "podman-compose";
        "dev.containers.dockerSocketPath" = "/var/run/podman/podman.sock";
        "containers.containerClient" = "com.microsoft.visualstudio.containers.podman";
        "containers.orchestratorClient" = "com.microsoft.visualstudio.orchestrators.podmancompose";
        "python.analysis.autoFormatStrings" = true;
        "python.analysis.autoImportCompletions" = true;
        "python.analysis.completeFunctionParens" = true;
        "python.analysis.typeCheckingMode" = "standard";
        "python.missingPackage.severity" = "Error";
        "python.testing.pytestEnabled" = true;
        "python.testing.pytestArgs" = [ "-vv" ];
        "continue.telemetryEnabled" = false;
      };

      extensions = with pkgs-unstable.vscode-extensions; [
        # remote
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-containers
        # go
        golang.go
        # rust
        rust-lang.rust-analyzer
        llvm-vs-code-extensions.lldb-dap
        ms-vscode.hexeditor
        # python
        ms-python.python
        ms-python.debugpy
        ms-python.vscode-pylance
        charliermarsh.ruff
        # kubernetes
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-azuretools.vscode-containers
        # presentation with plain Markdown
        marp-team.marp-vscode
        # AI
        continue.continue
        # misc
        eamodio.gitlens
        jnoortheen.nix-ide
        editorconfig.editorconfig
        redhat.vscode-yaml
        ms-vscode.makefile-tools
      ];
    };
  };
}
