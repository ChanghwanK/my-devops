output "public_key" {
  value = data.aws_key_pair.demo-ec2-keypair
}

output "instance_type" {
  value = aws_instance.demo-ec2.instance_type
}