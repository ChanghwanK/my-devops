packer {
  required_version = "~> 1.7"

  required_plugins {
    amazon = {
      version = "~> 1.0"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.0.3"
      source  = "github.com/hashicorp/ansible"
    }
  }
}