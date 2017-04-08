# ELB ########################################################################
resource "aws_elb" "elb" {
  name = "elb"

  subnets                   = ["${aws_subnet.public-One.id}"]
  security_groups           = ["${aws_security_group.elb.id}"]
  cross_zone_load_balancing = true

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 10
  }

  instances = ["${aws_instance.web-server.*.id}"]
}

# Sticky balancing ############################################################
resource "aws_lb_cookie_stickiness_policy" "foo" {
  name                     = "elb-policy"
  load_balancer            = "${aws_elb.elb.id}"
  lb_port                  = 80
  cookie_expiration_period = 600
}
