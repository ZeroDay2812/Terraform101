provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "ec2_webapp" {
  ami = "ami-0b287aaaab87c114d"
  instance_type = "t2.micro"
  key_name = "ec2_webapp_keypair"
  vpc_security_group_ids = [aws_security_group.default.id]

  tags = {
    Name =  var.instance_name
  }
}

resource "aws_security_group" "default" {
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = ""
            from_port = 0
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            protocol = "-1"
            security_groups = []
            self = false
            to_port = 0
        }
    ]
    ingress = [
        {
            cidr_blocks = ["0.0.0.0/0",]
            description = ""
            from_port = 22
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            protocol = "tcp"
            security_groups = []
            self = false
            to_port = 22
        }
    ]
}

resource "aws_key_pair" "deployer-keypair" {
  key_name = "ec2_webapp_keypair"
  public_key = ""
}
