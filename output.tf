output "elb_id" {
  description = "ID of the loadbalancer."
  value       = opentelekomcloud_lb_loadbalancer_v3.loadbalancer.id
}

output "elb_private_ip" {
  description = "Private VIP address of the loadbalancer within its subnet."
  value       = opentelekomcloud_lb_loadbalancer_v3.loadbalancer.vip_address
}

output "elb_public_ip" {
  description = "Public address of the loadbalancer. Null when the EIP is disabled."
  value       = var.bandwidth == 0 ? null : opentelekomcloud_vpc_eip_v1.ingress_eip[0].publicip[0].ip_address
}

output "elb" {
  description = "The loadbalancer resource with all of its attributes."
  value       = opentelekomcloud_lb_loadbalancer_v3.loadbalancer
}

output "eip" {
  description = "The ingress EIP resource with all of its attributes. Null when the EIP is disabled."
  value       = var.bandwidth == 0 ? null : opentelekomcloud_vpc_eip_v1.ingress_eip[0]
}