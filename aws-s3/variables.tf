variable "region" {
  default = "eu-west-1"
  description = "AWS region"
}

variable "bucket-name" {
  default = "ba-cap-bucket-app"
  description = "AWS default bucket name"
  type = string
}