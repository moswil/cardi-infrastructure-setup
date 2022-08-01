terraform {
  required_version = ">=1.0.0, <2.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    key = "cardi-infra/terraform/terraform.state"
  }
}
