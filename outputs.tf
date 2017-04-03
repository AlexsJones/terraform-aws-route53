output "key_name" {
  value = "${aws_key_pair.terraform.key_name}"
}

output "region" {
  value = "${var.region}"
}

output "public_cidr_block1" {
  value = "${var.public_cidr_block1}"
}

output "elb-public-dns" {
  value = "${aws_elb.elb.dns_name}"
}

output "route53-public-dns" {
  value = "${aws_route53_record.web-elb-record.fqdn}"
}
