resource "azurerm_resource_group" "tfstaterg" {
  name     = "terraform_state_resource_group"
  location = var.location

  tags = local.common_tags
}

resource "azurerm_storage_account" "tfstatesa" {
  name                     = "tfstatesa20230216"
  resource_group_name      = azurerm_resource_group.tfstaterg.name
  location                 = azurerm_resource_group.tfstaterg.location
  account_tier             = var.account_tier
  account_replication_type = var.azure_replication_type

  tags = local.common_tags
}

resource "azurerm_storage_container" "tfstatesc" {
  name                 = "terraformstatesc"
  storage_account_name = azurerm_storage_account.tfstatesa.name
}