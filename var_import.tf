# variable "region" {
#   type    = string
#   default = "us-east-1"
# }
variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}
variable "aws_zone_id" {
  type = string
}
variable "project_name" {
  type    = string
  default = "dev-server"
}
# variable "image_id" {
#   type    = string
#   default = "ami-007855ac798b5175e" #? us-west-1 Ubuntu 22.04 LTS (HVM), SSC Volume Type
# }
# variable "instance_type" {
#   type    = string
#   default = "t2.micro"
# }
# variable "key_name" {
#   type = string
# }
# variable "stack" {
#   type = string
# }
variable "vpc_cidr" {
  type    = string
  default = "10.123.0.0/16"
}
variable "subnet_cidr" {
  type    = string
  default = "10.123.1.0/24"
}
