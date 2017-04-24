resource "aws_route53_record" "web-elb-record" {
  zone_id = "${var.zone_id}"
  name    = "www.crystal-basilica.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_elb.elb.dns_name}"]
}
