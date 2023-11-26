resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "5.51.4"
  values           = [file("${path.module}/values/argocd.yaml")]
}

#resource "kubernetes_ingress" "external_argo_ui" {
#  wait_for_load_balancer = true
#  metadata {
#    name      = "external-argo-ui"
#    namespace = "argocd"
#    annotations = {
#      "kubernetes.io/ingress.class" = "nginx"
#    }
#  }

#  depends_on = [helm_release.external_nginx, helm_release.argocd]
#  spec {
#    rule {
#      host = ""
#      http {
#        path {
#          path = "/argocd"
#          backend {
#            service_name = "argocd-server"
#            service_port = 80
#          }
#        }
#      }
#    }
#  }
#}

#output "load_balancer_hostname" {
#  value = kubernetes_ingress.external_argo_ui.status.0.load_balancer.0.ingress.0.hostname
#}
