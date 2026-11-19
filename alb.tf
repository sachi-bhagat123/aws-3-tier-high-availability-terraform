
# ---------------------------------------
# 1. WEB TARGET GROUP
# ---------------------------------------

resource "aws_lb_target_group" "web_tg" {
  name        = "${var.project_name}-web-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name        = "${var.project_name}-web-tg"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}


# ---------------------------------------
# 2. APPLICATION TARGET GROUP
# ---------------------------------------

resource "aws_lb_target_group" "app_tg" {
  name        = "${var.project_name}-app-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name        = "${var.project_name}-app-tg"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}


# ---------------------------------------
# 3. EXTERNAL APPLICATION LOAD BALANCER
# ---------------------------------------

resource "aws_lb" "external" {
  name               = "${var.project_name}-external-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  tags = {
    Name        = "${var.project_name}-external-alb"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}


# ---------------------------------------
# 4. INTERNAL APPLICATION LOAD BALANCER
# ---------------------------------------

resource "aws_lb" "internal" {
  name               = "${var.project_name}-internal-alb"
  internal           = true
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.internal_alb_sg.id
  ]

  subnets = [
    aws_subnet.app_private_1.id,
    aws_subnet.app_private_2.id
  ]

  tags = {
    Name        = "${var.project_name}-internal-alb"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}


# ---------------------------------------
# 5. EXTERNAL ALB LISTENER
# ---------------------------------------

resource "aws_lb_listener" "external_listener" {
  load_balancer_arn = aws_lb.external.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}


# ---------------------------------------
# 6. INTERNAL ALB LISTENER
# ---------------------------------------

resource "aws_lb_listener" "internal_listener" {
  load_balancer_arn = aws_lb.internal.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
