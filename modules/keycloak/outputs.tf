# output the ip addresses of the keycloak server nodes
output "keycloak_srv_node_ip" {
  value = digitalocean_droplet.keycloak_srv_droplet.ipv4_address
}

output "keycloak_srv_node_ipv6" {
  value = digitalocean_droplet.keycloak_srv_droplet.ipv6_address
}

# output the private ip addresses of the keycloak server nodes
output "keycloak_srv_node_private_ips" {
  value = digitalocean_droplet.keycloak_srv_droplet.ipv4_address_private
}

# output the public reserved ip (virtual ip)
output "reserved_ip_address" {
  value = digitalocean_reserved_ip.keycloak_srv_reserved_ip.ip_address
}
