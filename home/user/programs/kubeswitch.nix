{ pkgs-unstable, ... }:
{
  programs.kubeswitch = {
    enable = true;
    settings = {
      kind = "SwitchConfig";
      version = "v1alpha1";
      kubeconfigName = "*";
      kubeconfigStores = [
        {
          kind = "filesystem";
          paths = [
            "~/.kube/static-kubeconfigs/"
            "~/.kube/config"
          ];
        }
      ];
    };
  };
}
