output "droplet_ip_address" {
  value = digitalocean_droplet.cardidev_node.ipv4_address
}

output "reserved_ip_address" {
  value = digitalocean_reserved_ip.cardidev_reserved_ip.ip_address
}
