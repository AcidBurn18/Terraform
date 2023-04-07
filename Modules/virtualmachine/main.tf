locals {
  serverconfig = [
    for srv in var.configuration_virtualmachine : [
      for i in range(1, srv.virtual_machine_count + 1) : {
        virtual_machine_name                = "${srv.virtual_machine_name}-${i}"
        address_prefix                      = srv.address_prefix
        address_space                       = srv.address_space
        virtual_network_name                = "${srv.virtual_network_name}-${i}"
        virtual_machine_count               = srv.virtual_machine_count
        virtual_machine_location            = srv.virtual_machine_location
        virtual_machine_prefix              = srv.virtual_machine_prefix
        virtual_machine_resource_group_name = srv.virtual_machine_resource_group_name
        virtual_machine_vm_size             = srv.virtual_machine_vm_size
        os_disk_name                        = "${srv.os_disk_name}-${i}"
        subnet_name                         = "${srv.subnet_name}-${i}"
      }
    ]
  ]
}

locals {
  instances = flatten(local.serverconfig)
}


resource "azurerm_virtual_network" "main" {
  for_each            = { for name in local.instances : name.virtual_machine_name => name }
  name                = each.value.virtual_network_name
  address_space       = each.value.address_space
  location            = each.value.virtual_machine_location
  resource_group_name = each.value.virtual_machine_resource_group_name
}

resource "azurerm_subnet" "internal" {
  for_each            = { for name in local.instances : name.virtual_machine_name => name }
  name                 = each.value.subnet_name
  resource_group_name  = each.value.virtual_machine_resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefix
  depends_on = [
      azurerm_virtual_network.main
  ]
  #virtual_network_id=each.value.id
}

resource "azurerm_network_interface" "main" {
  for_each            = { for name in local.instances : name.virtual_machine_name => name }
  name                = "ni-${each.key}"
  location            = each.value.virtual_machine_location
  resource_group_name = each.value.virtual_machine_resource_group_name

  ip_configuration {
    name                          = "${each.key}-config"
    subnet_id                     = azurerm_subnet.internal[each.key].id
    private_ip_address_allocation = "Dynamic"
  }

  depends_on = [
    azurerm_subnet.internal
  ]
}

resource "azurerm_virtual_machine" "main" {
  for_each = { for name in local.instances : name.virtual_machine_name => name }
  #for_each1 =azurerm_network_interface.main
  name                  = each.value.virtual_machine_name
  location              = each.value.virtual_machine_location
  resource_group_name   = each.value.virtual_machine_resource_group_name
  network_interface_ids = [azurerm_network_interface.main[each.key].id]
  vm_size               = each.value.virtual_machine_vm_size
  # = each.value.virtual_machine_count


  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = each.value.os_disk_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
