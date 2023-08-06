data "amazon-ami" "ubuntu" {
  filters = {
    virtualization-type = "hvm"
    name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
    root-device-type = "ebs"
  }
  owners = ["099720109477"]
  most_recent = true
}

source "amazon-ebs" "ubuntu" {
  region = "ap-northeast-2"
  instance_type = "t2.micro"
  source_ami = data.amazon-ami.ubuntu.id

  ssh_username = "ubuntu"
}
