resource "aws_route53_zone" "web-elb" {
  name = "crystal-basilica.com"
}

# Note that you'll need to add nameservers of the host zone to the domain name management
resource "aws_route53_record" "web-elb-record" {
  zone_id = "${aws_route53_zone.web-elb.zone_id}"
  name    = "www.crystal-basilica.com"
  type    = "CNAME"
  ttl     = "60"

  records = ["${aws_elb.elb.dns_name}"]
}
