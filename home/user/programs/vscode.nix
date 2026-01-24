{ pkgs-unstable, username, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;
    profiles.default = {
      userSettings = {
        "chat.agent.enabled" = false;
        "chat.commandCenter.enabled" = false;
        "containers.containerClient" = "com.microsoft.visualstudio.containers.podman";
        "containers.orchestratorClient" = "com.microsoft.visualstudio.orchestrators.podmancompose";
        "dev.containers.dockerComposePath" = "podman-compose";
        "dev.containers.dockerPath" = "podman";
        "dev.containers.dockerSocketPath" = "/var/run/podman/podman.sock";
        "editor.formatOnSave" = true;
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onFocusChange";
        "files.dialog.defaultPath" = "/home/${username}/Github";
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.defaultCloneDirectory" = "/home/${username}/Github";
        "git.replaceTagsWhenPull" = true;
        "python.analysis.autoImportCompletions" = true;
        "python.analysis.autoFormatStrings" = true;
        "python.analysis.completeFunctionParens" = true;
        "python.analysis.typeCheckingMode" = "standard";
        "python.languageServer" = "None";
        "python.missingPackage.severity" = "Error";
        "python.testing.pytestArgs" = [ "-vv" ];
        "python.testing.pytestEnabled" = true;
        "remote.defaultExtensionsIfInstalledLocally" = [ ];
        "telemetry.editStats.enabled" = false;
        "telemetry.feedback.enabled" = false;
        "telemetry.telemetryLevel" = "off";
        "terminal.integrated.initialHint" = false;
        "terminal.integrated.suggest.enabled" = false;
        "update.mode" = null;
        "update.showReleaseNotes" = false;
        "window.titleBarStyle" = "native";
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
        # astral-sh.ty
        charliermarsh.ruff
        # kubernetes
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-azuretools.vscode-containers
        # presentation with plain Markdown
        marp-team.marp-vscode
        # misc
        eamodio.gitlens
        jnoortheen.nix-ide
        editorconfig.editorconfig
        redhat.vscode-yaml
        # tombi-toml.tombi
        ms-vscode.makefile-tools
      ];
    };
  };
}
