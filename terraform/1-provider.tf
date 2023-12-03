provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.83.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">=2.12.1"
    }
  }
}
