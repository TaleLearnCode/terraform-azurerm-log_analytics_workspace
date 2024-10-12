# #############################################################################
# Variables
# #############################################################################

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which the Log Analytics Workspace will be created."
}

variable "allow_resouce_only_permissions" {
  type        = bool
  default     = true
  description = "Specifies whether the Log Analytics Workspace allows user accessing data associated with the resources they have permission tov ewi witout permission to thw workspace. The default is true."
}

variable "local_authentication_disabled" {
  type        = bool
  default     = false
  description = "Specifies whether the Log Analytics Workspace should enforce authentication using Azure AD. The default is false."
}

variable "sku" {
  type        = string
  default     = "PerGB2018"
  description = "The SKU of the Log Analytics Workspace. Possible values are `PerNode`, `Premium`, `Standalone`, and `PerGB2018`. The default is `PerGB2018`."
  validation {
    condition = can(regex("^(PerNode|Premium|Standalone|PerGB2018)$", var.sku))
    error_message = "The SKU must be one of 'PerNode', 'Premium', 'Standalone', or 'PerGB2018'."
  }
}

variable "retention_in_days" {
  type        = number
  default     = 30
  description = "The retention period for the logs in days. The default is 30 days."
}

variable "daily_quota_gb" {
  type        = number
  default     = -1
  description = "The daily data volume cap in GB. The default is -1 (unlimited)."
}

variable "identity_type" {
  type = string
  default = "SystemAssigned"
  description = "The type of Managed Service Identity to be used for the Storage Account. Possible values are 'SystemAssigned', 'UserAssigned', 'SystemAssigned, UserAssigned'. Defaults to `SystemAssigned`."
}

variable "identity_ids" {
  type = list(string)
  default = []
  description = "The list of User Assigned Managed Service Identity IDs to be used for the Storage Account. Defaults to `[]`."
}

variable "internet_ingestion_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the Log Analytics Workspace should allow direct internet ingestion. The default is true."
}

variable "immediate_data_purge_on_30_days_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether the Log Analytics Workspace should immediately purge data after 30 days. The default is false."
}