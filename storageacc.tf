resource "azurerm_storage_account" "student" {
    name = "tfstudentstorageacc123"
    resource_group_name = "infrastructure2.0-TF"
    location = "westeurope"
    account_tier = "Standard"
    account_replication_type = "GRS"

    tags = {
        environment = "Terraform Storage"
        CreatedBy = "Rik Stevens PXL"
    }
}