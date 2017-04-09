resource "aws_instance" "web-server" {
  count = 1

  connection {
    user     = "ubuntu"
    key_file = "${file("keys/ami_keys.pub")}"
  }

  availability_zone = "${lookup(var.availability_zone,"primary")}"
  ami               = "${lookup(var.amazon_amis,"${var.region}")}"
  instance_type     = "m1.small"

  subnet_id                   = "${aws_subnet.public-One.id}"
  security_groups             = ["${aws_security_group.web.id}"]
  key_name                    = "${aws_key_pair.terraform.id}"
  associate_public_ip_address = true
  user_data                   = "${data.template_file.user_data.rendered}"

  tags {
    Name = "Docker-${count.index}"
  }
}

data "template_file" "user_data" {
  template = "${file("config/cloud-config.yml")}"
}
