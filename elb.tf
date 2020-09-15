resource "aws_elb" "csk-elb" {
  name = "csk-elb"
  subnets = ["${var.subnet_id}"]
  security_groups = ["${var.security_groups}"]
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
}


