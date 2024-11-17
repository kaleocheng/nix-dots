{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ansible
    terraform

    kubectl
    docker-compose
    kustomize # k9s
    (wrapHelm kubernetes-helm {
      plugins = with kubernetes-helmPlugins; [
        helm-diff
      ];
    })

    teleport
    argocd
    fluxcd
    vault
    supabase-cli
    awscli2
    redis
    colmena
  ];
}
