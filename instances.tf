resource "aws_instance" "prod" {
  ami           = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "${var.project_name}"
  }

  # connection {
  #   host        = self.public_ip
  #   type        = "ssh"
  #   user        = "ubuntu"
  #   private_key = file(pathexpand("~/.ssh/${var.key_name}.pem"))
  # }

  #user_data = template_file.user_data.rendered

  # provisioner "file" {
  #   source      = "stacks/${var.stack}.sh"
  #   destination = "/tmp/${var.stack}.sh"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "cp /tmp/${var.stack}.sh /home/ubuntu/",
  #     "chmod +x /home/ubuntu/${var.stack}.sh",
  #     "/home/ubuntu/${var.stack}.sh",
  #   ]
  # }

}

resource "aws_route53_record" "dev-server" {
  zone_id = var.aws_zone_id
  name    = "dev-server"
  type    = "A"
  ttl     = 300
  records = [aws_instance.prod.public_ip]
}

