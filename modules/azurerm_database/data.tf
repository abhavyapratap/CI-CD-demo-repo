data "azurerm_mssql_server" "server" {
  name                = var.server
  resource_group_name = var.resource_group_name
}