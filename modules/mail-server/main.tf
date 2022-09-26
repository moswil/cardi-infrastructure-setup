# Create a VPC
resource "digitalocean_vpc" "mail_srv_vpc" {
  name     = var.vpc_name
  region   = var.mail_server_region
  ip_range = var.vpc_ip_range
}

# tags to identify our resource
resource "digitalocean_tag" "mail_srv_tags" {
  for_each = toset(var.mail_server_tags)
  name     = each.value
}

# Create the mail server node
resource "digitalocean_droplet" "mail_srv_droplet" {
  name       = var.hostname
  image      = var.mail_server_image
  region     = var.mail_server_region
  size       = var.droplet_size
  monitoring = true
  ipv6       = true
  vpc_uuid   = digitalocean_vpc.mail_srv_vpc.id
  user_data = templatefile("${path.module}/scripts/add-ssh-user.yml", {
    common_operations_group = var.common_operations_group
    sudo_user               = var.sudo_user
    sudo_user_gecos         = var.sudo_user_gecos
    cloud_init_ssh_key      = var.cloud_init_ssh_key
    hostname                = var.hostname
  })

  tags = [for name in values(digitalocean_tag.mail_srv_tags)[*].id : name]

  connection {
    type        = "ssh"
    user        = var.sudo_user
    private_key = file("${path.module}/../../${var.private_key_name}")
    host        = self.ipv4_address
  }

  # Copy SSH key to server
  provisioner "file" {
    source      = "${path.module}/../../${var.private_key_name}"
    destination = var.private_key_name_path
  }

  # Copy SSH key to server
  provisioner "file" {
    source      = "${path.module}/../../${var.private_key_name}.pub"
    destination = "${var.private_key_name_path}.pub"
  }

  # change permission
  provisioner "remote-exec" {
    inline = [
      "chmod 700 .ssh",
      "chmod 600 ${var.private_key_name_path}",
      "sudo cp ${var.private_key_name_path} /root/${var.private_key_name_path}",
      "sudo cp ${var.private_key_name_path}.pub /root/${var.private_key_name_path}.pub",
      "sudo chmod 600 /root/${var.private_key_name_path}"
    ]
  }
}

# Virtual IP
resource "digitalocean_reserved_ip" "mail_srv_reserved_ip" {
  region     = var.mail_server_region
  droplet_id = digitalocean_droplet.mail_srv_droplet.id
}
