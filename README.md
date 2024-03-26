## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.28.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.peering](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vnets"></a> [vnets](#input\_vnets) | Map of Virtual Networks. Each entry in the map represents a Virtual Network and it's key will be the name of the Virtual Network and contains the following attributes:<br>  - `resource_group_name` - The name of the Resource Group.<br>  - `address_space` - The address space of the Virtual Network.<br>  - `dns_servers` - The DNS servers of the Virtual Network.<br>  - `encryption_enforcement` - The encryption enforcement policy of the Virtual Network.<br>  - `vnet_tags` - The tags of the Virtual Network.<br>  - `ddos_protection_plan` - An optional list of DDoS Protection Plans. Each plan is an object containing the following attributes:<br>    - `id` - The ID of the DDoS Protection Plan. If not provided, the default value is `null`.<br>    - `enable` - A boolean indicating whether the DDoS Protection Plan is enabled. If not provided, the default value is `false`.<br>  - `peerings` - An optional list of Peerings. Each peering is an object containing the following attributes:<br>    - `name` - The name of the Peering.<br>    - `remote_virtual_network_id` - The ID of the remote Virtual Network.<br>    - `allow_virtual_network_access` - A boolean indicating whether virtual network access is allowed. If not provided, the default value is `true`.<br>    - `allow_forwarded_traffic` - A boolean indicating whether forwarded traffic is allowed. If not provided, the default value is `false`.<br>    - `allow_gateway_transit` - A boolean indicating whether gateway transit is allowed.<br>    - `use_remote_gateways` - A boolean indicating whether remote gateways are used. If not provided, the default value is `false`. | <pre>map(object({<br>    resource_group_name = string<br>    address_space          = list(string)<br>    dns_servers            = optional(list(string), [])<br>    encryption_enforcement = optional(string, "AllowUnencrypted")<br>    vnet_tags              = map(string)<br>    ddos_protection_plan = optional(list(object({<br>      id     = optional(string, null)<br>      enable = optional(bool, false)<br>    })))<br>    peerings = optional(list(object({<br>      name                         = string<br>      remote_virtual_network_id    = string<br>      allow_virtual_network_access = optional(bool, true)<br>      allow_forwarded_traffic      = optional(bool, false)<br>      allow_gateway_transit        = optional(bool,false)<br>      use_remote_gateways          = optional(bool, true)<br>    })))<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_properties"></a> [vnet\_properties](#output\_vnet\_properties) | The properties of the created virtual networks and their peerings if provided |
