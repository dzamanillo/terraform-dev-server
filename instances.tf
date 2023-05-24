resource "aws_instance" "prod" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.micro"
  key_name               = "dan-ec2"
  vpc_security_group_ids = [aws_security_group.ec2_sg-dev.id]
  subnet_id              = aws_subnet.subnet_tf.id

  tags = {
    Name = "${var.project_name}"
  }

  user_data = file("script.sh")

}

resource "aws_vpc" "vpc_tf" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}_vpc"
  }
}

resource "aws_subnet" "subnet_tf" {
  vpc_id                  = aws_vpc.vpc_tf.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "${var.project_name}_subnet"
  }
}

resource "aws_security_group" "ec2_sg-dev" {
  name   = "ec2_sg-dev"
  vpc_id = aws_vpc.vpc_tf.id

  #Incoming traffic

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  #HTTP
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  #HTTPS
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
  }

  #Outgoing traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ec2_sg-dev"
  }

}

resource "aws_route53_record" "dev-server" {
  zone_id = var.aws_zone_id
  name    = "dev-server"
  type    = "A"
  ttl     = 300
  records = [aws_instance.prod.public_ip]
}

