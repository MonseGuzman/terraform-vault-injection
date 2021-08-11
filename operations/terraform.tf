terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "2.22.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.70.0"
    }
  }
}