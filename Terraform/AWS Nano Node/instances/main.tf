#Create the UserData Template File
data "template_file" "user_data" {
  template = "${file("${path.module}/userdata.sh")}"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

#Create the Nano Instance using variables
resource "aws_instance" "nano_instance" {
  instance_type               = "${var.instance_type}"
  ami                         = "${data.aws_ami.ubuntu.id}"
  subnet_id                   = "${var.nano_subnet_id}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.nano_sg_id}"]
  associate_public_ip_address = true
  user_data                   = "${data.template_file.user_data.rendered}"

  tags = {
    Name = "${var.nano_instance_name}"
  }
}
