output "mail_srv_node_ip" {
  value = module.postal_mail_server.mail_srv_node_ip
}

output "mail_srv_node_ipv6" {
  value = module.postal_mail_server.mail_srv_node_ipv6
}

output "mail_srv_node_private_ips" {
  value = module.postal_mail_server.mail_srv_node_private_ips
}

output "reserved_ip_address" {
  value = module.postal_mail_server.reserved_ip_address
}
