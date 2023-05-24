region       = "us-east-1"
project_name = "testing-server-tf"
stack        = "node"

# VPC SUBNET
vpc_cidr    = "10.123.0.0/16"
subnet_cidr = "10.123.1.0/24" #? use this resource for building subnet https://tidalmigrations.com/subnet-builder/

# INSTANCES
# image_id      = "ami-08c40ec9ead489470"
# instance_type = "t2.micro"
# #! MAKE KEYS BEFORE RUNNING "TERRAFORM APPLY" SAVE KEYS IN ~/.SSH
# key_name = "dev-server" #? key name format "project_name".prod


