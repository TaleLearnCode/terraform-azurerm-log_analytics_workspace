module "naming" {
  source  = "TaleLearnCode/naming/azurerm"
  version = "0.0.3-pre"

  resource_type  = "log_analytics_workspace"
  name_prefix    = var.name_prefix
  name_suffix    = var.name_suffix
  srv_comp_abbr  = var.srv_comp_abbr
  custom_name    = var.custom_name
  location       = var.location
  environment    = var.environment
}

resource "azurerm_log_analytics_workspace" "target" {
  name                = module.naming.resource_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  retention_in_days = var.retention_in_days
  daily_quota_gb    = var.daily_quota_gb

  local_authentication_disabled = var.local_authentication_disabled
  internet_ingestion_enabled    = var.internet_ingestion_enabled
  immediate_data_purge_on_30_days_enabled = var.immediate_data_purge_on_30_days_enabled

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : ["enabled"]
    content {
      type         = var.identity_type
      identity_ids = endswith(var.identity_type, "UserAssigned") ? var.identity_ids : null
    }
  }
}