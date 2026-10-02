resource "azurerm_user_assigned_identity" "workload" {
  name                = "Amiasea Enterprise Core Workload"
  resource_group_name = var.resource_group_name
  location            = var.location
}