resource "azurerm_public_ip" "public_ip" {
  name                = "terraform-vm-public-ip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Dynamic"

  tags = var.default_tags
}

resource "azurerm_network_interface" "network_interface" {
  name                = "terraform-vm-network-interface"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "terraform-public-ip"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = var.default_tags
}

resource "azurerm_network_interface_security_group_association" "nisga" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "terraform-vm"
  resource_group_name   = var.resource_group
  location              = var.location
  size                  = "Standard_B1s"
  admin_username        = "terraform"
  network_interface_ids = [azurerm_network_interface.network_interface.id]

  admin_ssh_key {
    username   = "terraform"
    public_key = file("./azure-key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-11"
    sku       = "11"
    version   = "latest"
  }

  tags = var.default_tags
}