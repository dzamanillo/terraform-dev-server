# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.0"
#     }
#   }
# }

# provider "aws" {
#   region     = var.region
#   access_key = var.aws_access_key
#   secret_key = var.aws_secret_key
# }

# resource "aws_instance" "prod" {
#   ami           = var.image_id
#   instance_type = var.instance_type
#   key_name      = var.key_name

#   tags = {
#     Name = "${var.project_name}"
#   }

#   # connection {
#   #   host        = self.public_ip
#   #   type        = "ssh"
#   #   user        = "ubuntu"
#   #   private_key = file(pathexpand("~/.ssh/${var.key_name}.pem"))
#   # }

#   #user_data = template_file.user_data.rendered

#   # provisioner "file" {
#   #   source      = "stacks/${var.stack}.sh"
#   #   destination = "/tmp/${var.stack}.sh"
#   # }

#   # provisioner "remote-exec" {
#   #   inline = [
#   #     "cp /tmp/${var.stack}.sh /home/ubuntu/",
#   #     "chmod +x /home/ubuntu/${var.stack}.sh",
#   #     "/home/ubuntu/${var.stack}.sh",
#   #   ]
#   # }

# }

# resource "aws_route53_record" "dev-server" {
#   zone_id = var.aws_zone_id
#   name    = "dev-server"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.prod.public_ip]
# }


# resource "tls_private_key" "prod_key_name" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "prod" {
#   key_name   = var.key_name
#   public_key = tls_private_key.prod_key_name.public_key_openssh
# }

# resource "local_file" "prod_file" {
#   filename             = pathexpand("~/.ssh/${var.key_name}")
#   file_permission      = "400"
#   directory_permission = "700"
#   content              = tls_private_key.prod_key_name.private_key_pem
# }