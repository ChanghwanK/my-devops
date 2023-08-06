data "aws_key_pair" "public-key" {
    key_name = "root-account-key-pair"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}


resource "aws_instance" "demo-ec2" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"
    key_name = data.aws_key_pair.public-key.key_name

    tags = {
        "Name" = "demo-ec2"
    }
}