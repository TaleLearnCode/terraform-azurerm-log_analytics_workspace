# #############################################################################
# Outputs for the Log Analytics Workspace
# #############################################################################

output "workspace" {
  value = azurerm_log_analytics_workspace.target
  description = "The managed Log Analytics Workspace."
}