resource "azurerm_virtual_network" "workshopnetwork" {
    name = "WorkshopVNet"
    address_space = [ "10.0.0.0/16"]
    location = "westeurope"
    resource_group_name = "infrastructure2.0-TF"
    tags = {
      environment = "Terraform workshop VNET"
    }
}
resource "azurm_subnet" "tfsubnet" {
    name = "management_net"
    resource_group_name = "infrastructure2.0-TF"
    virtual_network_name   = "azurerm_virtual_network.workshopnetwork.name"
    address_prefix  = "10.0.1.0/24"
}