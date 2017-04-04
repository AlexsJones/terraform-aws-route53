resource "aws_route53_zone" "web-elb" {
  name = "crystal-basilica.com"
}

resource "aws_route53_record" "web-elb-record" {
  zone_id = "${aws_route53_zone.web-elb.zone_id}"
  name    = "www.crystal-basilica.com"
  type    = "CNAME"
  ttl     = "60"

  records = ["${aws_elb.elb.dns_name}"]
}

resource "aws_route53_record" "namesevers" {
  zone_id = "${aws_route53_zone.web-elb.zone_id}"
  name    = "www.crystal-basilica.com"
  type    = "NS"
  ttl     = "30"

  records = [
    "${lookup(var.aws_nameserver,"one")}",
    "${lookup(var.aws_nameserver,"two")}",
    "${lookup(var.aws_nameserver,"three")}",
    "${lookup(var.aws_nameserver,"four")}",
  ]
}
