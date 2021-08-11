provider "vault" {}

resource "vault_azure_secret_backend" "azure" {
  subscription_id = var.arm_subscription_id # spn credentials 
  tenant_id       = var.arm_tenant_id
  client_id       = var.arm_client_id
  client_secret   = var.arm_client_secret
  #   environment     = "AzurePublicCloud"
}

resource "vault_azure_secret_backend_role" "admin" {
  backend               = vault_azure_secret_backend.azure.path
  role                  = "generated_role"
  ttl                   = 300
  max_ttl               = 600
  application_object_id = "76b2d80e-f476-4039-b150-61af7bc72c37" # spn object

  #   azure_roles {
  #     role_name = "Reader"
  #     scope =  "/subscriptions/${var.arm_subscription_id}/resourceGroups/azure-vault-group"
  #   }
}