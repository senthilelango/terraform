output "ec2" {
        value = "${aws_instance.test-1.public_ip}"
}

