#################################################################
# KEY VAULT SECRETS
#################################################################

resource "azurerm_key_vault_secret" "this" {
  for_each     = { for secret in var.secrets : secret.name => secret }
  name         = each.value.name
  value        = each.value.value
  content_type = each.value.content_type

  key_vault_id    = var.key_vault_id
  not_before_date = each.value.not_before_date
  expiration_date = each.value.expiration_date

  tags = each.value.tags

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}