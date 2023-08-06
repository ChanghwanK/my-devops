
packer {
     requried_version =  "~> 1.7"
     required_plugins {
        amazon = {
            version = " ~> 1.0"
            source = "github.com/hasicorp/amzon"
        }
     }
}

source "amazon-ebs" "ubuntu" {
    ami_name = "changhwan-demo"
    instace_type = "t2.micro"
    region = "ap-northeast-2"

    source_ami_filter {
        filters  = {
            name = ""
        }
    }
}
