module "rg" {
  source   = "../../modules/azurerm_resource_group"
  rg_name  = "rg-cicd"
  location = "centralindia"
}

module "server" {
    depends_on = [ module.rg ]
  source                       = "../../modules/azurerm_server"
  server_name                  = "indianserver"
  resource_group_name          = "rg-cicd"
  location                     = "centralindia"
  administrator_login          = "username"
  administrator_login_password = "Password12345"
}

module "database" {
    depends_on = [ module.server ]
  source              = "../../modules/azurerm_database"
  database_name       = "cicddatabase"
  server              = "indianserver"
  resource_group_name = "rg-cicd"
}
