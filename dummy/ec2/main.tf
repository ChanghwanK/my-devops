provider "aws" {
  region = "ap-northeast-2"
}

data "aws_key_pair" "demo-ec2-keypair" {
  key_name = var.aws_key_pair_name
}

resource "aws_instance" "demo-ec2" {
  ami           = "ami-0c9c942bd7bf113a2"
  instance_type = var.instance_type
  key_name      = data.aws_key_pair.demo-ec2-keypair.key_name

  tags = var.custom_tags
}