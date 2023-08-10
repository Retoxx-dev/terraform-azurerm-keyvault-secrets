#################################################################
# KEY VAULT SECRETS
#################################################################

variable "key_vault_id" {
  type        = string
  description = "(Required) The ID of the Key Vault where the Secret should be created. Changing this forces a new resource to be created."
}

variable "secrets" {
  type = list(object({
    name            = string
    value           = optional(string, " ")
    content_type    = optional(string, null)
    not_before_date = optional(string, null)
    expiration_date = optional(string, null)
    tags            = optional(map(string), null)
  }))
  description = "(Required) A list of Key Vault Secrets to create."
}