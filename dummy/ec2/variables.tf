variable "aws_key_pair_name" {
  description = "aws ec2 keypair name"
}

variable "instance_type" {
  default = "aws ec2 instance type"
}

variable "custom_tags" {
  type = map(string)
  default = {
    Name = "be-instance-demo"
    group = "be"
    environment = "production"
    department  = "engineering"
  }
}