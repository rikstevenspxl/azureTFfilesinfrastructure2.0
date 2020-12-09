resource "azurerm_virtual_network" "workshopnetwork" {
    name = "WorkshopVNet"
    address_space = [ "10.0.0.0/16"]
    location = "westeurope"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    tags = {
      environment = "Terraform workshop VNET"
    }
}
resource "azurerm_subnet" "tfsubnet" {
    name = "managementNet"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    virtual_network_name   = "${azurerm_virtual_network.workshopnetwork.name}"
    address_prefixes  = ["10.0.1.0/24"]
}