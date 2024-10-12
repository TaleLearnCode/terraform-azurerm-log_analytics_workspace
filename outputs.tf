# #############################################################################
# Outputs for the Log Analytics Workspace
# #############################################################################

output "workspace" {
  value = module.log_analytics_workspace.workspace
  description = "The managed Log Analytics Workspace."
}