output "ec2-public-ip" {
  value = aws_instance.demo-ec2.public_ip
}