resource "azurerm_container_app" "host" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.host.id
  resource_group_name          = var.resource_group_name
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.workload.id]
  }

  ingress {
    external_enabled           = true
    allow_insecure_connections = false
    target_port                = var.container_port
    transport                  = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  template {
    min_replicas = var.min_replicas
    max_replicas = var.max_replicas

    container {
      name   = "enterprise-core"
      image  = var.container_image
      cpu    = var.cpu
      memory = var.memory
    }
  }
}