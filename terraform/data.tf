terraform {
  backend "s3" {
    bucket = "mygithub-action-test1"
    key    = "prod/green-blue"
    region = "eu-central-1"
  }
}

#data "terraform_remote_state" "green-blue" {
#  backend = "s3"
#
#  config = {
#    bucket = "mygithub-action-test1"
#    key    = "prod/green-blue"
#    region = "eu-central-1"
#  }
#}

data "aws_availability_zones" "working" {}

data "aws_ami" "amazon_linux_latest" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}
