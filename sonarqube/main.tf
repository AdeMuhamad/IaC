provider "aws" {
  profile                 = "terraform"
  shared_credentials_file = "/home/bmduser/.aws/credentials"
  region                  = "${var.region}"
}

resource "aws_instance" "sonarqube" {
  ami               = "${var.ami}"
  instance_type     = "${var.instance_type}"
  key_name          = "${var.key_name}"
  security_groups   = "${var.security_groups}"
  availability_zone = "${var.availability_zone}"
  subnet_id         = "${var.subnet_id}"

  root_block_device {
    volume_type = "${var.volume_type}"
    volume_size = "${var.volume_size}"
  }

  ebs_block_device {
    device_name = "${var.device_name}"
  }

  tags {
    Name = "sonarqube"
  }
}
