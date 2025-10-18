resource "aws_launch_template" "cmtr_mg0vmvp0" {
  name_prefix   = var.launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ssh_key_name
  tags          = var.common_tags

  network_interfaces {
    security_groups       = [var.ec2_sg_id, var.http_sg_id]
    delete_on_termination = true
  }

  iam_instance_profile {
    name = var.instance_profile_name
  }

  user_data = base64encode(file("${path.module}/startup.sh"))

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "cmtr_mg0vmvp0_asg" {
  name                = var.asg_name
  max_size            = 2
  min_size            = 1
  desired_capacity    = 2
  vpc_zone_identifier = [var.public_subnet_a_id, var.public_subnet_b_id]

  launch_template {
    id      = aws_launch_template.cmtr_mg0vmvp0.id
    version = "$Latest"
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project_id
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
}

# Create Application Load Balancer
resource "aws_lb" "cmtr_mg0vmvp0_alb" {
  name               = var.lb_name
  load_balancer_type = "application"
  security_groups    = [var.cmtr-mg0vmvp0-sglb]
  subnets = [
    var.public_subnet_a_id,
    var.public_subnet_b_id
  ]
  idle_timeout = 60

  tags = var.common_tags
}

resource "aws_lb_target_group" "cmtr_mg0vmvp0_tg" {
  name     = "cmtr-mg0vmvp0-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = var.common_tags
}


resource "aws_lb_listener" "cmtr_mg0vmvp0_listener" {
  load_balancer_arn = aws_lb.cmtr_mg0vmvp0_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cmtr_mg0vmvp0_tg.arn
  }
}

resource "aws_autoscaling_attachment" "cmtr_mg0vmvp0_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.cmtr_mg0vmvp0_asg.name
  lb_target_group_arn    = aws_lb_target_group.cmtr_mg0vmvp0_tg.arn
}



