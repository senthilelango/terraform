resource "aws_launch_configuration" "example-launchconfig" {
  name_prefix          = "example-launchconfig"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  security_groups      = ["${var.security_groups}"]
  key_name             = "${var.key_name}"
}

resource "aws_autoscaling_group" "example-autoscaling" {
  name                 = "example-autoscaling"
  vpc_zone_identifier  = ["${var.subnet_id}"]
  launch_configuration = "${aws_launch_configuration.example-launchconfig.name}"
  min_size             = 2
  max_size             = 2
  health_check_grace_period = 300
  health_check_type = "ELB"
  load_balancers = ["${aws_elb.csk-elb.name}"]
  force_delete = true

  tag {
      key = "Name"
      value = "cskinstance"
      propagate_at_launch = true
  }

}

data "aws_iam_role" "eks-role" {
  name = "eks-role"

}



resource "aws_iam_role_policy_attachment" "test-attach" {
      role = data.aws_iam_role.eks-role.name
      policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

