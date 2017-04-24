variable "region" {
  default = "eu-west-1"
}

variable "zone_id" {
  description = "Use an existing hosted zone" //Something like Z2WUWP7YVWD7FQ
}

variable "availability_zone" {
  type = "map"

  default = {
    primary = "eu-west-1a"
  }
}

variable "aws_nameserver" {
  default = {
    one   = "ns-1119.awsdns-11.org"
    two   = "ns-394.awsdns-49.com"
    three = "ns-1857.awsdns-40.co.uk"
    four  = "ns-929.awsdns-52.net"
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
