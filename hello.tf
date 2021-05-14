provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
terraform {
    backend "s3" {
	    bucket = "demodevopsnew"
		  key  =  "techbleat.tfstate"
		  region = "us-east-1"
	}
}
resource "aws_instance" "my_first_node" {
  ami           = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"
  key_name      = "DevOps"
  vpc_security_group_ids = [aws_security_group.demo_sg.id]
  tags = {
    Name        = "Our_First_node"
    Provisioner = "Terraform"
  }
}