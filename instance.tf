resource "aws_instance" "test-4" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  subnet_id = "${var.subnet_id}"
  tags = {
  Name = "test-4:"
}

  security_groups = ["${var.security_groups}"]
}
~
~
~
~
~
~

