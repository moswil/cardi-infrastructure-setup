variable "mail_server_region" {
  type        = string
  description = "The region where the keycloak instance will be deployed."
  nullable    = false
  default     = "lon1"
}

variable "mail_server_image" {
  type        = string
  description = "The image that will be used by the keycloak instance"
  nullable    = false
  default     = "centos-stream-8-x64"
}

variable "droplet_size" {
  type        = string
  description = "Droplet size for the keycloak instance"
  nullable    = false
  default     = "s-2vcpu-2gb"
}

variable "hostname" {
  type        = string
  description = "Hostname of the keycloak server"
  nullable    = false
  default     = "auth.hekisoft.com"
}

variable "vpc_ip_range" {
  type        = string
  description = "The VPC ip range"
  nullable    = false
  default     = "10.10.30.10/24"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
  nullable    = false
  default     = "keycloak-server-vpc"
}

variable "mail_server_tags" {
  type        = list(string)
  description = "The tags to be used for our resources"
  nullable    = false
  default     = ["keycloak-server", "keycloak", "auth-server"]
}

variable "sudo_user" {
  type        = string
  description = "The sudo user for common operations"
  nullable    = false
  default     = "cardidev"
}

variable "sudo_user_gecos" {
  type        = string
  description = "The sudo user for common operations gecos name"
  nullable    = false
  default     = "Cardi Dev"
}

variable "common_operations_group" {
  type        = string
  description = "The group for common operations"
  nullable    = false
  default     = "cardikeycloak"
}

variable "cloud_init_ssh_key" {
  type        = string
  description = "Cloud init SSH key"
  nullable    = false
}

variable "private_key_name" {
  type        = string
  description = "The name of the private SSH key"
  nullable    = false
}

variable "private_key_name_path" {
  type        = string
  description = "The name of the private SSH key"
  default     = ".ssh/id_rsa"
}
