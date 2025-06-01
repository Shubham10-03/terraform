terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
  backend "s3" {
    bucket = "ba-cap-bucket-app-156"
    key = "backend.tfstate"
    region = "eu-west-1"
  }
}