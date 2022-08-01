terraform {
  required_version = ">=1.0.0, <2.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    key = "global/s3/terraform.tfstate"
  }
}
