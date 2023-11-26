resource "azurerm_resource_group" "this" {
  name     = local.resource_group
  location = local.region
}
