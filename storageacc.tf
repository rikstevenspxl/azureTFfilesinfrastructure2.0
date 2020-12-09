resource "azurerm_storage_account" "student" {
  name                     = "tfstudentstorageacc123"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Terraform Storage"
    CreatedBy   = "Rik Stevens PXL"
  }
}