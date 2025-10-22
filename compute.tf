resource "aws_launch_template" "green_lt" {
  name_prefix   = var.name_launch_template_green
  image_id      = var.ami_id
  instance_type = var.instance_type
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = var.name_launch_template_green
      Environment = "green"
    }

  }
  user_data = base64encode(file("start-green.sh"))

  lifecycle {
    create_before_destroy = true
  }
}

# Create Launch Template for Blue Environment
resource "aws_launch_template" "blue_lt" {
  name_prefix   = var.name_launch_template_blue
  image_id      = var.ami_id
  instance_type = var.instance_type
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = var.name_launch_template_blue
      Environment = "blue"
    }

  }
  user_data = base64encode(file("start-blue.sh"))

  lifecycle {
    create_before_destroy = true
  }
}

# Create TG for Green Environment
resource "aws_lb_target_group" "green_tg" {
  name     = var.name_target_group_green
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = {
    Name = var.name_target_group_green
  }
}

# Create TG for Blue Environment
resource "aws_lb_target_group" "blue_tg" {
  name     = var.name_target_group_blue
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = {
    Name = var.name_target_group_blue
  }
}

# Create ASG for Green Environment
resource "aws_autoscaling_group" "green_asg" {
  name             = var.name_asg_green
  max_size         = 2
  min_size         = 1
  desired_capacity = 2
  launch_template {
    id      = aws_launch_template.green_lt.id
    version = "$Latest"
  }
  vpc_zone_identifier       = [data.aws_subnet.public_subnet_1.id, data.aws_subnet.public_subnet_2.id]
  target_group_arns         = [aws_lb_target_group.green_tg.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300
  termination_policies      = ["OldestInstance", "OldestLaunchConfiguration"]

  tag {
    key                 = "Name"
    value               = var.name_asg_green
    propagate_at_launch = true
  }

}

# Create ASG for Blue Environment
resource "aws_autoscaling_group" "blue_asg" {
  name             = var.name_asg_blue
  max_size         = 2
  min_size         = 1
  desired_capacity = 2
  launch_template {
    id      = aws_launch_template.blue_lt.id
    version = "$Latest"
  }
  vpc_zone_identifier       = [data.aws_subnet.public_subnet_1.id, data.aws_subnet.public_subnet_2.id]
  target_group_arns         = [aws_lb_target_group.blue_tg.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300
  termination_policies      = ["OldestInstance", "OldestLaunchConfiguration"]

  tag {
    key                 = "Name"
    value               = var.name_asg_blue
    propagate_at_launch = true
  }




}

# Create ALB for Green and Blue environments
resource "aws_lb" "alb" {
  name               = var.name_load_balancer
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.lb.id]
  subnets            = [data.aws_subnet.public_subnet_1.id, data.aws_subnet.public_subnet_2.id]

  enable_deletion_protection = false

  tags = {
    Name = var.name_load_balancer
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.blue_tg.arn
        weight = var.blue_weight # 100 initially
      }

      target_group {
        arn    = aws_lb_target_group.green_tg.arn
        weight = var.green_weight # 0 initially
      }


    }
  }
}


