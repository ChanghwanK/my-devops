provider "aws" {
  region = var.apne2
}

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
  name     = each.value

  dynamic "tags" {
    for_each = var.custom_tags
    content {
      key   = each.key
      value = each.value
    }
  }
}

