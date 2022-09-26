output "keycloak_srv_node_ip" {
  value = module.keycloak_server.keycloak_srv_node_ip
}

output "keycloak_srv_node_ipv6" {
  value = module.keycloak_server.keycloak_srv_node_ipv6
}

output "keycloak_srv_node_private_ips" {
  value = module.keycloak_server.keycloak_srv_node_private_ips
}

output "reserved_ip_address" {
  value = module.keycloak_server.reserved_ip_address
}
