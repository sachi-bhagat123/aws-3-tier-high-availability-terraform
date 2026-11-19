# VPC ID
output "vpc_id" {
  description = "ID of the main VPC"
  value       = aws_vpc.main.id
}

# External Load Balancer DNS
output "external_alb_dns" {
  description = "DNS name of the external Application Load Balancer"
  value       = aws_lb.external.dns_name
}

# Internal Load Balancer DNS
output "internal_alb_dns" {
  description = "DNS name of the internal Application Load Balancer"
  value       = aws_lb.internal.dns_name
}

# RDS Endpoint
output "rds_endpoint" {
  description = "Endpoint of the RDS database"
  value       = aws_db_instance.main.endpoint
  sensitive   = true
}

# Web Auto Scaling Group
output "web_asg_name" {
  description = "Name of the web Auto Scaling Group"
  value       = aws_autoscaling_group.web.name
}

# Application Auto Scaling Group
output "app_asg_name" {
  description = "Name of the application Auto Scaling Group"
  value       = aws_autoscaling_group.app.name
}

output "web_target_group_arn" {
  description = "ARN of the web application target group"
  value       = aws_lb_target_group.web_tg.arn
}
