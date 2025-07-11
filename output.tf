output "elb_id" {
  value = opentelekomcloud_lb_loadbalancer_v3.loadbalancer.id
}

output "elb_private_ip" {
  value = opentelekomcloud_lb_loadbalancer_v3.loadbalancer.vip_address
}

output "elb_public_ip" {
  value = try(opentelekomcloud_vpc_eip_v1.ingress_eip[0].publicip[0].ip_address, null)
}