variable "region" {
  type    = string
  default = "us-west-1"
}
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
  default = ""
}
variable "image_id" {
  type    = string
  default = "ami-085284d24fe829cd0" #? us-west-1 Ubuntu 22.04 LTS (HVM), SSC Volume Type
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
}
variable "stack" {
  type = string
}