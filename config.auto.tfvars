region       = "us-east-1"
project_name = "testing-server-tf"
stack        = "node"

# INSTANCES
image_id      = "ami-08c40ec9ead489470"
instance_type = "t2.micro"
#! MAKE KEYS BEFORE RUNNING "TERRAFORM APPLY" SAVE KEYS IN ~/.SSH
key_name = "dan-aws-ec2-key" #? key name format "project_name".prod


