terraform {
  required_version = ">=1.0.0, <2.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
}
