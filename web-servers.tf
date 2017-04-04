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
      "sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D",
      "sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'",
      "sudo apt-get -y update && sudo apt-get -y install docker-engine",
      "echo 'thing1' >> thing1",
      "sudo docker run --name some-nginx -p 80:80 -v thing1:/usr/share/nginx/html:ro -d nginx",
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
      "sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D",
      "sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'",
      "sudo apt-get -y update && sudo apt-get -y install docker-engine",
      "echo 'thing2' >> thing2",
      "sudo docker run --name some-nginx -p 80:80 -v thing2:/usr/share/nginx/html:ro -d nginx",
    ]
  }
}
