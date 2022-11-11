resource "tls_private_key" "prod_key_name" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "prod" {
  key_name   = var.key_name
  public_key = tls_private_key.prod_key_name.public_key_openssh
}

resource "local_file" "prod_file" {
  filename             = pathexpand("~/.ssh/${var.key_name}.pem")
  file_permission      = "400"
  directory_permission = "700"
  content              = tls_private_key.prod_key_name.private_key_pem
}