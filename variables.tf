variable "region" {
  default = "eu-west-1"
}

variable "availability_zone" {
  type = "map"

  default = {
    primary = "eu-west-1a"
  }
}

variable "amazon_amis" {
  type = "map"

  default = {
    eu-west-1 = "ami-0fc6f969"
  }
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_cidr_block1" {
  default = "10.0.128.0/20"
}
