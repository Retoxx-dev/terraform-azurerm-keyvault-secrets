# terraform-azurerm-keyvault-secrets
Terraform module for Azure Key Vault Secrets

Azure Key Vault is a cloud-based service provided by Microsoft Azure that enables you to securely store and manage cryptographic keys, secrets, and certificates.

Using Azure Key Vault, you can protect your sensitive application data and maintain control over access to your data by storing it in a central location that's highly available, scalable, and durable. Key Vault is designed to simplify key management and streamline access to your cryptographic keys and secrets, which can be used by your applications and services in Azure or outside of Azure.

This module creates:
- Azure Key Vault Secrets

This module WON'T create:
- Azure Key Vault


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.65 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | (Required) The ID of the Key Vault where the Secret should be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | (Required) A list of Key Vault Secrets to create. | <pre>list(object({<br>    name            = string<br>    value           = optional(string, " ")<br>    content_type    = optional(string, null)<br>    not_before_date = optional(string, null)<br>    expiration_date = optional(string, null)<br>    tags            = optional(map(string), null)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->