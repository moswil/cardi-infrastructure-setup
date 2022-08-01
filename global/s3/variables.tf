variable "aws_s3_region" {
  type        = string
  description = "The default region to use for AWS"
  default     = "us-east-2"
}

variable "aws_s3_bucket_name" {
  type        = string
  description = "The default name for S3 bucket for managing Terraform state"
  default     = "cardi-dev-terraform-state"
}

variable "s3_bucket_versioning" {
  type        = string
  description = "Enable or disable versioning of the S3 bucket"
  default     = "Enabled"
}

variable "tf_dynamodb_name" {
  type        = string
  description = "The name for the DynamoDB table for Terraform locks"
  default     = "cardi-tf-running-locks"
}
