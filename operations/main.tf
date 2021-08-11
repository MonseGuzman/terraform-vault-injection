provider "vault" {
  # Configuration options
  address = "http://127.0.0.1:8200"
  # token   = ""
}

data "vault_azure_access_credentials" "creds" {
  backend                     = "azure"
  role                        = "generated_role"
  validate_creds              = true
  num_sequential_successes    = 8
  num_seconds_between_tests   = 7
  max_cred_validation_seconds = 1200 // 20 minutes
}

provider "azurerm" {
  features {}
  client_id     = data.vault_azure_access_credentials.creds.client_id
  client_secret = data.vault_azure_access_credentials.creds.client_secret
}

data "azurerm_resource_group" "rg" {
  name = "monserrat-guzman"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-injection"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  address_space = ["10.0.0.0/16"]
}
