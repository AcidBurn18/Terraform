## Description
This is a Vnet Module
## Examples
Please look at example folder
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.86.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.86.0 |
# Examples
```hcl
variable "required_var" {}

module "vnet" {
  source = "path"
  version  = "x.x.x"
  name = "vnet"
  resource_group_name = "rg-name"
}
```
## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vnets"></a> [vnets](#input\_vnets) | Map of Virtual Networks. Each entry in the map represents a Virtual Network and it's key will be the name of the Virtual Network and contains the following attributes:<br>  - `resource_group_name` - The name of the Resource Group.<br>  - `address_space` - The address space of the Virtual Network.<br>  - `dns_servers` - The DNS servers of the Virtual Network.<br>  - `encryption_enforcement` - The encryption enforcement policy of the Virtual Network.<br>  - `vnet_tags` - The tags of the Virtual Network.<br>  - `ddos_protection_plan` - An optional list of DDoS Protection Plans. Each plan is an object containing the following attributes:<br>    - `id` - The ID of the DDoS Protection Plan. If not provided, the default value is `null`.<br>    - `enable` - A boolean indicating whether the DDoS Protection Plan is enabled. If not provided, the default value is `false`. | <pre>map(object({<br>    resource_group_name = string<br>    address_space          = list(string)<br>    dns_servers            = optional(list(string), [])<br>    encryption_enforcement = optional(string, "AllowUnencrypted")<br>    vnet_tags              = map(string)<br>    ddos_protection_plan = optional(list(object({<br>      id     = optional(string, null)<br>      enable = optional(bool, false)<br>    })))}))</pre> | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_ids"></a> [vnet\_ids](#output\_vnet\_ids) | Id of the Vnet |
| <a name="output_vnet_names"></a> [vnet\_names](#output\_vnet\_names) | Name of the Vnet |
