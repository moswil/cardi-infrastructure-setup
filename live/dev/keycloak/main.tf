terraform {
  required_version = ">=1.0.0, <2.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

module "keycloak_server" {
  source = "../../../modules/keycloak"

  cloud_init_ssh_key = var.cloud_init_ssh_key
  private_key_name   = var.private_key_name
}
