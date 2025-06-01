terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = var.region
}

resource "aws_instance" "app_server" {
  ami           = "ami-03d8b47244d950bbb"
#   instance_type = "t2.micro"
  instance_type = "t3.nano"

  tags = {
    Name = "capblsnode1"
  }
}
