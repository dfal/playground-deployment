data "azurerm_kubernetes_cluster" "this" {
  name                = "${local.env}-${local.aks_name}"
  resource_group_name = azurerm_resource_group.this.name
  depends_on          = [azurerm_kubernetes_cluster.this]
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.this.kube_config.0.host
    client_key             = base64decode(data.azurerm_kubernetes_cluster.this.kube_config.0.client_key)
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.this.kube_config.0.client_certificate)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.this.kube_config.0.cluster_ca_certificate)
  }
}

provider "kubectl" {
  host                   = data.azurerm_kubernetes_cluster.this.kube_config[0].host
  client_key             = base64decode(data.azurerm_kubernetes_cluster.this.kube_config[0].client_key)
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.this.kube_config[0].client_certificate)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate)
  load_config_file       = false
}

resource "helm_release" "external_nginx" {
  name             = "external"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress"
  create_namespace = true
  version          = "4.8.4"
  values           = [file("${path.module}/values/ingress.yaml")]
}
