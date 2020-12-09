resource "azurerm_resource_group" "rg" {
  name     = "infrastructure2.0-TF"
  location = "westeurope"

  tags = {
    environment = "Terraform"
    CreatedBy   = "RikStevensPXL"
  }
}
