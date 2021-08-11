output "backend" {
  value = vault_azure_secret_backend.azure.path
}

output "role" {
  value = vault_azure_secret_backend_role.admin.role
}
