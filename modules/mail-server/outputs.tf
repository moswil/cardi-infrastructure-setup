# output the ip addresses of the mail server nodes
output "mail_srv_node_ip" {
  value = local.droplet_ip_addr
}

output "mail_srv_node_ipv6" {
  value = digitalocean_droplet.mail_srv_droplet.ipv6_address
}

# output the private ip addresses of the mail server nodes
output "mail_srv_node_private_ips" {
  value = digitalocean_droplet.mail_srv_droplet.ipv4_address_private
}

# output the public reserved ip (virtual ip)
output "reserved_ip_address" {
  value = digitalocean_reserved_ip.mail_srv_reserved_ip.ip_address
}
