resource "aws_instance" "web-server-One" {
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

  tags {
    Name = "Docker"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]
  }
}

resource "aws_instance" "web-server-Two" {
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

  tags {
    Name = "Docker"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]
  }
}
