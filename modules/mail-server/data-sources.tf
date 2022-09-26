resource "null_resource" "local" {
  triggers = {
    ansible_cfg = local.ansible_cfg_content
    hosts       = local.hosts_content
    hosts_vars  = local.hosts_vars
    group_vars  = local.group_vars
  }

  # Render to local file on machine
  # ansible.cfg file
  provisioner "local-exec" {
    command = format(
      "cat <<\"EOF\" > \"%s\"\n%s\nEOF",
      "${path.module}/ansible/ansible.cfg",
      local.ansible_cfg_content
    )
  }

  # hosts file
  provisioner "local-exec" {
    command = format(
      "cat <<\"EOF\" > \"%s\"\n%s\nEOF",
      "${path.module}/ansible/hosts",
      local.hosts_content
    )
  }

  # host_vars file
  provisioner "local-exec" {
    command = format(
      "cat <<\"EOF\" > \"%s\"\n%s\nEOF",
      "${path.module}/ansible/host_vars/${var.hostname}",
      local.hosts_vars
    )
  }

  # group_vars file
  provisioner "local-exec" {
    command = format(
      "cat <<\"EOF\" > \"%s\"\n%s\nEOF",
      "${path.module}/ansible/group_vars/all.yml",
      local.group_vars
    )
  }
}

resource "null_resource" "copy_ansible_folder_to_server" {
  triggers = {
    ansible_cfg = local.ansible_cfg_content
    hosts       = local.hosts_content
    hosts_vars  = local.hosts_vars
    group_vars  = local.group_vars
  }

  connection {
    type        = "ssh"
    user        = var.sudo_user
    private_key = file("${path.module}/../../${var.private_key_name}")
    host        = digitalocean_droplet.mail_srv_droplet.ipv4_address
  }

  // TODO: ensure destination path is generic not hard-coded
  provisioner "file" {
    source      = "${path.module}/ansible"
    destination = "/home/shirwil/ansible"
  }

  // TODO: ensure the cd path is generic not hard-coded
  # provisioner "remote-exec" {
  #   inline = [
  #     "cd /home/shirwil/ansible",
  #     "ansible-playbook mail-server.yml"
  #   ]
  # }
}

resource "random_password" "password" {
  count            = 3
  length           = 16
  special          = true
  override_special = "_%@!#$"
}
