variable "droplet_region" {
  type        = string
  description = "Droplet region"
  default     = "lon1"
}

variable "droplet_image" {
  type        = string
  description = "Droplet image"
  default     = "centos-stream-8-x64"
}

variable "droplet_size" {
  type        = string
  description = "droplet size"
  default     = "s-4vcpu-8gb"
  # default = "s-1vcpu-1gb"
}

variable "droplet_name" {
  type        = string
  description = "droplet name"
  default     = "cardi-dev"
}

variable "vpc_ip_range" {
  type        = string
  default     = "10.10.10.0/24"
  description = "The VPC ip range"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
  default     = "cardi-test-vpc-network"
}
