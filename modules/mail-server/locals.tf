locals {
  ansible_cfg_content = templatefile("${path.module}/ansible/ansible.cfg.tftpl", {
    sudo_user           = var.sudo_user
    path_to_private_key = "~/${var.private_key_name_path}"
  })

  droplet_ip_addr = digitalocean_droplet.mail_srv_droplet.ipv4_address

  hosts_content = templatefile("${path.module}/ansible/hosts.tftpl", {
    # ip_addr = local.droplet_ip_addr
    # host = local.droplet_ip_addr
    host = var.hostname
  })

  hosts_vars = templatefile("${path.module}/ansible/host_vars/mail.hekisoft.com.tftpl", {
    # ip_addr                  = digitalocean_droplet.mail_srv_droplet.ipv4_address

    sudo_user                = var.sudo_user
    ip_addr                  = local.droplet_ip_addr
    postal_web_host          = var.hostname
    floating_ip_addr         = digitalocean_reserved_ip.mail_srv_reserved_ip.ip_address
    mysql_root_password      = random_password.password[0].result
    postal_main_db_password  = random_password.password[1].result
    postal_rabbitmq_password = random_password.password[2].result
  })

  group_vars = templatefile("${path.module}/ansible/group_vars/all.template", {
    public_key = file("${path.module}/../../${var.private_key_name}.pub")
  })
}

