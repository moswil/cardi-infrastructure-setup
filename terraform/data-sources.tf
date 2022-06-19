data "template_file" "user_data" {
  template = file("${path.module}/../scripts/add-ssh-user.yml")
}
