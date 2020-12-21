terraform {
  required_providers {
    azuread = ">= 1.1"
    azurerm = ">= 2.41.0"
    random  = ">= 3.0"
    helm    = ">= 2.0.1"
    kubernetes = {
      source  = "kubernetes"
      version = ">= 1.13.1"
    }
  }
}

locals {
  tags = merge(var.tags, {
    cluster_name = var.prefix
  })
  ns_labels = {
    importance = "high",
    kind       = "system",
  }
}

resource "azurerm_resource_group" "cluster" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = local.tags
}
