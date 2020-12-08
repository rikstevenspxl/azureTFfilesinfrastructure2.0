provider "azurerm" {
    subscription_id = "610992b8-1492-49c7-8f44-46f898ccd29b"
    version = 1.38
}
terraform {

  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-westeurope"
    storage_account_name = "csb10033fff9a9eaa23"
    container_name       = "statefile"
    key                  = "terraform.tfstate"
  }
}