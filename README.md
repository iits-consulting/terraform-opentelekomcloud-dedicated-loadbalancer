## Dedicated Loadbalancer

A module designed to create and manage a dedicated ELB instance with private and public IP.

Usage example:

```hcl
module "vpc" {
  source     = "iits-consulting/vpc/opentelekomcloud"
  version    = "6.0.2"
  name       = "${var.context}-${var.stage}-vpc"
  cidr_block = var.vpc_cidr
  subnets = {
    "dmz-subnet" = cidrsubnet(var.vpc_cidr, 1, 0)
  }
  tags = local.tags
}

module "loadbalancer" {
  source             = "iits-consulting/vpc/opentelekomcloud"
  version            = "6.0.2"
  availability_zones = var.availability_zones
  name_prefix        = "${var.context}-${var.stage}"
  subnet_id          = module.vpc.subnets["dmz-subnet"].subnet_id
  network_ids        = [module.vpc.subnets["dmz-subnet"].network_id]
  tags               = local.tags
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                                          | Version  |
| --------------------------------------------------------------------------------------------- | -------- |
| <a name="requirement_opentelekomcloud"></a> [opentelekomcloud](#requirement_opentelekomcloud) | >=1.31.5 |

## Providers

| Name                                                                                    | Version  |
| --------------------------------------------------------------------------------------- | -------- |
| <a name="provider_opentelekomcloud"></a> [opentelekomcloud](#provider_opentelekomcloud) | >=1.31.5 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                           | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [opentelekomcloud_lb_loadbalancer_v3.elb](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/lb_loadbalancer_v3)  | resource    |
| [opentelekomcloud_vpc_eip_v1.ingress_eip](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/resources/vpc_eip_v1)          | resource    |
| [opentelekomcloud_lb_flavor_v3.layer4_flavor](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/lb_flavor_v3) | data source |
| [opentelekomcloud_lb_flavor_v3.layer7_flavor](https://registry.terraform.io/providers/opentelekomcloud/opentelekomcloud/latest/docs/data-sources/lb_flavor_v3) | data source |

## Inputs

| Name                                                                                    | Description                                                                                                   | Type           | Default                    | Required |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- | -------------- | -------------------------- | :------: |
| <a name="input_availability_zones"></a> [availability_zones](#input_availability_zones) | Availability zones for the ELB instance.                                                                      | `set(string)`  | n/a                        |   yes    |
| <a name="input_name_prefix"></a> [name_prefix](#input_name_prefix)                      | Common prefix for all OTC resource names                                                                      | `string`       | n/a                        |   yes    |
| <a name="input_network_ids"></a> [network_ids](#input_network_ids)                      | Network IDs to use for loadbalancer backends. Default: <obtained from subnet_id>                              | `list(string)` | n/a                        |   yes    |
| <a name="input_subnet_id"></a> [subnet_id](#input_subnet_id)                            | Subnet where the elastic load balancer will be created.                                                       | `string`       | n/a                        |   yes    |
| <a name="input_bandwidth"></a> [bandwidth](#input_bandwidth)                            | The bandwidth size. The value ranges from 1 to 1000 Mbit/s.                                                   | `number`       | `100`                      |    no    |
| <a name="input_layer4_flavor"></a> [layer4_flavor](#input_layer4_flavor)                | Flavor string for layer 4 routing. Default: L4_flavor.elb.s1.small (set to "" explicitly to disable layer 4.) | `string`       | `"L4_flavor.elb.s1.small"` |    no    |
| <a name="input_layer7_flavor"></a> [layer7_flavor](#input_layer7_flavor)                | Flavor string for layer 7 routing.                                                                            | `string`       | `""`                       |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                           | Common tag set for project resources                                                                          | `map(string)`  | `{}`                       |    no    |

## Outputs

| Name                                                                          | Description |
| ----------------------------------------------------------------------------- | ----------- |
| <a name="output_elb_id"></a> [elb_id](#output_elb_id)                         | n/a         |
| <a name="output_elb_private_ip"></a> [elb_private_ip](#output_elb_private_ip) | n/a         |
| <a name="output_elb_public_ip"></a> [elb_public_ip](#output_elb_public_ip)    | n/a         |

<!-- END_TF_DOCS -->

