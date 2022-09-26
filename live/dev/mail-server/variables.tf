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
