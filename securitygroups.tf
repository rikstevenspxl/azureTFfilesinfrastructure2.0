resource "azurerm_network_security_group" "nsg"{
    name = "workshopNSG"
    location = "westeurope"
    resource_group_name = "${azurerm_resource_group.rg.name}"
}

resource "azurerm_network_security_rule" "ssh" {
    name = "AllowSSH"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "TCP"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    network_security_group_name = "${azurerm_network_security_group.nsg.name}"
}
resource "azurerm_network_security_rule" "web" {
    name = "AllowWeb80"
    priority = 1000
    direction = "Inbound"
    access = "Allow"
    protocol = "TCP"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    network_security_group_name = "${azurerm_network_security_group.nsg.name}"
}
resource "azurerm_network_security_rule" "icmp" {
    name = "AllowICMP"
    priority = 1000
    direction = "Inbound"
    access = "Allow"
    protocol = "ICMP"
    source_port_range = "*"
    destination_port_range = "-1"
    source_address_prefix = "-1"
    destination_address_prefix = "*"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    network_security_group_name = "${azurerm_network_security_group.nsg.name}"
}