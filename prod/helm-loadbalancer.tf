provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "arn:aws:eks:us-east-1:815125368722:cluster/prod-eks-wjOTgnby"
  }
}

resource "helm_release" "aws-load-balancer-controller" {
  name       = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace = "kube-system"

  set {
    name  = "clusterName"
    value = local.cluster_name
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "image.repository"
    value = format("602401143452.dkr.ecr.%s.amazonaws.com/amazon/aws-load-balancer-controller",var.region)
  }

  set {
    name  = "image.tag"
    value = "v2.4.2"
  }

}

