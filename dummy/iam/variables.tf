variable "apne2" {
  type        = string
  description = "ap-northeast-2"
}

variable "user_names" {
  type = list(string)
}

variable "custom_tags" {
  type = map(string)
  default = {
    "environment" = "production"
    "department"  = "engineering"
  }
}