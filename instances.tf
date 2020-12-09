# data "azurerm_subnet" "tfsubnet"{
#     name = "tsfubnet"
#     virtual_network_name = "WorkshopVNet"
#     resource_group_name = "infrastructure2.0-TF"
# }
resource "azurerm_public_ip" "managementinstance1" {
  name                = "pubip1"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

}
resource "azurerm_public_ip" "managementinstance2" {
  name                = "pubip2"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

}
resource "azurerm_network_interface" "instance1" {
  name                = "management1-nic"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.tfsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.managementinstance1.id
  }

}
resource "azurerm_network_interface" "instance2" {
  name                = "management2-nic"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig2"
    subnet_id                     = azurerm_subnet.tfsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.managementinstance2.id
  }

}
resource "azurerm_virtual_machine" "student1" {
  name                             = "student1"
  location                         = "westeurope"
  resource_group_name              = azurerm_resource_group.rg.name
  network_interface_ids            = [azurerm_network_interface.instance1.id]
  vm_size                          = "Standard_B1s"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "osdisk1"
    disk_size_gb      = 128
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "studentInstance1"
    admin_username = "vmadmin"
    admin_password = "Pxl123!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}
resource "azurerm_virtual_machine" "student2" {
  name                             = "student2"
  location                         = "westeurope"
  resource_group_name              = azurerm_resource_group.rg.name
  network_interface_ids            = [azurerm_network_interface.instance2.id]
  vm_size                          = "Standard_B1s"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "osdisk2"
    disk_size_gb      = 128
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "studentInstance2"
    admin_username = "vmadmin"
    admin_password = "Pxl123!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}