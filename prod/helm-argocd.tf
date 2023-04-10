resource "helm_release" "argocd" {
    name             = "argocd"
    create_namespace = "true"
    chart            = "argo-cd"
    namespace        = "argocd"
    version          = "5.24.0"
    repository       = "https://argoproj.github.io/argo-helm"
    set {
        name  = "server.service.type"
        value = "LoadBalancer"
    }
}