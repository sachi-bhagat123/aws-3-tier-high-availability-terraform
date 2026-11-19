
# ---------------------------------------
# 1. RDS DB SUBNET GROUP
# ---------------------------------------

resource "aws_db_subnet_group" "main" {
  name = "${var.project_name}-db-subnet-group"

  subnet_ids = [
    aws_subnet.db_private_1.id,
    aws_subnet.db_private_2.id
  ]

  tags = {
    Name        = "${var.project_name}-db-subnet-group"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}


# ---------------------------------------
# 2. RDS DATABASE INSTANCE
# ---------------------------------------

resource "aws_db_instance" "main" {
  identifier = "${var.project_name}-db"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  port = 3306

  db_subnet_group_name = aws_db_subnet_group.main.name

  vpc_security_group_ids = [
    aws_security_group.db_sg.id
  ]

  publicly_accessible = false

  # Cost-saving setting for learning
  multi_az = false

  # Reduced backup retention
  backup_retention_period = 1

  storage_encrypted = true

  auto_minor_version_upgrade = true

  deletion_protection = false

  skip_final_snapshot = true

  tags = {
    Name        = "${var.project_name}-db"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
