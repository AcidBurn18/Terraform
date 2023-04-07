configuration_virtualmachine_multi=[
{
"virtual_machine_location" = "westus"  
"virtual_machine_name" = "oldmachinee"  
"virtual_machine_resource_group_name" = "Regroup_7fVhQSyp6uzXrlp"  
"virtual_machine_vm_size" = "Standard_DS1_v2"  
"storage_os_disk_caching" = "ReadOnly"  
"virtual_machine_prefix" = "oldmachinee"  
"address_space" = ["10.1.0.0/16"]  
"address_prefix" = ["10.1.0.0/24"]  
"virtual_machine_count" = "2"  
"os_disk_name" = "oldd"  
"subnet_name" = "oldsubnet"  
"virtual_network_name" = "oldvnet"  
},
{
"virtual_machine_location" = "eastus"  
"virtual_machine_name" = "testmachinee"  
"virtual_machine_resource_group_name" = "Regroup_7fVhQSyp6uzXrlp"  
"virtual_machine_vm_size" = "Standard_DS1_v2"  
"storage_os_disk_caching" = "ReadOnly"  
"storage_os_disk_create_option" = "Attach"  
"storage_os_disk_managed_disk_type" = "StandardSSD_LRS"  
"virtual_machine_prefix" = "newmachinee"  
"address_space" = ["10.2.0.0/16"]  
"address_prefix" = ["10.2.0.0/24"]  
"virtual_machine_count" = "1"  
"os_disk_name" = "neww"  
"subnet_name" = "newsubnet"  
"virtual_network_name" = "newvnet"  
}]
