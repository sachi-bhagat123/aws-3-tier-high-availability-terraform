
# ---------------------------------------
# 1. WEB LAUNCH TEMPLATE
# ---------------------------------------

resource "aws_launch_template" "web" {
  name_prefix   = "${var.project_name}-web-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_instance_profile.name
  }

  user_data = base64encode(
    templatefile("${path.module}/install-web.sh", {
      internal_alb_dns = aws_lb.internal.dns_name
    })
  )
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name        = "${var.project_name}-web"
      Environment = "Learning"
      ManagedBy   = "Terraform"
    }
  }

  tags = {
    Name = "${var.project_name}-web-launch-template"
  }
}


# ---------------------------------------
# 2. WEB AUTO SCALING GROUP
# ---------------------------------------

resource "aws_autoscaling_group" "web" {
  name             = "${var.project_name}-web-asg"
  min_size         = 2
  desired_capacity = 2
  max_size         = 4

  vpc_zone_identifier = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  target_group_arns = [
    aws_lb_target_group.web_tg.arn
  ]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "${var.project_name}-web-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Learning"
    propagate_at_launch = true
  }

  tag {
    key                 = "ManagedBy"
    value               = "Terraform"
    propagate_at_launch = true
  }
}


# ---------------------------------------
# 3. WEB CPU AUTO SCALING POLICY
# ---------------------------------------

resource "aws_autoscaling_policy" "web_cpu" {
  name                   = "${var.project_name}-web-cpu"
  autoscaling_group_name = aws_autoscaling_group.web.name

  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 180

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50
  }
}
