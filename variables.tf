variable "name_prefix" {
  type        = string
  description = "Common prefix for all OTC resource names"
}

variable "tags" {
  type        = map(string)
  description = "Common tag set for project resources"
  default     = {}
}

variable "availability_zones" {
  type        = set(string)
  description = "Availability zones for the ELB instance."
}

variable "bandwidth" {
  type        = number
  default     = 100
  description = "The EIP bandwidth size. The value for a public loadbalancer ranges from 1 to 1000 Mbit/s. 0 disables the EIP, making the loadbalancer private."
}

variable "subnet_id" {
  type        = string
  description = "Subnet where the elastic load balancer will be created."
}

variable "network_ids" {
  type        = list(string)
  description = "Network IDs to use for loadbalancer backends. Default: <obtained from subnet_id>"
}

variable "ip_target_enable" {
  type        = bool
  description = "Enable using ip as backend feature."
  default     = false
}

variable "layer7_flavor" {
  type        = string
  description = "Flavor string for layer 7 routing."
  default     = ""
}

variable "layer4_flavor" {
  type        = string
  description = "Flavor string for layer 4 routing. Default: L4_flavor.elb.s1.small (set to \"\" explicitly to disable layer 4.)"
  default     = "L4_flavor.elb.s1.small"
}
