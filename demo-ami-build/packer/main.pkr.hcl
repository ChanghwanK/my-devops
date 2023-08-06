build {
  name = "demo-changhwan"

  source "amazon-ebs.ubuntu" {
    name     = "changhwan-demo"
    ami_name = "test-ami"
  }

  provisioner "shell" {
    script = "ansible.sh"
  }
}
