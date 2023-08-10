provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "rg-terraform-northeu-001"
  location = "northeurope"
}

module "key-vault" {
  source = "Retoxx-dev/keyvault/azurerm"
  version = "1.0.0"

  name                = "kv-terraform-northeu-001"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  sku_name = "standard"

  public_network_access_enabled = false

  self_service_principal_id = "00000000-0000-0000-0000-000000000000"

  network_acls = {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = ["IP1"]
    virtual_network_subnet_ids = []
  }
}

module "key-vault-secrets" {
    source = "Retoxx-dev/keyvault-secrets/azurerm"
    version = "1.0.0"

    key_vault_id = module.key-vault.id

    secrets = [
        {
            name = "Ultra Secret"
        },
        {
            name = "Super Secret"
            content_type = "text/plain"
            tags = {
                "Environment" = "Dev"
            }
        }
    ]
}