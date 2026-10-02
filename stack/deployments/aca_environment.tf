data "azurerm_resource_group" "host" {
  name = var.resource_group_name
}

resource "azurerm_container_app_environment" "host" {
  name                = var.container_app_environment_name
  resource_group_name = data.azurerm_resource_group.host.name
  location            = data.azurerm_resource_group.host.location

  logs_destination = "none"
}