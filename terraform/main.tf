# create a digitalocean VPC
resource "digitalocean_vpc" "cardi_test_vpc" {
  name     = var.vpc_name
  region   = var.droplet_region
  ip_range = var.vpc_ip_range
}

# create a droplet
resource "digitalocean_droplet" "cardidev_node" {
  name       = var.droplet_name
  image      = var.droplet_image
  region     = var.droplet_region
  size       = var.droplet_size
  vpc_uuid   = digitalocean_vpc.cardi_test_vpc.id
  monitoring = true
  user_data  = data.template_file.user_data.rendered

  connection {
    type        = "ssh"
    user        = "cardidev"
    private_key = file("${path.module}/../tf-cloud-init")
    host        = self.ipv4_address
  }

  provisioner "file" {
    source      = "${path.module}/../scripts/git.secrets.sh"
    destination = "/tmp/git.secrets.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "echo \"export IP_ADDRESS=${digitalocean_droplet.cardidev_node.ipv4_address}\" >> ~/.bashrc",
      "source /tmp/git.secrets.sh"
    ]
  }

  provisioner "remote-exec" {
    script = "${path.module}/../scripts/setup-docker-and-compose.sh"
  }

  provisioner "remote-exec" {
    scripts = [
      "${path.module}/../scripts/run-cardi-project.sh"
    ]
  }
}

resource "digitalocean_reserved_ip" "cardidev_reserved_ip" {
  droplet_id = digitalocean_droplet.cardidev_node.id
  region     = digitalocean_droplet.cardidev_node.region
}
