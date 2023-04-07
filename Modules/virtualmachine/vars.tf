variable "configuration_virtualmachine_multi" {
  default = [{
    virtual_machine_resource_group_name="rg"
    virtual_machine_name="default"
    virtual_machine_location="eastus"
    virtual_machine_count="2"
    virtual_machine_prefix="prefix"
    virtual_network_name="default"
    address_space=["10.0.0.0/16"]
    address_prefix=["10.0.0.0/24"]
    subnet_name="default-subnet"
    virtual_machine_vm_size="Standard_DS1_v2"
    os_disk_name ="default"
  }]
}
