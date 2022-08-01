# backend.hcl
bucket         = "cardi-dev-terraform-state"
region         = "us-east-2"
dynamodb_table = "cardi-tf-running-locks"
encrypt        = true