  name_prefix          = "example-launchconfig"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  security_groups      = ["${var.security_groups}"]
  key_name             = "${var.key_name}"
  iam_instance_profile = "${var.iam_instance_profile}"
  user_data = <<-EOF
            #! /bin/bash
            sudo yum update
            sudo yum install -y httpd
            sudo service httpd start
            sudo service httpd enable
            echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
            EOF
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                 = "example-autoscaling"
  vpc_zone_identifier  = ["${var.subnet_id}"]
  launch_configuration = "${aws_launch_configuration.example-launchconfig.name}"
  min_size             = 2
  max_size             = 2
  load_balancers = ["${aws_elb.chennai.name}"]


  tag {
      key = "Name"
      value = "cskinstance"
      propagate_at_launch = true
  }



}

resource "aws_route53_zone" "private" {
 name = "${var.private_zone}"
  vpc {
     vpc_id = "${var.vpc_id}"
  }




}


